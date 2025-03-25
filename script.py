import hashlib
import json
import os
import webbrowser
from http.server import BaseHTTPRequestHandler, HTTPServer
from pathlib import Path
from urllib.parse import parse_qsl, urlencode

import requests

# This is from the api documentation and depends on which api you're using
SCOPES = [
    "https://www.googleapis.com/auth/gmail.modify"
]

HOST = 'localhost'
PORT = 8080

class RequestHandler(BaseHTTPRequestHandler):
    # Handling our get request
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text/html")
        self.end_headers()

        self.server: "Server"
        self.server.query_params = dict(parse_qsl(self.path.split("?")[1]))
        self.wfile.write(b"<h1>Authorised!</h1>")

class Server(HTTPServer):
    def __init__(self, host: str, port: int) -> None:
        super().__init__((host, port), RequestHandler)
        self.query_params: dict[str, str] = {}

# Function that takes in a dict of str types and returns a dict of str types
def authorise(secrets: dict[str, str]) -> dict[str, str]:
    redirect_url = f"{secrets['redirect_uris'][0]}:{PORT}"

    params = {
        "response_type": "code", # auth codes
        "client_id": secrets["client_id"],
        "redirect_uri": redirect_url,
        "scope": " ".join(SCOPES),
        # Prevents cross site request forgery attacks where someone can intercept a request in the middle and send a request back that looks legit but actually isnt. 
        #This then checks if the state matches and then we'll know that it's coming from the same place
        "state": hashlib.sha256(os.urandom(1824)).hexdigest(), 
        "access_type": "offline"
    }
    # This allows us to build a url
    url = f"{secrets['auth_uri']}?{urlencode(params)}"

    if not webbrowser.open(url):
        raise RuntimeError("Failed to open browser")
    
    server = Server(HOST, PORT)
    try:
        server.handle_request()
    finally:
        server.server_close()
    if params["state"] != server.query_params["state"]:
        raise RuntimeError("Invalid state")

    code = server.query_params["code"]

    params = {
        "grant_type": "authorisation_code",
        "client_id": secrets["client_id"],
        "client_secret": secrets["client_secrets"],
        "redirect_uri": redirect_url,
        "code": code,
        }
    with requests.post(
        secrets["token_uri"],
        data=params,
        headers={"Content-Type": "application/x-www-form-urlencode"},
    ) as response:
        if response.status_code != 200:
            raise RuntimeError("Failed to authorise")
        return response.json()

if __name__ == "__main__":
    # Loading Json script, reading the text. Everything in and after 'installed'
    secrets = json.loads(Path('secrets.json').read_text())['installed']
    tokens = authorise(secrets)
    print(f'Tokens: {tokens}')
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
    # Allows the app to view, modify, and delete Gmail messages.
    "https://www.googleapis.com/auth/gmail.modify",
    # Allows the app to send emails as the user.
    "https://www.googleapis.com/auth/gmail.send",
    # Allows the app to view calendar events.
    "https://www.googleapis.com/auth/calendar.readonly",
    # Allows the app to create, view, and edit events in the user’s calendar.
    "https://www.googleapis.com/auth/calendar",
    # Full access to the user’s Google Contacts.
    "https://www.googleapis.com/auth/contacts",
    # This scope allows the app to access the user's email address, which can be useful for user management in your app.
    "https://www.googleapis.com/auth/userinfo.email",
    # This scope allows the app to access basic information about the user’s Google profile (e.g., name, email address, profile picture).
    "https://www.googleapis.com/auth/userinfo.profile"
]
HOST = 'localhost'
PORT = 8080

class RequestHandler(BaseHTTPRequestHandler):
    # Handling our get request
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text/html")
        self.end_headers()
        # Provide a server instance so we can set the query params on the server 
        # so we something to reference back to on the other side
        self.server: "Server"
        self.server.query_params = dict(parse_qsl(self.path.split("?")[1]))
        self.wfile.write(b"<h1>Buddy Mobile Authorised!</h1>")

class Server(HTTPServer):
    def __init__(self, host: str, port: int) -> None:
        super().__init__((host, port), RequestHandler)
        self.query_params: dict[str, str] = {}

# Function that takes in a dict of str types and returns a dict of str types
def authorise(secrets: dict[str, str]) -> dict[str, str]:
    # You can use port 80 if you're hosting from your site. This is just for localhost
    redirect_uri = f"{secrets['redirect_uris'][0]}:{PORT}"
    # redirect_uri = secrets['redirect_uris'][0]


    params = {
        "response_type": "code", # auth codes
        "client_id": secrets["client_id"],
        "redirect_uri": redirect_uri,
        "scope": " ".join(SCOPES),
        # Prevents cross site request forgery attacks where someone can intercept a request in the middle and send a request back that looks legit but actually isnt. 
        #This then checks if the state matches and then we'll know that it's coming from the same place
        "state": hashlib.sha256(os.urandom(1024)).hexdigest(), 
        "access_type": "offline"
    }
    # Urlencode turns the dict parameters into a query str. 
    # This allows us to build a full url
    url = f"{secrets['auth_uri']}?{urlencode(params)}"
    
    # We are using the web browser library to open the url
    if not webbrowser.open(url):
        raise RuntimeError("Failed to open browser")
    
    # Web server
    server = Server(HOST, PORT)
    try:
        server.handle_request()
    finally:
        server.server_close()
    if params["state"] != server.query_params["state"]:
        raise RuntimeError("Invalid state")

    code = server.query_params["code"]

    params = {
        "grant_type": "authorization_code",
        "client_id": secrets["client_id"],
        "client_secret": secrets["client_secret"],
        "redirect_uri": redirect_uri,
        "code": code,
        }
    
    # Loading out token uri
    with requests.post(
        secrets["token_uri"],
        # Sending data through as params and as an x-www-form-urlencode
        data=params,
        headers={"Content-Type": "application/x-www-form-urlencoded"}

    ) as response:
        if response.status_code != 200:
            # print(f"Error Response: {response.text}")
            raise RuntimeError("Failed to authorise")
        
        # Response.json() are out tokens
        return response.json()

def check_access_token(access_token: str) -> dict[str, str]:
    with requests.post(
        f"https://www.googleapis.com/oauth2/v3/tokeninfo?access_token={access_token}"
    ) as response:
        if response.status_code != 200:
            raise RuntimeError("Failed to check access toekn")
        
        return response.json()
    
def refresh_token(secrets: dict[str, str], refresh_token:str) -> dict[str, str]:
    params = {
        "grant_type": "refresh_token",
        "client_id": secrets["client_id"],
        "client_secret": secrets["client_secret"],
        "refresh_token": refresh_token,
        }
    with requests.post(
        secrets["token_uri"],
        data=params,
        headers={"Content-Type": "application/x-www-form-urlencoded"},
    ) as response:
        if response.status_code != 200:
            raise RuntimeError("Failed to refresh token")
        
        return response.json()
    
if __name__ == "__main__":
    # Loading Json script, reading the text. Everything in and after 'installed'
    secrets = json.loads(Path('python/mobile_secrets.json').read_text())['installed']
    tokens = authorise(secrets)
    print(f'Tokens: {tokens}')

    token_info = check_access_token(tokens["access_token"])
    print(f"\nToken info: {token_info}")

    # You'd need to store the refreshed token if you want to use it because when 
    # you refresh your token you don't get the refreshed token back
    # so you need to store it if you want to refresh it
    # You can use the token info to see if your token is still valid
    # if its not valid you can refresh you acces token to get a new one
    # if you can refresh it, you'll need to re autho from scratch
    refreshed_tokens = refresh_token(secrets, tokens["refresh_token"])
    print(f"\nRefreshed tokens: {refreshed_tokens}")
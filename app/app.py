from http.server import BaseHTTPRequestHandler, HTTPServer
import os
import json


class SimpleServer(BaseHTTPRequestHandler):
    def _set_response(self):
        self.send_response(200)
        self.send_header('Content-type', 'application/json')
        self.end_headers()

    def do_GET(self):
        self._set_response()
        self.wfile.write(json.dumps({
            "message": "Hello world",
            "node": os.getenv('NODE')
        }).encode('utf-8'))


def run():
    httpd = HTTPServer(('', 8080), SimpleServer)
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        pass
    httpd.server_close()


if __name__ == '__main__':
    run()

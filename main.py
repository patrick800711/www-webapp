from flask import Flask, render_template
import socket

hostname = socket.gethostname()
localIP = socket.gethostbyname(hostname)

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html', hostname=hostname, localIP=localIP)

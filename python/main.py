#!/usr/bin/env python3
"""
Flask API Server Template

A simple Flask web server with example routes and API endpoints.
"""

import os
from datetime import datetime

from flask import Flask, jsonify, render_template_string

app = Flask(__name__)

# Configuration
PORT = int(os.getenv("PORT", 5000))
DEBUG = os.getenv("DEBUG", "True").lower() == "true"

# HTML template for home page
HOME_TEMPLATE = """
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Python Flask API</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background: #f5f5f5;
        }
        .container {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h1 { color: #3776ab; margin-top: 0; }
        .endpoint {
            background: #f8f9fa;
            padding: 15px;
            margin: 10px 0;
            border-radius: 5px;
            border-left: 4px solid #3776ab;
        }
        .method {
            display: inline-block;
            background: #3776ab;
            color: white;
            padding: 2px 8px;
            border-radius: 3px;
            font-size: 12px;
            font-weight: bold;
        }
        code {
            background: #e9ecef;
            padding: 2px 6px;
            border-radius: 3px;
            font-size: 14px;
        }
        .status {
            color: #28a745;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🐍 Python Flask API Server</h1>
        <p>Welcome to your Python development environment! This Flask server is <span class="status">running</span> and ready to handle requests.</p>

        <h2>Available Endpoints:</h2>

        <div class="endpoint">
            <span class="method">GET</span>
            <code>/</code>
            <p>This page - API documentation</p>
        </div>

        <div class="endpoint">
            <span class="method">GET</span>
            <code>/api/hello</code>
            <p>Returns a friendly JSON greeting</p>
        </div>

        <div class="endpoint">
            <span class="method">GET</span>
            <code>/api/health</code>
            <p>Health check endpoint for monitoring</p>
        </div>

        <div class="endpoint">
            <span class="method">GET</span>
            <code>/api/time</code>
            <p>Returns the current server time</p>
        </div>

        <h2>Quick Start:</h2>
        <ul>
            <li>Edit <code>main.py</code> to add your own routes and handlers</li>
            <li>Run <code>python main.py</code> to start the server</li>
            <li>Run <code>pytest</code> to run tests</li>
            <li>Use <code>pip install package-name</code> to add dependencies</li>
        </ul>

        <h2>Environment:</h2>
        <ul>
            <li>Flask {{ flask_version }}</li>
            <li>Running in {{ mode }} mode</li>
            <li>Port: {{ port }}</li>
        </ul>
    </div>
</body>
</html>
"""


@app.route("/")
def home():
    """Home page with API documentation."""
    import flask

    return render_template_string(
        HOME_TEMPLATE,
        flask_version=flask.__version__,
        mode="debug" if DEBUG else "production",
        port=PORT,
    )


@app.route("/api/hello")
def hello():
    """Return a friendly JSON greeting."""
    return jsonify(
        {
            "message": "Hello from Python Flask! 👋",
            "timestamp": datetime.now().isoformat(),
            "status": "success",
        }
    )


@app.route("/api/health")
def health():
    """Health check endpoint."""
    return jsonify(
        {
            "status": "healthy",
            "version": "1.0.0",
            "timestamp": datetime.now().isoformat(),
        }
    )


@app.route("/api/time")
def get_time():
    """Return the current server time."""
    now = datetime.now()
    return jsonify(
        {
            "timestamp": now.isoformat(),
            "unix": int(now.timestamp()),
            "formatted": now.strftime("%Y-%m-%d %H:%M:%S"),
            "timezone": "UTC",
        }
    )


@app.errorhandler(404)
def not_found(error):
    """Handle 404 errors."""
    return jsonify(
        {
            "error": "Not Found",
            "message": "The requested resource does not exist",
            "status": 404,
        }
    ), 404


@app.errorhandler(500)
def internal_error(error):
    """Handle 500 errors."""
    return jsonify(
        {
            "error": "Internal Server Error",
            "message": "An unexpected error occurred",
            "status": 500,
        }
    ), 500


if __name__ == "__main__":
    print("🚀 Starting Flask server...")
    print(f"📝 Server running on http://localhost:{PORT}")
    print(f"📝 Mode: {'Debug' if DEBUG else 'Production'}")
    print("")
    print("Available endpoints:")
    print("   GET  /              - Home page")
    print("   GET  /api/hello     - Hello API")
    print("   GET  /api/health    - Health check")
    print("   GET  /api/time      - Current time")
    print("")

    app.run(host="0.0.0.0", port=PORT, debug=DEBUG)

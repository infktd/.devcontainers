package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"os"
	"time"
)

type Response struct {
	Message   string    `json:"message"`
	Timestamp time.Time `json:"timestamp"`
	Status    string    `json:"status"`
}

type HealthResponse struct {
	Status  string `json:"status"`
	Version string `json:"version"`
}

func main() {
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	// Define routes
	http.HandleFunc("/", handleHome)
	http.HandleFunc("/api/hello", handleHello)
	http.HandleFunc("/api/health", handleHealth)

	// Start server
	addr := fmt.Sprintf(":%s", port)
	log.Printf("🚀 Server starting on http://localhost%s\n", addr)
	log.Printf("📝 Available endpoints:")
	log.Printf("   GET  /              - Home page")
	log.Printf("   GET  /api/hello     - Hello API")
	log.Printf("   GET  /api/health    - Health check")
	log.Printf("\n")

	if err := http.ListenAndServe(addr, nil); err != nil {
		log.Fatalf("❌ Server failed to start: %v", err)
	}
}

func handleHome(w http.ResponseWriter, r *http.Request) {
	if r.URL.Path != "/" {
		http.NotFound(w, r)
		return
	}

	w.Header().Set("Content-Type", "text/html; charset=utf-8")
	html := `
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Go API Server</title>
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
        h1 { color: #00ADD8; margin-top: 0; }
        .endpoint {
            background: #f8f9fa;
            padding: 15px;
            margin: 10px 0;
            border-radius: 5px;
            border-left: 4px solid #00ADD8;
        }
        .method {
            display: inline-block;
            background: #00ADD8;
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
    </style>
</head>
<body>
    <div class="container">
        <h1>🚀 Go API Server</h1>
        <p>Welcome to your Go development environment! This server is running and ready to handle requests.</p>

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

        <h2>Quick Start:</h2>
        <ul>
            <li>Edit <code>main.go</code> to add your own routes and handlers</li>
            <li>Run <code>go run main.go</code> to start the server</li>
            <li>Run <code>go build</code> to compile your application</li>
            <li>Run <code>go test ./...</code> to run tests</li>
        </ul>
    </div>
</body>
</html>
`
	fmt.Fprint(w, html)
}

func handleHello(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodGet {
		http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
		return
	}

	response := Response{
		Message:   "Hello from Go! 👋",
		Timestamp: time.Now(),
		Status:    "success",
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(response)
}

func handleHealth(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodGet {
		http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
		return
	}

	response := HealthResponse{
		Status:  "healthy",
		Version: "1.0.0",
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(response)
}

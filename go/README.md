# Go Development Template

A simple Go HTTP server template ready for development in a devcontainer environment.

## 🚀 Quick Start

### Running the Application

```bash
# Run the application directly
go run main.go

# Build the application
go build -o app

# Run the built binary
./app
```

The server will start on `http://localhost:8080`

## 📋 Available Endpoints

- **GET /** - Home page with API documentation
- **GET /api/hello** - Returns a JSON greeting
- **GET /api/health** - Health check endpoint

## 🛠️ Development

### Adding Dependencies

```bash
# Add a new dependency
go get github.com/gorilla/mux

# Update go.mod and go.sum
go mod tidy
```

### Running Tests

```bash
# Run all tests
go test ./...

# Run tests with coverage
go test -cover ./...

# Run tests with verbose output
go test -v ./...
```

### Code Formatting

```bash
# Format all Go files
go fmt ./...

# Run the linter
go vet ./...
```

## 📁 Project Structure

```
go/
├── main.go          # Main application entry point
├── go.mod           # Go module definition
├── go.sum           # Dependency checksums (generated)
└── README.md        # This file
```

## 🔧 Common Go Commands

```bash
# Initialize a new module
go mod init github.com/yourusername/projectname

# Download dependencies
go mod download

# Remove unused dependencies
go mod tidy

# View module documentation
go doc

# Install development tools
go install golang.org/x/tools/gopls@latest
go install github.com/go-delve/delve/cmd/dlv@latest
```

## 🎯 Building for Production

```bash
# Build for current platform
go build -o app

# Build for Linux
GOOS=linux GOARCH=amd64 go build -o app-linux

# Build for Windows
GOOS=windows GOARCH=amd64 go build -o app.exe

# Build with optimizations
go build -ldflags="-s -w" -o app
```

## 📚 Useful Resources

- [Go Documentation](https://golang.org/doc/)
- [Effective Go](https://golang.org/doc/effective_go)
- [Go by Example](https://gobyexample.com/)
- [Go Standard Library](https://pkg.go.dev/std)

## 💡 Tips

- Use `go fmt` to automatically format your code
- Run `go vet` to catch common errors
- Use `go mod tidy` to keep your dependencies clean
- Add tests in files ending with `_test.go`
- Use interfaces for better testability
- Follow the [Go Code Review Comments](https://github.com/golang/go/wiki/CodeReviewComments)

## 🐛 Debugging

The delve debugger (`dlv`) is pre-installed in the devcontainer:

```bash
# Start debugging
dlv debug

# Debug with arguments
dlv debug -- --port=3000

# Attach to running process
dlv attach <pid>
```

## 🌐 Environment Variables

Set environment variables to configure the application:

```bash
# Set custom port
export PORT=3000
go run main.go
```

## 📝 Next Steps

1. Edit `main.go` to add your own routes and handlers
2. Create additional packages for organizing your code
3. Add tests in `*_test.go` files
4. Update `go.mod` with your actual module path
5. Add middleware for logging, authentication, etc.
6. Consider using a router like [gorilla/mux](https://github.com/gorilla/mux) or [chi](https://github.com/go-chi/chi)

Happy coding! 🎉
#!/bin/bash
set -e

echo "🚀 Setting up Go development environment..."

# Navigate to the Go project directory
cd /workspace/go

# Check if Go is available
if ! command -v go &> /dev/null; then
    echo "❌ Go is not installed."
    exit 1
fi

echo "✅ Go version: $(go version)"

# Initialize Go module if go.mod doesn't exist
if [ ! -f "go.mod" ]; then
    echo "📦 Initializing Go module..."
    go mod init github.com/yourusername/go-project
else
    echo "✅ Go module already initialized"
fi

# Download dependencies
if [ -f "go.mod" ]; then
    echo "📦 Downloading Go dependencies..."
    go mod download
    go mod tidy
fi

# Install common Go tools if not already installed
echo "🔧 Installing Go development tools..."
go install golang.org/x/tools/gopls@latest 2>/dev/null || echo "gopls already installed"
go install github.com/go-delve/delve/cmd/dlv@latest 2>/dev/null || echo "dlv already installed"
go install honnef.co/go/tools/cmd/staticcheck@latest 2>/dev/null || echo "staticcheck already installed"

# Set up Git safe directory
git config --global --add safe.directory /workspace

echo "✨ Go development environment setup complete!"
echo ""
echo "📝 Quick start:"
echo "   cd go"
echo "   go run main.go      # Run the application"
echo "   go build            # Build the application"
echo "   go test ./...       # Run tests"
echo ""

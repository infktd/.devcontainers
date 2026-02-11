#!/bin/bash
set -e

echo "🚀 Setting up Next.js + shadcn/ui environment..."

# Navigate to the Next.js project directory
cd /workspace/nextjs-shadcn

# Check if Bun is available
if ! command -v bun &> /dev/null; then
    echo "❌ Bun is not installed. Installing..."
    curl -fsSL https://bun.sh/install | bash
    export PATH="$HOME/.bun/bin:$PATH"
fi

echo "✅ Bun version: $(bun --version)"

# Install dependencies if package.json exists and node_modules doesn't
if [ -f "package.json" ]; then
    if [ ! -d "node_modules" ]; then
        echo "📦 Installing dependencies with Bun..."
        bun install
    else
        echo "✅ Dependencies already installed"
    fi
else
    echo "⚠️  No package.json found. Skipping dependency installation."
fi

# Set up Git safe directory
git config --global --add safe.directory /workspace

# Create necessary directories if they don't exist
mkdir -p src/app
mkdir -p src/components/ui
mkdir -p src/lib
mkdir -p public

echo "✨ Next.js + shadcn/ui environment setup complete!"
echo ""
echo "📝 Quick start:"
echo "   cd nextjs-shadcn"
echo "   bun install         # Install dependencies"
echo "   bun run dev         # Start development server"
echo ""
echo "🎨 To add shadcn/ui components:"
echo "   bunx shadcn-ui@latest add button"
echo ""

#!/bin/bash
set -e

echo "🚀 Setting up Python development environment..."

# Navigate to the Python project directory
cd /workspace/python

# Check if Python is available
if ! command -v python3 &> /dev/null; then
    echo "❌ Python is not installed."
    exit 1
fi

echo "✅ Python version: $(python3 --version)"

# Create virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    echo "🔧 Creating virtual environment..."
    python3 -m venv venv
else
    echo "✅ Virtual environment already exists"
fi

# Activate virtual environment and install dependencies
echo "📦 Installing Python dependencies..."
source venv/bin/activate

# Upgrade pip
pip install --upgrade pip setuptools wheel

# Install dependencies from requirements.txt if it exists
if [ -f "requirements.txt" ]; then
    echo "📦 Installing packages from requirements.txt..."
    pip install -r requirements.txt
else
    echo "⚠️  No requirements.txt found. Skipping package installation."
fi

# Install development tools
echo "🔧 Installing development tools..."
pip install pylint black flake8 mypy pytest

# Set up Git safe directory
git config --global --add safe.directory /workspace

echo "✨ Python development environment setup complete!"
echo ""
echo "📝 Quick start:"
echo "   cd python"
echo "   source venv/bin/activate    # Activate virtual environment"
echo "   python main.py              # Run the application"
echo "   pytest                      # Run tests"
echo ""
echo "💡 The virtual environment is located at: python/venv"
echo ""

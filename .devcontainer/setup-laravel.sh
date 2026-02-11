#!/bin/bash
set -e

echo "🚀 Setting up Laravel development environment..."

# Navigate to the Laravel project directory
cd /workspace/laravel

# Check if PHP is available
if ! command -v php &> /dev/null; then
    echo "❌ PHP is not installed."
    exit 1
fi

echo "✅ PHP version: $(php -v | head -n 1)"

# Check if Composer is available
if ! command -v composer &> /dev/null; then
    echo "❌ Composer is not installed."
    exit 1
fi

echo "✅ Composer version: $(composer --version)"

# Check if a Laravel project already exists
if [ -f "composer.json" ]; then
    echo "✅ Laravel project already exists"

    # Install dependencies if vendor directory doesn't exist
    if [ ! -d "vendor" ]; then
        echo "📦 Installing Composer dependencies..."
        composer install --no-interaction --prefer-dist --optimize-autoloader
    else
        echo "✅ Dependencies already installed"
    fi

    # Check if .env file exists, if not copy from .env.example
    if [ ! -f ".env" ]; then
        if [ -f ".env.example" ]; then
            echo "📝 Creating .env file from .env.example..."
            cp .env.example .env
            php artisan key:generate
        else
            echo "⚠️  No .env or .env.example found"
        fi
    else
        echo "✅ .env file exists"
    fi

    # Run migrations if database is configured
    if grep -q "DB_CONNECTION=sqlite" .env 2>/dev/null; then
        echo "📊 Setting up SQLite database..."
        touch database/database.sqlite
        php artisan migrate --force 2>/dev/null || echo "⚠️  Migrations skipped (run manually if needed)"
    fi

    # Clear and cache configuration
    echo "🔧 Optimizing Laravel..."
    php artisan config:clear
    php artisan cache:clear
    php artisan view:clear

else
    echo "⚠️  No Laravel project found. You can create one with:"
    echo "   composer create-project laravel/laravel ."
    echo "   or"
    echo "   laravel new project-name"
fi

# Set up Git safe directory
git config --global --add safe.directory /workspace

# Install Node dependencies if package.json exists
if [ -f "package.json" ]; then
    echo "📦 Installing Node dependencies..."
    if command -v npm &> /dev/null; then
        npm install
    fi
else
    echo "⚠️  No package.json found. Vite/Mix assets not installed."
fi

echo "✨ Laravel development environment setup complete!"
echo ""
echo "📝 Quick start:"
echo "   cd laravel"
echo "   composer install              # Install PHP dependencies"
echo "   cp .env.example .env          # Create environment file"
echo "   php artisan key:generate      # Generate app key"
echo "   php artisan migrate           # Run migrations"
echo "   php artisan serve             # Start development server"
echo ""
echo "🎨 For frontend assets:"
echo "   npm install                   # Install Node dependencies"
echo "   npm run dev                   # Start Vite dev server"
echo ""
echo "📚 Useful commands:"
echo "   php artisan tinker            # Laravel REPL"
echo "   php artisan make:model Post   # Create model"
echo "   php artisan make:controller   # Create controller"
echo "   php artisan route:list        # List routes"
echo ""

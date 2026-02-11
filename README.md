# Multi-Stack Devcontainer Templates

A comprehensive collection of development environment templates with support for **Next.js**, **Go**, **Python**, and **Laravel** stacks. This repository uses devcontainer variants, allowing you to choose your preferred development stack when opening the project in VS Code or Zed.

##  Features

- **Multiple Development Stacks**: Choose from Next.js (with shadcn/ui), Go, Python, or Laravel
- **Variant Selection**: Pick your stack when opening in VS Code or Zed
- **Fully Isolated**: Each variant is self-contained with no shared dependencies
- **Production Ready**: Includes best practices and modern tooling
- **Fast Setup**: Automated dependency installation and configuration
- **IDE Optimized**: Pre-configured extensions and settings for each stack

##  Available Templates

### Next.js + shadcn/ui + Tailwind CSS
- **Runtime**: Node.js 20 with Bun package manager
- **Framework**: Next.js 14 with TypeScript
- **Styling**: Tailwind CSS 3.4 + shadcn/ui components
- **Features**: Hot reload, TypeScript, ESLint, Prettier
- **Port**: 3000

### Go Development Environment
- **Runtime**: Go 1.21
- **Features**: Basic HTTP server, Go modules, debugging tools
- **Tools**: gopls, delve, staticcheck
- **Port**: 8080

### Python Development Environment
- **Runtime**: Python 3.11
- **Framework**: Flask web server
- **Features**: Virtual environment, pytest, linting tools
- **Tools**: pylint, black, flake8, mypy
- **Port**: 5000

### Laravel Development Environment
- **Runtime**: PHP 8.2 with Composer
- **Framework**: Laravel 11
- **Features**: Eloquent ORM, Blade templates, Artisan CLI
- **Tools**: Composer, NPM, Laravel installer
- **Port**: 8000

##  Getting Started

### Prerequisites

- [Docker](https://www.docker.com/products/docker-desktop) installed
- [VS Code](https://code.visualstudio.com/) with [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
  
  **OR**
  
- [Zed](https://zed.dev/) with devcontainer support

### Using with VS Code

1. **Clone this repository**:
   ```bash
   git clone https://github.com/yourusername/devcontainer-templates.git
   cd devcontainer-templates
   ```

2. **Open in VS Code**:
   ```bash
   code .
   ```

3. **Select a variant**:
   - VS Code will prompt you to reopen in a container
   - Choose your preferred variant:
     - `Next.js + shadcn/ui + Tailwind CSS`
     - `Go Development Environment`
     - `Python Development Environment`
     - `Laravel Development Environment`

4. **Wait for setup**:
   - The devcontainer will build and run the setup script
   - Dependencies will be automatically installed

5. **Start developing**!

### Using with Zed

1. **Clone this repository**:
   ```bash
   git clone https://github.com/yourusername/devcontainer-templates.git
   cd devcontainer-templates
   ```

2. **Open in Zed**:
   ```bash
   zed .
   ```

3. **Select a variant** when prompted

4. **Start developing**!

### Manual Variant Selection

If you want to pre-select a variant, set the environment variable before opening:

```bash
# For Next.js
export DEVCONTAINER_VARIANT=nextjs-shadcn
code .

# For Go
export DEVCONTAINER_VARIANT=go
code .

# For Python
export DEVCONTAINER_VARIANT=python
code .

# For Laravel
export DEVCONTAINER_VARIANT=laravel
code .
```

## 📂 Repository Structure

```
devcontainer-templates/
├── .devcontainer/
│   ├── devcontainer.json          # Main devcontainer config with variants
│   ├── Dockerfile                 # Multi-stage Dockerfile for all variants
│   ├── setup-nextjs-shadcn.sh    # Next.js setup script
│   ├── setup-go.sh                # Go setup script
│   └── setup-python.sh            # Python setup script
├── nextjs-shadcn/
│   ├── src/
│   │   ├── app/                   # Next.js app directory
│   │   ├── components/            # React components
│   │   └── lib/                   # Utility functions
│   ├── config/
│   │   ├── tailwind.config.ts     # Tailwind configuration
│   │   ├── postcss.config.mjs     # PostCSS configuration
│   │   └── components.json        # shadcn/ui configuration
│   ├── package.json               # Node dependencies
│   ├── tsconfig.json              # TypeScript configuration
│   ├── next.config.ts             # Next.js configuration
│   └── .env.example               # Environment variables template
├── go/
│   ├── main.go                    # Go HTTP server
│   ├── go.mod                     # Go module definition
│   └── README.md                  # Go-specific documentation
├── python/
│   ├── main.py                    # Flask application
│   ├── requirements.txt           # Python dependencies
│   └── README.md                  # Python-specific documentation
└── laravel/
    ├── composer.json              # PHP dependencies
    ├── .env.example               # Environment variables template
    └── README.md                  # Laravel-specific documentation
```

##  Quick Start Commands

### Next.js Template

```bash
cd nextjs-shadcn
bun install                        # Install dependencies
bun run dev                        # Start dev server
bunx shadcn-ui@latest add button   # Add shadcn/ui components
```

### Go Template

```bash
cd go
go run main.go                     # Run the application
go build                           # Build the application
go test ./...                      # Run tests
```

### Python Template

```bash
cd python
source venv/bin/activate           # Activate virtual environment
python main.py                     # Run the application
pytest                             # Run tests
```

### Laravel Template

```bash
cd laravel
composer install                   # Install dependencies
php artisan serve                  # Start dev server
php artisan migrate                # Run migrations
```

##  Customization

### Adding New Routes/Endpoints

Each template includes example routes that you can modify:

- **Next.js**: Edit `nextjs-shadcn/src/app/page.tsx` or add new routes in `src/app/`
- **Go**: Edit `go/main.go` to add new HTTP handlers
- **Python**: Edit `python/main.py` to add new Flask routes
- **Laravel**: Use `php artisan make:controller` to create controllers

### Installing Additional Dependencies

- **Next.js**: `bun add package-name`
- **Go**: `go get package-url`
- **Python**: `pip install package-name` (then update `requirements.txt`)
- **Laravel**: `composer require package-name`

### Modifying the Devcontainer

Edit `.devcontainer/devcontainer.json` to:
- Add VS Code extensions
- Change port forwarding
- Modify environment variables
- Adjust variant configurations

##  Using as a Template

This repository is designed to be a GitHub template:

1. Click "Use this template" button on GitHub
2. Create a new repository from this template
3. Clone your new repository
4. Open in VS Code or Zed
5. Select your preferred variant
6. Start building!

##  Documentation

Each template includes its own detailed README:

- [Next.js Template Guide](./nextjs-shadcn/README.md)
- [Go Template Guide](./go/README.md)
- [Python Template Guide](./python/README.md)
- [Laravel Template Guide](./laravel/README.md)

##  Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

##  License

This project is open source and available under the [MIT License](LICENSE).

##  Useful Links

### Next.js Resources
- [Next.js Documentation](https://nextjs.org/docs)
- [shadcn/ui Components](https://ui.shadcn.com)
- [Tailwind CSS](https://tailwindcss.com)
- [Bun Documentation](https://bun.sh/docs)

### Go Resources
- [Go Documentation](https://golang.org/doc/)
- [Effective Go](https://golang.org/doc/effective_go)
- [Go by Example](https://gobyexample.com/)

### Python Resources
- [Flask Documentation](https://flask.palletsprojects.com/)
- [Python Documentation](https://docs.python.org/3/)
- [Real Python](https://realpython.com/)

### Laravel Resources
- [Laravel Documentation](https://laravel.com/docs)
- [Laracasts](https://laracasts.com/)
- [Laravel News](https://laravel-news.com/)

### Devcontainer Resources
- [VS Code Dev Containers](https://code.visualstudio.com/docs/devcontainers/containers)
- [Devcontainer Specification](https://containers.dev/)
- [Zed Devcontainer Support](https://zed.dev/docs/remote-development)

##  Tips

- **Switching Variants**: Close the workspace, delete `.devcontainer/.devcontainer.json` if it exists, and reopen to select a different variant
- **Port Conflicts**: If ports are already in use, modify the `forwardPorts` in `.devcontainer/devcontainer.json`
- **Performance**: For better performance, ensure Docker has adequate resources allocated
- **Updates**: Keep your base images updated by rebuilding the container periodically

## ❓ Troubleshooting

### Container won't build
- Ensure Docker is running
- Check Docker has enough disk space
- Try rebuilding: `Cmd/Ctrl + Shift + P` → "Dev Containers: Rebuild Container"

### Dependencies not installing
- Check your internet connection
- Review the setup script logs in the terminal
- Manually run the setup script: `bash .devcontainer/setup-<variant>.sh`

### Port already in use
- Stop other services using the same port
- Change the port in the setup or configuration files

##  Happy Coding!

Choose your stack, spin up your devcontainer, and start building amazing projects!
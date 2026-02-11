# Quick Start Guide

Get up and running with your development environment in minutes!

##  Choose Your Stack

This repository supports four development stacks:
- **Next.js + shadcn/ui** - Modern React applications
- **Go** - Backend services and APIs
- **Python** - Web applications and scripting
- **Laravel** - PHP web applications and APIs

##  Prerequisites

1. **Install Docker Desktop**
   - [Mac](https://docs.docker.com/desktop/install/mac-install/)
   - [Windows](https://docs.docker.com/desktop/install/windows-install/)
   - [Linux](https://docs.docker.com/desktop/install/linux-install/)

2. **Install VS Code** (recommended)
   - Download from [code.visualstudio.com](https://code.visualstudio.com/)
   - Install the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

   **OR Install Zed**
   - Download from [zed.dev](https://zed.dev/)

##  3-Minute Setup

### Step 1: Get the Code

```bash
# Using this as a template (recommended)
# Click "Use this template" button on GitHub, then clone your new repo

# Or clone directly
git clone https://github.com/yourusername/devcontainer-templates.git
cd devcontainer-templates
```

### Step 2: Open in Your Editor

**VS Code:**
```bash
code .
```

**Zed:**
```bash
zed .
```

### Step 3: Select Your Variant

When prompted, choose your development stack:
- `Next.js + shadcn/ui + Tailwind CSS`
- `Go Development Environment`
- `Python Development Environment`

### Step 4: Wait for Setup

The container will:
1. Build the Docker image (~2-5 minutes first time)
2. Run the setup script
3. Install dependencies
4. Configure your environment

### Step 5: Start Coding!

Your environment is ready. Follow the instructions below for your chosen stack.

##  Next.js Quick Start

```bash
cd nextjs-shadcn
bun install
bun run dev
```

Open [http://localhost:3000](http://localhost:3000)

**Add a component:**
```bash
bunx shadcn-ui@latest add button
```

**Use it:**
```tsx
import { Button } from "@/components/ui/button";

export default function Page() {
  return <Button>Click me</Button>;
}
```

##  Go Quick Start

```bash
cd go
go run main.go
```

Open [http://localhost:8080](http://localhost:8080)

**Add a route:**
```go
http.HandleFunc("/api/users", handleUsers)
```

**Add dependencies:**
```bash
go get github.com/gorilla/mux
go mod tidy
```

##  Python Quick Start

```bash
cd python
source venv/bin/activate
python main.py
```

Open [http://localhost:5000](http://localhost:5000)

**Add a route:**
```python
@app.route("/api/users")
def get_users():
    return jsonify({"users": []})
```

**Add dependencies:**
```bash
pip install requests
pip install package-name
pip freeze > requirements.txt
```

##  Laravel Quick Start

```bash
cd laravel
composer install
cp .env.example .env
php artisan key:generate
php artisan serve
```

Open [http://localhost:8000](http://localhost:8000)

**Add a route:**
```php
Route::get('/api/users', [UserController::class, 'index']);
```

**Add dependencies:**
```bash
composer require package/name
```

##  Switching Variants

Want to try a different stack?

1. Close VS Code/Zed
2. Delete `.devcontainer/.devcontainer.json` (if exists)
3. Reopen the project
4. Select a different variant

##  Pro Tips

### Faster Rebuilds
```bash
# In VS Code, press Cmd/Ctrl + Shift + P
# Run: "Dev Containers: Rebuild Container"
```

### Multiple Projects
```bash
# Clone multiple times for different stacks
git clone repo nextjs-project
git clone repo go-project
git clone repo python-project
```

### Custom Ports
Edit `.devcontainer/devcontainer.json`:
```json
"forwardPorts": [3001, 8081, 5001]
```

### Pre-select Variant
```bash
export DEVCONTAINER_VARIANT=nextjs-shadcn
code .
```

##  Common Issues

### Docker Not Running
```bash
# Start Docker Desktop application
# Wait for it to fully start
```

### Port Already in Use
```bash
# Kill process on port (Mac/Linux)
lsof -ti:3000 | xargs kill -9

# Or change the port in your app
```

### Container Won't Build
```bash
# Clear Docker cache
docker system prune -a
docker volume prune

# Rebuild
# In VS Code: Cmd/Ctrl + Shift + P → "Rebuild Container"
```

### Dependencies Not Installing
```bash
# Manually run the setup script
bash .devcontainer/setup-nextjs-shadcn.sh
# or
bash .devcontainer/setup-go.sh
# or
bash .devcontainer/setup-python.sh
```

##  Next Steps

1.  Complete this quick start
2. 📖 Read the [main README](README.md)
3.  Explore your template's README:
   - [Next.js README](nextjs-shadcn/README.md)
   - [Go README](go/README.md)
   - [Python README](python/README.md)
4.  Build something awesome!

##  Need Help?

- 📖 Read the [full documentation](README.md)
-  [Report an issue](https://github.com/yourusername/devcontainer-templates/issues)
-  [Start a discussion](https://github.com/yourusername/devcontainer-templates/discussions)

##  Quick Reference

| Stack | Port | Dev Command | Build Command |
|-------|------|-------------|---------------|
| Next.js | 3000 | `bun run dev` | `bun run build` |
| Go | 8080 | `go run main.go` | `go build` |
| Python | 5000 | `python main.py` | N/A |
| Laravel | 8000 | `php artisan serve` | N/A |

Happy coding! 
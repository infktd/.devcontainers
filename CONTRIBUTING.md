# Contributing to Multi-Stack Devcontainer Templates

Thank you for your interest in contributing to this project! This document provides guidelines and instructions for contributing.

## 🤝 How to Contribute

### Reporting Issues

If you find a bug or have a suggestion:

1. Check if the issue already exists in the [Issues](https://github.com/yourusername/devcontainer-templates/issues)
2. If not, create a new issue with:
   - A clear, descriptive title
   - Detailed description of the problem or suggestion
   - Steps to reproduce (for bugs)
   - Expected vs actual behavior
   - Your environment (OS, Docker version, VS Code/Zed version)

### Suggesting Enhancements

We welcome suggestions for:
- New development stack variants
- Additional tools or extensions
- Improved setup scripts
- Documentation improvements
- Better default configurations

### Pull Requests

1. **Fork the repository**
   ```bash
   git clone https://github.com/yourusername/devcontainer-templates.git
   cd devcontainer-templates
   ```

2. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make your changes**
   - Follow the existing code style
   - Test your changes thoroughly
   - Update documentation if needed

4. **Commit your changes**
   ```bash
   git add .
   git commit -m "feat: add your feature description"
   ```

   Follow [Conventional Commits](https://www.conventionalcommits.org/):
   - `feat:` for new features
   - `fix:` for bug fixes
   - `docs:` for documentation changes
   - `chore:` for maintenance tasks
   - `refactor:` for code refactoring

5. **Push to your fork**
   ```bash
   git push origin feature/your-feature-name
   ```

6. **Create a Pull Request**
   - Provide a clear description of the changes
   - Reference any related issues
   - Ensure all tests pass
   - Request review from maintainers

## 🏗️ Adding a New Variant

To add a new development stack variant:

### 1. Update the Dockerfile

Add a new stage in `.devcontainer/Dockerfile`:

```dockerfile
# Ruby variant stage (example)
FROM ruby:3.2-bookworm as ruby

# Install common utilities
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    git curl wget ca-certificates sudo zsh vim nano \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Create non-root user
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

USER $USERNAME
WORKDIR /workspace
```

### 2. Add Variant Configuration

Update `.devcontainer/devcontainer.json` to add your variant:

```json
"ruby": {
  "name": "Ruby Development Environment",
  "build": {
    "dockerfile": "Dockerfile",
    "args": {
      "VARIANT": "ruby",
      "RUBY_VERSION": "3.2"
    }
  },
  "customizations": {
    "vscode": {
      "extensions": [
        "rebornix.ruby",
        "Shopify.ruby-lsp"
      ]
    }
  },
  "forwardPorts": [3000],
  "postCreateCommand": "bash .devcontainer/setup-ruby.sh"
}
```

### 3. Create Setup Script

Create `.devcontainer/setup-ruby.sh`:

```bash
#!/bin/bash
set -e

echo "🚀 Setting up Ruby development environment..."

cd /workspace/ruby

if ! command -v ruby &> /dev/null; then
    echo "❌ Ruby is not installed."
    exit 1
fi

echo "✅ Ruby version: $(ruby --version)"

# Install bundler
gem install bundler

# Install dependencies if Gemfile exists
if [ -f "Gemfile" ]; then
    echo "📦 Installing dependencies..."
    bundle install
else
    echo "⚠️  No Gemfile found."
fi

git config --global --add safe.directory /workspace

echo "✨ Ruby development environment setup complete!"
```

Make it executable:
```bash
chmod +x .devcontainer/setup-ruby.sh
```

### 4. Create Template Directory

Create a directory for your template:

```
ruby/
├── Gemfile
├── config.ru
├── app.rb
└── README.md
```

### 5. Update Documentation

- Add your variant to the main `README.md`
- Create a detailed `README.md` in your template directory
- Update the repository structure section

### 6. Test Your Variant

1. Set the variant environment variable:
   ```bash
   export DEVCONTAINER_VARIANT=ruby
   ```

2. Open in VS Code and test:
   - Container builds successfully
   - Setup script runs without errors
   - Dependencies install correctly
   - Development server starts
   - All tools work as expected

## 📝 Code Style Guidelines

### Shell Scripts
- Use `#!/bin/bash` shebang
- Include `set -e` for error handling
- Add descriptive echo statements with emojis
- Comment complex logic
- Make scripts idempotent (can be run multiple times safely)

### Configuration Files
- Use consistent indentation (2 spaces for JSON, YAML)
- Add comments for non-obvious settings
- Follow existing patterns in the repository

### Documentation
- Use clear, concise language
- Include code examples
- Add emojis for visual appeal (sparingly)
- Keep formatting consistent
- Update table of contents if needed

## 🧪 Testing

Before submitting a PR:

1. **Build the container** and ensure it completes successfully
2. **Run the setup script** manually to verify it works
3. **Test the development workflow** for your variant
4. **Check all endpoints/routes** work as expected
5. **Verify IDE extensions** are installed and working
6. **Test with both VS Code and Zed** (if possible)

## 📋 Checklist for Pull Requests

- [ ] Code follows the project's style guidelines
- [ ] Changes have been tested in a devcontainer
- [ ] Documentation has been updated
- [ ] Commit messages follow Conventional Commits
- [ ] No sensitive information (keys, passwords) in code
- [ ] Setup script is idempotent
- [ ] New dependencies are documented
- [ ] README includes usage examples

## 🎯 Areas We'd Love Help With

- **Additional Variants**: Ruby, Rust, Java, PHP, etc.
- **Testing**: Automated tests for setup scripts
- **Documentation**: More examples, tutorials, troubleshooting guides
- **Performance**: Optimization of Docker builds and setup scripts
- **Features**: New tools, extensions, or configurations
- **Bug Fixes**: Any issues you encounter

## 💬 Questions?

If you have questions about contributing:

- Open a [Discussion](https://github.com/yourusername/devcontainer-templates/discussions)
- Check existing [Issues](https://github.com/yourusername/devcontainer-templates/issues)
- Reach out to the maintainers

## 📜 License

By contributing, you agree that your contributions will be licensed under the MIT License.

## 🙏 Thank You!

Your contributions make this project better for everyone. We appreciate your time and effort!
# Python Development Template

A simple Flask API server template ready for development in a devcontainer environment.

##  Quick Start

### Setting Up the Environment

```bash
# Create virtual environment
python3 -m venv venv

# Activate virtual environment
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt
```

### Running the Application

```bash
# Run the Flask application
python main.py

# Or use Flask CLI
flask run

# Run with custom port
PORT=8000 python main.py
```

The server will start on `http://localhost:5000`

##  Available Endpoints

- **GET /** - Home page with API documentation
- **GET /api/hello** - Returns a JSON greeting
- **GET /api/health** - Health check endpoint
- **GET /api/time** - Returns current server time

##  Development

### Installing Dependencies

```bash
# Install a new package
pip install package-name

# Add to requirements.txt
pip freeze > requirements.txt

# Install from requirements.txt
pip install -r requirements.txt
```

### Running Tests

```bash
# Run all tests
pytest

# Run tests with coverage
pytest --cov

# Run specific test file
pytest tests/test_main.py

# Run with verbose output
pytest -v
```

### Code Quality

```bash
# Format code with Black
black .

# Run linter
flake8 .

# Run type checker
mypy main.py

# Run pylint
pylint main.py
```

##  Project Structure

```
python/
├── main.py              # Main application entry point
├── requirements.txt     # Python dependencies
├── venv/               # Virtual environment (created on setup)
└── README.md           # This file
```

##  Common Commands

```bash
# Activate virtual environment
source venv/bin/activate

# Deactivate virtual environment
deactivate

# Update pip
pip install --upgrade pip

# List installed packages
pip list

# Show package info
pip show package-name

# Uninstall package
pip uninstall package-name
```

##  Building for Production

```bash
# Run with Gunicorn (production WSGI server)
gunicorn -w 4 -b 0.0.0.0:5000 main:app

# With auto-reload for development
gunicorn --reload -w 4 -b 0.0.0.0:5000 main:app

# Set number of workers
gunicorn -w $(nproc) -b 0.0.0.0:5000 main:app
```

##  Useful Resources

- [Flask Documentation](https://flask.palletsprojects.com/)
- [Python Documentation](https://docs.python.org/3/)
- [Real Python Tutorials](https://realpython.com/)
- [Python Package Index (PyPI)](https://pypi.org/)

##  Tips

- Always use a virtual environment to isolate dependencies
- Use `.env` files for environment variables (with python-dotenv)
- Follow PEP 8 style guide for Python code
- Write docstrings for functions and classes
- Use type hints for better code clarity
- Add tests for new features

##  Debugging

```bash
# Run with Python debugger
python -m pdb main.py

# Add breakpoint in code
import pdb; pdb.set_trace()

# Use IPython for better debugging
pip install ipython
ipython
```

##  Environment Variables

Create a `.env` file for environment variables:

```bash
# .env
PORT=5000
DEBUG=True
SECRET_KEY=your-secret-key
DATABASE_URL=postgresql://user:pass@localhost/dbname
```

Then load them in your application:

```python
from dotenv import load_dotenv
load_dotenv()
```

##  Next Steps

1. Edit `main.py` to add your own routes and logic
2. Create a `tests/` directory and add test files
3. Add a `models.py` file for database models
4. Create a `config.py` for configuration management
5. Add authentication and authorization
6. Integrate with a database (PostgreSQL, MongoDB, etc.)
7. Add API documentation with Swagger/OpenAPI

##  Security Best Practices

- Never commit `.env` files or secrets
- Use environment variables for sensitive data
- Validate and sanitize user input
- Use HTTPS in production
- Implement rate limiting
- Keep dependencies up to date

Happy coding! 
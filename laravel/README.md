# Laravel Development Template

A complete Laravel development environment ready for building modern web applications in a devcontainer.

##  Quick Start

### Install Dependencies

```bash
composer install
npm install
```

### Setup Environment

```bash
# Copy environment file
cp .env.example .env

# Generate application key
php artisan key:generate

# Create SQLite database (default)
touch database/database.sqlite

# Run migrations
php artisan migrate
```

### Run Development Server

```bash
# Start Laravel development server
php artisan serve

# In another terminal, start Vite (for frontend assets)
npm run dev
```

Open [http://localhost:8000](http://localhost:8000) in your browser.

##  What's Included

- **Laravel 11** - Latest version of the PHP framework
- **PHP 8.2** - Modern PHP with performance improvements
- **Composer** - PHP dependency manager
- **Node.js & NPM** - For frontend asset compilation
- **Vite** - Fast frontend build tool
- **SQLite** - Default database (easy setup)
- **Laravel Sanctum** - API authentication
- **Laravel Tinker** - Powerful REPL

##  Frontend Stack

Laravel comes with Vite for asset compilation:

```bash
# Install frontend dependencies
npm install

# Start development server with hot reload
npm run dev

# Build for production
npm run build
```

##  Project Structure

```
laravel/
├── app/
│   ├── Http/
│   │   └── Controllers/     # Application controllers
│   ├── Models/              # Eloquent models
│   └── ...
├── database/
│   ├── migrations/          # Database migrations
│   ├── seeders/             # Database seeders
│   └── factories/           # Model factories
├── routes/
│   ├── web.php             # Web routes
│   ├── api.php             # API routes
│   └── console.php         # Artisan commands
├── resources/
│   ├── views/              # Blade templates
│   ├── js/                 # JavaScript files
│   └── css/                # CSS files
├── public/                 # Public assets
├── config/                 # Configuration files
├── tests/                  # PHPUnit tests
├── composer.json           # PHP dependencies
├── package.json            # Node dependencies
└── .env.example            # Environment template
```

##  Development

### Artisan Commands

```bash
# List all available commands
php artisan list

# Start development server
php artisan serve

# Run migrations
php artisan migrate

# Rollback last migration
php artisan migrate:rollback

# Seed database
php artisan db:seed

# Clear cache
php artisan cache:clear
php artisan config:clear
php artisan view:clear

# List all routes
php artisan route:list
```

### Creating Resources

```bash
# Create a model
php artisan make:model Post

# Create a model with migration
php artisan make:model Post -m

# Create a controller
php artisan make:controller PostController

# Create a resource controller
php artisan make:controller PostController --resource

# Create a migration
php artisan make:migration create_posts_table

# Create a seeder
php artisan make:seeder PostSeeder

# Create a factory
php artisan make:factory PostFactory

# Create a request
php artisan make:request StorePostRequest

# Create middleware
php artisan make:middleware CheckAge
```

##  Database

### SQLite (Default)

The template uses SQLite by default for easy setup:

```bash
# Create database file
touch database/database.sqlite

# Run migrations
php artisan migrate
```

### MySQL/PostgreSQL

To use MySQL or PostgreSQL, update `.env`:

```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=your_database
DB_USERNAME=your_username
DB_PASSWORD=your_password
```

### Migrations

```bash
# Create a migration
php artisan make:migration create_posts_table

# Run migrations
php artisan migrate

# Rollback last migration
php artisan migrate:rollback

# Reset database
php artisan migrate:fresh

# Reset and seed
php artisan migrate:fresh --seed
```

### Eloquent ORM

```php
// Define a model
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    protected $fillable = ['title', 'content'];
}

// Use the model
$post = Post::create([
    'title' => 'My Post',
    'content' => 'Post content'
]);

$posts = Post::all();
$post = Post::find(1);
```

##  Routing

### Web Routes

```php
// routes/web.php
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/posts', [PostController::class, 'index']);
Route::get('/posts/{id}', [PostController::class, 'show']);
```

### API Routes

```php
// routes/api.php
use Illuminate\Support\Facades\Route;

Route::get('/posts', [PostController::class, 'index']);
Route::post('/posts', [PostController::class, 'store']);
```

##  Blade Templates

```php
<!-- resources/views/welcome.blade.php -->
<!DOCTYPE html>
<html>
<head>
    <title>{{ config('app.name') }}</title>
    @vite(['resources/css/app.css', 'resources/js/app.js'])
</head>
<body>
    <h1>Welcome to Laravel</h1>
    @yield('content')
</body>
</html>
```

##  Testing

```bash
# Run all tests
php artisan test

# Run specific test
php artisan test --filter=ExampleTest

# Run with coverage
php artisan test --coverage

# Create a test
php artisan make:test UserTest

# Create a feature test
php artisan make:test UserTest --feature
```

##  Environment Variables

Copy `.env.example` to `.env` and configure:

```env
APP_NAME=Laravel
APP_ENV=local
APP_KEY=base64:...
APP_DEBUG=true
APP_URL=http://localhost:8000

# Database
DB_CONNECTION=sqlite

# Mail
MAIL_MAILER=log

# Queue
QUEUE_CONNECTION=database

# Session
SESSION_DRIVER=database
```

##  Authentication

Laravel provides built-in authentication:

```bash
# Install Laravel Breeze (simple authentication)
composer require laravel/breeze --dev
php artisan breeze:install
npm install && npm run dev
php artisan migrate

# Install Laravel Jetstream (advanced authentication)
composer require laravel/jetstream
php artisan jetstream:install livewire
npm install && npm run dev
php artisan migrate
```

##  Queue & Jobs

```bash
# Create a job
php artisan make:job ProcessPodcast

# Run queue worker
php artisan queue:work

# List failed jobs
php artisan queue:failed

# Retry failed job
php artisan queue:retry all
```

##  Email

```php
// Send email
use Illuminate\Support\Facades\Mail;
use App\Mail\WelcomeMail;

Mail::to('user@example.com')->send(new WelcomeMail());

// Create mailable
php artisan make:mail WelcomeMail
```

##  Code Quality

### Laravel Pint (Code Style)

```bash
# Format code
./vendor/bin/pint

# Check without fixing
./vendor/bin/pint --test
```

### PHPUnit (Testing)

```bash
# Run tests
php artisan test

# With coverage
php artisan test --coverage
```

##  Useful Resources

- [Laravel Documentation](https://laravel.com/docs)
- [Laracasts (Video Tutorials)](https://laracasts.com)
- [Laravel News](https://laravel-news.com)
- [Laravel Daily](https://laraveldaily.com)
- [Awesome Laravel](https://github.com/chiraggude/awesome-laravel)

##  Tips & Best Practices

### Performance

- Use eager loading to prevent N+1 queries
- Cache frequently accessed data
- Use queue for long-running tasks
- Optimize database queries

### Security

- Never commit `.env` file
- Use prepared statements (Eloquent does this)
- Validate all user input
- Use CSRF protection (enabled by default)
- Keep Laravel and dependencies updated

### Code Organization

- Follow PSR standards
- Use form requests for validation
- Keep controllers thin
- Use service classes for business logic
- Write tests for critical features

### Database

- Use migrations for schema changes
- Use seeders for test data
- Use factories for test models
- Index frequently queried columns
- Use transactions for data consistency

##  Troubleshooting

### Clear Cache

```bash
php artisan cache:clear
php artisan config:clear
php artisan route:clear
php artisan view:clear
```

### Regenerate Autoloader

```bash
composer dump-autoload
```

### Permission Issues

```bash
chmod -R 775 storage bootstrap/cache
```

### Database Connection Error

- Check `.env` database credentials
- Ensure database exists
- Verify database service is running

### 404 Not Found

- Run `php artisan route:list` to see all routes
- Check `.htaccess` in public directory
- Ensure `public` is the document root

##  Deployment

### Production Optimization

```bash
# Optimize configuration
php artisan config:cache

# Optimize routes
php artisan route:cache

# Optimize views
php artisan view:cache

# Build frontend assets
npm run build
```

### Environment Variables

```env
APP_ENV=production
APP_DEBUG=false
APP_URL=https://yourdomain.com
```

### Server Requirements

- PHP >= 8.2
- Composer
- BCMath PHP Extension
- Ctype PHP Extension
- cURL PHP Extension
- DOM PHP Extension
- Fileinfo PHP Extension
- JSON PHP Extension
- Mbstring PHP Extension
- OpenSSL PHP Extension
- PCRE PHP Extension
- PDO PHP Extension
- Tokenizer PHP Extension
- XML PHP Extension

##  Next Steps

1. Set up your database in `.env`
2. Create your first model and migration
3. Build your routes and controllers
4. Create Blade templates for your views
5. Add authentication if needed
6. Write tests for your features
7. Deploy to production

##  Popular Packages

```bash
# API Resources
composer require laravel/sanctum

# Admin Panel
composer require filament/filament

# Debug Bar
composer require barryvdh/laravel-debugbar --dev

# IDE Helper
composer require barryvdh/laravel-ide-helper --dev

# Excel Import/Export
composer require maatwebsite/excel

# Image Processing
composer require intervention/image
```

Happy coding with Laravel! 
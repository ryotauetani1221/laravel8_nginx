#!/usr/bin/env bash
echo "Running composer"
# composer global require hirak/prestissimo
composer install --no-dev --working-dir=/var/www/html

cp .env.example .env
php artisan key:generate --env=sample
php artisan storage:link
chmod -R 777 storage bootstrap/cache

echo "Caching config..."
php artisan config:cache

echo "Caching routes..."
php artisan route:cache

# echo "Running migrations..."
# php artisan migrate --force

#!/bin/sh

echo "🎬 entrypoint.sh: [$(whoami)] [PHP $(php -r 'echo phpversion();')]"

composer dump-autoload --no-interaction --no-dev --optimize

echo "🎬 artisan commands"

# 💡 Group into a custom command e.g. php artisan app:on-deploy
touch database/database.sqlite
npm run build:prod
# npm run ssr
php artisan storage:link
php artisan migrate --no-interaction --force
# php artisan db:seed --class=AdminUserSeeder --no-interaction --force
php artisan config:cache
php artisan route:cache
php artisan view:cache

echo "🎬 start supervisord"

supervisord -c $LARAVEL_PATH/.deploy/config/supervisor.conf

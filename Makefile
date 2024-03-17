start:
	@hash concurrently 2>/dev/null || { echo >&2 "I require 'concurrently' but it's not installed globally.  Installing it..."; npm install -g concurrently; }
	@concurrently --kill-others --names "LARAVEL,REVERB,NPM" -c "bgRed.black,bgMagenta.black,bgGreen.black" "php artisan serve" "php artisan reverb:start --debug" "npm run dev"

up:
	docker compose up

up-d:
	docker compose up -d

log:
	docker compose logs -f

down:
	docker compose down

refresh:
	trash /Users/jaw/Dev/slack/database/database.sqlite
	touch /Users/jaw/Dev/slack/database/database.sqlite
	php artisan migrate:refresh --seed
	php artisan migrate:refresh --seed

clean:
	docker compose down --rmi all

wipe:
	docker system prune -a --volumes

test:
	# docker compose exec app npm run test
	npm run test
	php artisan test

lint:
	docker compose exec app npm run lint

format:
	docker compose exec app npm run format

commit:
	make test
	# npm run format
	# npm run lint
	git add -A
	./commit.sh
	git push --no-verify

up:
	docker compose up

up-d:
	docker compose up -d

log:
	docker compose logs -f

down:
	docker compose down

refresh:
	php artisan migrate:refresh --seed

clean:
	docker compose down --rmi all

wipe:
	docker system prune -a --volumes

test:
	docker compose exec app npm run test

lint:
	docker compose exec app npm run lint

format:
	docker compose exec app npm run format

commit:
	# npm run test
	# npm run format
	# npm run lint
	git add -A
	./commit.sh
	git push --no-verify

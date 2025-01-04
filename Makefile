db:
	docker compose -f dockerfiles/docker-compose-for-dev.yaml up

start:
	iex  --erl "-kernel shell_history enabled" --name hello@127.0.0.1 --cookie some_token -S mix phx.server
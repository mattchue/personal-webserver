SHELL=/bin/bash

build:
	mkdir -p ./bin
	CGO_ENABLED=0 go build -o ./bin/personal_webserverd
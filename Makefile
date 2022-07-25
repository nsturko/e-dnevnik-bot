TARGET?=e-dnevnik-bot
CGO_ENABLED?=0

all: update build

update:
	go get -u
	go mod tidy -compat=1.18

.PHONY: build
build:
	CGO_ENABLED=$(CGO_ENABLED) go build -trimpath -ldflags="-s -w" -o $(TARGET)
	upx $(TARGET) || true
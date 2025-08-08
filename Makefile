.PHONY: all generate lint breaking clean setup

# Set up PATH for protoc plugins
export PATH := $(HOME)/go/bin:$(HOME)/.rbenv/shims:$(PATH)

all: generate

generate: generate-go generate-ruby

generate-go:
	./scripts/generate-go.sh

generate-ruby:
	./scripts/generate-ruby.sh

lint:
	./scripts/lint.sh

breaking:
	./scripts/check-breaking.sh

clean:
	rm -rf gen/

setup:
	@echo "Setting up protobuf development environment..."
	@echo "Installing Go protoc plugins..."
	go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
	go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
	@echo "Installing Ruby protoc plugins..."
	gem install grpc-tools
	@echo "Setup completed! You can now run 'make generate'"

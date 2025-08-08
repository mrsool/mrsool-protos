# Mrsool Protobuf Definitions

This repository contains Protocol Buffer (protobuf) definitions for the Mrsool backend services.

## Prerequisites

- [buf](https://docs.buf.build/installation) - Protobuf toolchain
- [Go](https://golang.org/doc/install) - For Go code generation
- [Ruby](https://www.ruby-lang.org/en/documentation/installation/) - For Ruby code generation
- [rbenv](https://github.com/rbenv/rbenv) - Ruby version manager (recommended)

## Quick Start

1. **Setup the development environment:**
   ```bash
   make setup
   ```

2. **Generate code for all languages:**
   ```bash
   make generate
   ```

3. **Generate code for specific languages:**
   ```bash
   make generate-go    # Generate Go code only
   make generate-ruby  # Generate Ruby code only
   ```

## Available Commands

- `make generate` - Generate Go and Ruby code from protobuf definitions
- `make generate-go` - Generate Go code only
- `make generate-ruby` - Generate Ruby code only
- `make lint` - Run protobuf linting
- `make breaking` - Check for breaking changes against main branch
- `make clean` - Remove generated code
- `make setup` - Install required dependencies

## Project Structure

```
mrsool-protos/
├── commons/           # Shared protobuf definitions
│   └── v1/
│       └── hello.proto
├── mrsool_backend/    # Mrsool backend specific protos
├── laas_backend/      # LaaS backend specific protos
├── dispatcher/        # Dispatcher specific protos
├── gen/              # Generated code (created by make generate)
│   ├── go/           # Generated Go code
│   └── ruby/         # Generated Ruby code
├── scripts/          # Build scripts
├── buf.yaml          # Buf configuration
├── buf.gen.yaml      # Code generation configuration
└── Makefile          # Build automation
```

## Adding New Protobuf Definitions

1. Create your `.proto` file in the appropriate directory
2. Use the correct package name and go_package option
3. Run `make generate` to generate code
4. Run `make lint` to check for issues

## Example Proto File

```protobuf
syntax = "proto3";

package yourservice.v1;

option go_package = "github.com/mrsool/protos/gen/go/yourservice/v1;yourservicev1";

service YourService {
  rpc YourMethod (YourRequest) returns (YourResponse) {}
}

message YourRequest {
  string field = 1;
}

message YourResponse {
  string result = 1;
}
```

## Troubleshooting

### "protoc plugin not found" errors
Run `make setup` to install the required protoc plugins.

### PATH issues
The Makefile automatically sets up the PATH for protoc plugins. If you're running commands directly, make sure your PATH includes:
- `$HOME/go/bin` (for Go plugins)
- `$HOME/.rbenv/shims` (for Ruby plugins)

### Breaking changes
Use `make breaking` to check for breaking changes before committing. This compares against the main branch.
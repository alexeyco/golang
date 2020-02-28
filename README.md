# Docker image for golang development with useful tools
Based on Linux Alpine 3.11

[![Docker Build Status](https://img.shields.io/docker/cloud/build/alexeyco/golang)](https://hub.docker.com/r/alexeyco/golang)
[![MicroBadger Size](https://img.shields.io/microbadger/image-size/alexeyco/golang)](https://hub.docker.com/r/alexeyco/golang)
[![MicroBadger Layers](https://img.shields.io/microbadger/layers/alexeyco/golang)](https://hub.docker.com/r/alexeyco/golang)
[![Docker Pulls](https://img.shields.io/docker/pulls/alexeyco/golang)](https://hub.docker.com/r/alexeyco/golang)
[![Docker Stars](https://img.shields.io/docker/stars/alexeyco/golang)](https://hub.docker.com/r/alexeyco/golang)

## Includes
| Tool                                                  | Version | Description            |
|-------------------------------------------------------|---------|------------------------|
| [ginkgo](https://github.com/onsi/ginkgo)              | v1.12.0 | BDD testing framework  |
| [gqlgen](https://github.com/99designs/gqlgen)         | v0.11.1 | GraphQL server library |
| [golangci](https://github.com/golangci/golangci-lint) | v1.23.7 | Golang linter          |
| Git                                                   | v2.24.1 | In Linus we trust!     |
| Make                                                  | v4.2.1  | GNU Make               |

## Example usage
```yaml
version: '3.7'

services:
  app:
    image: alexeyco/golang:latest
    restart: unless-stopped
    volumes:
      - .:/go/src/path/to/source
    working_dir: /go/src/path/to/source
    command: tail -f /dev/null
    networks:
      - internal

networks:
  internal:
    external: false
```

## License

```
MIT License

Copyright (c) 2020 Alexey Popov

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

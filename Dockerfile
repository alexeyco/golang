FROM golang:1.14.0-alpine3.11 AS build

ENV XDG_CACHE_HOME /tmp/go-build
ENV GO111MODULE on

# First we need to build all development tools
RUN apk update \
    && apk upgrade \
    && apk add --no-cache \
        git \
        curl \
    # BDD testing framework
    && go get -u github.com/onsi/ginkgo/ginkgo@v1.11.0 \
    # GraphQL server library
    && go get -u github.com/99designs/gqlgen@v0.11.1 \
    # Golang linter
    && curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.23.7

# And finally build our image
FROM golang:1.14.0-alpine3.11

ENV CGO_ENABLED 0
ENV XDG_CACHE_HOME /tmp/go-build
ENV GO111MODULE on

COPY --from=build /go/bin/ginkgo /bin/ginkgo
COPY --from=build /go/bin/gqlgen /bin/gqlgen
COPY --from=build /go/bin/golangci-lint /bin/golangci-lint

RUN apk update \
    && apk upgrade \
    && apk add --no-cache \
      git \
      make

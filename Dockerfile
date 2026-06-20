# --- Stage 1: Build & Compilation ---
FROM golang:1.22-alpine AS builder

WORKDIR /app

COPY src/go.mod ./

COPY src/ .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
    go build -ldflags="-w -s" -o shipping-service .

# --- Stage 2: Hardened Runtime Environment ---
FROM alpine:3.19

WORKDIR /app

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

COPY --from=builder /app/shipping-service .

USER appuser

EXPOSE 8080

ENTRYPOINT ["./shipping-service"]
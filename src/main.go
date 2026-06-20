package main

import (
    "fmt"
    "net/http"
)

func healthHandler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "OK")
}

func trackHandler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, `{"trackingId":"TRK001","status":"IN_TRANSIT","location":"Memphis Hub"}`)
}

func main() {
    http.HandleFunc("/healthz", healthHandler)
    http.HandleFunc("/track", trackHandler)

    fmt.Println("Server running on :8080")
    http.ListenAndServe(":8080", nil)
}

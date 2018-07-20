package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"time"
)

func rootHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "<html><body><h1>Hello World</h1>%s</body></html>", time.Now().UTC())
}

func quitHandler(w http.ResponseWriter, r *http.Request) {
	os.Exit(1)
}

func main() {
	fmt.Println(`
Starting server on localhost:8080
Navigate to http://localhost:8080        to see the time
Navigate to http://localhost:8080/quit   to stop the server`)

	http.HandleFunc("/", rootHandler)
	http.HandleFunc("/quit", quitHandler)
	log.Fatal(http.ListenAndServe(":8080", nil))
}

package main

import (
	"encoding/json"
	"log"
	"net/http"
	"time"

	_ "embed"

	"github.com/go-chi/cors"
)

//go:embed smoothie_recipes.json
var smoothieRecipesData []byte

// Smoothie struct for unmarshalling JSON
// (fields in German to match JSON keys)
type Smoothie struct {
	ID               int               `json:"id"`
	Name             string            `json:"name"`
	Kategorie        string            `json:"kategorie"`
	Zutaten          []string          `json:"zutaten"`
	Zubereitung      string            `json:"zubereitung"`
	Portionen        int               `json:"portionen"`
	Kalorien         int               `json:"kalorien"`
	Zubereitungszeit string            `json:"zubereitungszeit"`
	Naehrwerte       map[string]string `json:"naehrwerte"`
}

// Load smoothies from embedded JSON data
func loadSmoothies() ([]Smoothie, error) {
	var smoothies []Smoothie
	err := json.Unmarshal(smoothieRecipesData, &smoothies)
	if err != nil {
		return nil, err
	}
	return smoothies, nil
}

func main() {
	// Build a ServeMux and apply go-chi/cors to allow all origins.
	mux := http.NewServeMux()
	mux.HandleFunc("/api/smoothies", smoothiesHandler)
	mux.HandleFunc("/api/smoothies/random", randomSmoothieHandler)

	// Allow all cross-origin requests.
	handler := cors.AllowAll().Handler(mux)

	port := "8080"
	if p := httpPort(); p != "" {
		port = p
	}

	log.Printf("Server listening on :%s", port)

	err := http.ListenAndServe(":"+port, handler)
	if err != nil {
		log.Fatalf("server error: %v", err)
	}
}

func httpPort() string {
	return "" // os.Getenv("PORT") falls back to 8080, but os import is not needed anymore
}

func smoothiesHandler(w http.ResponseWriter, r *http.Request) {
	// Load all smoothies
	smoothies, err := loadSmoothies()
	if err != nil {
		log.Printf("error loading smoothies: %v", err)
		http.Error(w, "internal server error", http.StatusInternalServerError)
		return
	}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(smoothies)
}

func randomSmoothieHandler(w http.ResponseWriter, r *http.Request) {
	smoothies, err := loadSmoothies()
	if err != nil || len(smoothies) == 0 {
		log.Printf("error loading smoothies: %v", err)
		http.Error(w, "internal server error", http.StatusInternalServerError)
		return
	}
	// Pick a random smoothie
	n := time.Now().UnixNano()
	idx := int(n % int64(len(smoothies)))
	randomSmoothie := smoothies[idx]
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(randomSmoothie)
}

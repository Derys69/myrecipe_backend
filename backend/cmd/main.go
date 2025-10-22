package main

import (
	"log"
	"myrecipe/internal/config"
	"myrecipe/internal/models"
	"myrecipe/internal/routes"
	"myrecipe/pkg/database"

	"github.com/gin-gonic/gin"
)

func main() {
	cfg := config.LoadConfig()
	db := database.ConnectMySQL(cfg)

	err := db.AutoMigrate(&models.User{}, &models.Category{}, &models.Recipe{}, &models.Favorite{}, &models.Rating{})
	if err != nil {
		log.Fatal("Failed to migrate models: ", err)
	}

	r := gin.Default()
	routes.RegisterRoutes(r, db)

	log.Printf("Server running on port %s", cfg.ServerPort)
	if err := r.Run(":" + cfg.ServerPort); err != nil {
		log.Fatal(err)
	}
}

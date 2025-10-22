package routes

import (
	"myrecipe/internal/handlers"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func RecipeRoutes(r *gin.Engine, db *gorm.DB) {
	h := handlers.RecipeHandler{DB: db}
	recipe := r.Group("/recipes")
	recipe.GET("/", h.GetAll)
	recipe.GET("/search", h.GetByIngredient)
}

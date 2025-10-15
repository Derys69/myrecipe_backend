package routes

import (
	"myrecipe/internal/handlers"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func FavoriteRoutes(r *gin.Engine, db *gorm.DB) {
	h := handlers.FavoriteHandler{DB: db}
	fav := r.Group("/favorites")
	fav.POST("/toggle", h.ToggleFavorite)
}

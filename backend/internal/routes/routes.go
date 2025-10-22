package routes

import (
	"myrecipe/internal/config"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func RegisterRoutes(r *gin.Engine, db *gorm.DB) {
	cfg := config.LoadConfig()

	AuthRoutes(r, db, cfg.JWTSecret)
	RecipeRoutes(r, db)
	FavoriteRoutes(r, db)
	AdminRoutes(r, db, cfg.JWTSecret)
}

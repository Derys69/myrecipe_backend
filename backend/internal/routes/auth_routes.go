package routes

import (
	"myrecipe/internal/handlers"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func AuthRoutes(r *gin.Engine, db *gorm.DB, secret string) {
	h := handlers.AuthHandler{DB: db, Secret: secret}
	auth := r.Group("/auth")
	auth.POST("/register", h.Register)
	auth.POST("/login", h.Login)
}

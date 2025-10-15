package routes

import (
	"myrecipe/internal/handlers"
	"myrecipe/internal/middleware"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func AdminRoutes(r *gin.Engine, db *gorm.DB, secret string) {
	admin := r.Group("/admin")
	admin.Use(middleware.AuthMiddleware(secret, "admin"))
	recipeHandler := handlers.AdminRecipeHandler{DB: db}
	admin.POST("/recipes", recipeHandler.CreateRecipe)
	admin.PUT("/recipes/:id", recipeHandler.UpdateRecipe)
	admin.DELETE("/recipes/:id", recipeHandler.DeleteRecipe)

	// Tambahan
	// admin.GET("/users", userHandler.GetAll)
	// admin.POST("/categories", categoryHandler.Create)
}

package handlers

import (
	"myrecipe/internal/models"
	"net/http"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type FavoriteHandler struct {
	DB *gorm.DB
}

func (h *FavoriteHandler) ToggleFavorite(c *gin.Context) {
	var fav models.Favorite
	if err := c.ShouldBindJSON(&fav); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	var existing models.Favorite
	if err := h.DB.Where("user_id = ? AND recipe_id = ?", fav.UserID, fav.RecipeID).First(&existing).Error; err == nil {
		h.DB.Delete(&existing)
		c.JSON(http.StatusOK, gin.H{"message": "Favorite removed"})
		return
	}

	h.DB.Create(&fav)
	c.JSON(http.StatusOK, gin.H{"message": "Favorite added"})
}

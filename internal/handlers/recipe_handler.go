package handlers

import (
	"myrecipe/internal/models"
	"net/http"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type RecipeHandler struct {
	DB *gorm.DB
}

func (h *RecipeHandler) GetAll(c *gin.Context) {
	var recipes []models.Recipe
	h.DB.Preload("Category").Find(&recipes)
	c.JSON(http.StatusOK, recipes)
}

func (h *RecipeHandler) GetByIngredient(c *gin.Context) {
	ingredient := c.Query("ingredient")
	var recipes []models.Recipe
	h.DB.Where("ingredients LIKE ?", "%"+ingredient+"%").Find(&recipes)
	c.JSON(http.StatusOK, recipes)
}

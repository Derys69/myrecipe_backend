package handlers

import (
	"myrecipe/internal/models"
	"net/http"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type AdminRecipeHandler struct {
	DB *gorm.DB
}

func (h *AdminRecipeHandler) CreateRecipe(c *gin.Context) {
	var recipe models.Recipe
	if err := c.ShouldBindJSON(&recipe); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	h.DB.Create(&recipe)
	c.JSON(http.StatusOK, gin.H{"message": "Resep berhasil ditambahkan"})
}

func (h *AdminRecipeHandler) UpdateRecipe(c *gin.Context) {
	id := c.Param("id")
	var recipe models.Recipe
	if err := h.DB.First(&recipe, id).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Resep tidak ditemukan"})
		return
	}
	if err := c.ShouldBindJSON(&recipe); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	h.DB.Save(&recipe)
	c.JSON(http.StatusOK, gin.H{"message": "Resep diperbarui"})
}

func (h *AdminRecipeHandler) DeleteRecipe(c *gin.Context) {
	id := c.Param("id")
	h.DB.Delete(&models.Recipe{}, id)
	c.JSON(http.StatusOK, gin.H{"message": "Resep dihapus"})
}

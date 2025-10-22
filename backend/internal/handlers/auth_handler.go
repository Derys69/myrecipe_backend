package handlers

import (
	"myrecipe/internal/authservice"
	"myrecipe/internal/models"
	"net/http"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type AuthHandler struct {
	DB     *gorm.DB
	Secret string
}

// Register user baru
func (h *AuthHandler) Register(c *gin.Context) {
	var input struct {
		Email    string `json:"email"`
		Password string `json:"password"`
		Role     string `json:"role"`
	}

	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	if input.Role == "" {
		input.Role = "member"
	}

	user := models.User{
		Email:    input.Email,
		Password: input.Password,
		Role:     input.Role,
	}

	if err := h.DB.Create(&user).Error; err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Email sudah digunakan"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Registrasi berhasil", "role": user.Role})
}

// Login
func (h *AuthHandler) Login(c *gin.Context) {
	var input struct {
		Email    string `json:"email"`
		Password string `json:"password"`
	}

	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	var user models.User
	if err := h.DB.Where("email = ? AND password = ?", input.Email, input.Password).First(&user).Error; err != nil {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Email atau password salah"})
		return
	}

	token, _ := authservice.GenerateToken(user.ID, user.Role, h.Secret)
	c.JSON(http.StatusOK, gin.H{
		"token": token,
		"role":  user.Role,
	})
}

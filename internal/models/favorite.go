package models

import "gorm.io/gorm"

type Favorite struct {
	gorm.Model
	UserID   uint
	RecipeID uint
}

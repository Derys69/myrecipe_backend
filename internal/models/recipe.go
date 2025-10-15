package models

import "gorm.io/gorm"

type Recipe struct {
	gorm.Model
	Title       string
	Description string
	Ingredients string
	Steps       string
	CategoryID  uint
	Category    Category
	Favorites   []Favorite `gorm:"foreignKey:RecipeID"`
	Ratings     []Rating   `gorm:"foreignKey:RecipeID"`
}

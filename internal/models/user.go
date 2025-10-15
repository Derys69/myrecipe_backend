package models

import "gorm.io/gorm"

type User struct {
	gorm.Model
	Email     string `gorm:"unique"`
	Password  string
	Role      string     `gorm:"default:member"`
	Favorites []Favorite `gorm:"foreignKey:UserID"`
	Ratings   []Rating   `gorm:"foreignKey:UserID"`
}

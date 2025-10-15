package database

import (
	"fmt"
	"log"
	"myrecipe/internal/config"

	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

func ConnectMySQL(cfg config.Config) *gorm.DB {
	dsn := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?parseTime=true",
		cfg.DBUser, cfg.DBPassword, cfg.DBHost, cfg.DBPort, cfg.DBName)

	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{})
	if err != nil {
		log.Fatal("Database connection failed:", err)
	}

	log.Println("Connected to MySQL database")
	return db
}

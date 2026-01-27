package main

import (
	"net/http"
	"task_management/config"
	"task_management/controllers"
	"task_management/models"

	"github.com/gin-gonic/gin"
)

func main() {
	// database
	db := config.DatabaseConnection()
	db.AutoMigrate(&models.User{}, &models.Task{})
	config.CreateOwnerAccount(db)

	// controller
	UserController := controllers.UserController{DB: db}

	// router
	router := gin.Default()
	router.GET("/", func(c *gin.Context) {
		c.JSON(http.StatusOK, "Welcome to Task")
	})

	router.POST("/users/login", UserController.Login)
	router.POST("/users", UserController.CreateAccount)
	router.DELETE("/users/:id", UserController.Delete)

	router.Static("/attachments", "attachments")
	router.Run("localhost:8080")
}

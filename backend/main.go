package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func main() {
	// router
	router := gin.Default()
	router.GET("/", func(c *gin.Context) {
		c.JSON(http.StatusOK, "Welcome to Task")
	})

	router.Run("localhost:8080")
}

package main

import "github.com/gin-gonic/gin"

func main() {
	router := gin.Default()
	router.Static("/", "./static")

	router.Run("0.0.0.0:80")
}

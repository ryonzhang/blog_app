package main

import (
	"log"
	"github.com/ryonzhang369/blog_app/actions"
)

func main() {
	app := actions.App()
	log.Fatal(app.Serve())
}

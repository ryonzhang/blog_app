package grifts

import (
	"github.com/gobuffalo/buffalo"
	"github.com/ryonzhang369/blog_app/actions"
)

func init() {
	buffalo.Grifts(actions.App())
}

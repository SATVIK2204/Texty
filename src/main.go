package main

import (
	"github.com/SATVIK2204/texty/src/internal/core"
)

func main() {
	var editor core.Editor

	editor.Init()
	editor.Run()
	defer editor.Close()

}

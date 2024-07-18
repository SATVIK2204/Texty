package main

import (
	"fmt"
	"github.com/nsf/termbox-go"
)

func main() {
	err := termbox.Init()
	if err != nil {
		panic(err)
	}
	defer termbox.Close()

	for {
		fmt.Print("Press a key (q to quit): ")

		switch event := termbox.PollEvent(); event.Type {
		case termbox.EventKey:
			if event.Ch == 'q' || event.Key == termbox.KeyCtrlQ {
				return
			}

			if event.Ch != 0 {
				fmt.Printf("You pressed: %c (code point: %d)\r\n", event.Ch, event.Ch)
			} else {
				fmt.Printf("You pressed a non-character key (code: %d)\r\n", event.Key)
			}
		case termbox.EventError:
			panic(event.Err)
		}
	}
}

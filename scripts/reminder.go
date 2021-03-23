package main

import (
	"fmt"
)

func main() {
	fmt.Print("Enter a number: ")

	var max int = 100
	var value int = 1
	for value <= max {
		var rem int = value % 3
		if rem == 0 {
			fmt.Println(value)
		}
		value = value + 1
	}
}

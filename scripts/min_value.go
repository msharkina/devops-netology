package main

import (
	"fmt"
)

func main() {
	fmt.Print("Enter a number: ")

	x := []int{48, 96, 86, 68, 57, 82, 63, 70, 37, 34, 83, 27, 19, 97, 9, 17}

	var lenght int = len(x) - 1
	var index int = 0
	var min int = x[index]
	for index < lenght {
		index = index + 1
		if min > x[index] {
			min = x[index]
		}
	}
	fmt.Println("Min value = ", min)
}

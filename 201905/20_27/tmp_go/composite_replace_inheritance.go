package main

import "fmt"

type CarInterface interface {
	GetName() string
}

type Car struct {
	name string
}

func (car Car) GetName() string {
	return car.name
}

type Sonata struct {
	name string
	Car
}

func (sonata Sonata) GetName() string {
	fmt.Println("sonata called")
	return sonata.Car.GetName()
}

func main() {
	car := Car{"hi"}
	sonata := Sonata{"hello", car}

	fmt.Println(car.GetName())
	fmt.Println(sonata.GetName())
}

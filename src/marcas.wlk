import carpas.*
import personas.*
class MarcasDeCerveza {
	const property contLupulo
	const property paisFabricacion
	var property precioPorLitro
			
	method graduacion()
}

class Rubia inherits MarcasDeCerveza{
	const graduacion
	
	override method graduacion()= graduacion
}

class Negra inherits MarcasDeCerveza{	
	override method graduacion()= contLupulo.min(graduacionReglamentaria.graduacion()) 
}

class Roja inherits Negra{
	override method graduacion()= super() * 1.25
}

object graduacionReglamentaria {
	var property graduacion = 0.04
}

class Jarra{
	const property litros
	const property marca
	const property carpa
	
	method contenidoDeAlcohol()= litros * marca.graduacion()
}
import carpas.*
import marcas.*
class Persona {
	var property peso
	var property jarrasQueCompro=[]
	var property escuchaTradicional
	var property aguante
	
	const property nacionalidad
	
	method comprarCerveza(cerveza){
		jarrasQueCompro.add(cerveza)
	}
	
	method estaEbria()= self.totalDeAlcohol() * peso > aguante
	
	method totalDeAlcohol()= jarrasQueCompro.sum({j=>j.contenidoDeAlcohol()})
	
	method quiereEntrar(carpa)= self.leGusta(carpa.marcaDeCerveza()) and self.escuchaTradicional() == carpa.tieneBanda()
	
	method ingresar(carpa){
		if(self.quiereEntrar(carpa) and carpa.puedeEntrar(self)){
			carpa.entraPersona(self)
		}else{self.error("No puede ingresar")}
	}
	
	method jarrasConMasDe1Litro(){
		jarrasQueCompro.all({j=>j.litros()>=1})
	}
	
	method esPatriota(){
		jarrasQueCompro.all({j=>j.marca().paisFabricacion()})
	}
	
	method esCompatibleCon(persona){
		return self.marcasDeJarrasCompradas().intersection(persona.marcasDeJarrasCompradas()) > not self.marcasDeJarrasCompradas().intersection(persona.marcasDeJarrasCompradas())
	}
	
	method marcasDeJarrasCompradas(){
		return jarrasQueCompro.map({j=>j.marca()}).asSet()
	}
	
	method carpasCerveza(){
		return jarrasQueCompro.map({j=>j.carpa()}).asSet()
	}
	
	method leGusta(cerveza)
}


class Belga inherits Persona{
	override method leGusta(cerveza)= cerveza.contLupulo() > 0.04
}

class Checo inherits Persona{
	override method leGusta(cerveza)= cerveza.graduacion() > 0.08
}

class Aleman inherits Persona {
	override method leGusta(cerveza) = true
	override method quiereEntrar(carpa)= super(carpa) and carpa.personasDentro().size().even()
}

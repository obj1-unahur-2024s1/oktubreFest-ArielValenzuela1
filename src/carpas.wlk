import marcas.*
import personas.*

class Carpa{
	const property genteAdmitida
	const property tieneBanda
	const property marcaDeCerveza
	
	const property personasDentro=[]
	
	method dejarEntrar(persona){
		return personasDentro.size() < genteAdmitida and not persona.estaEbria()
	}
	
	method puedeEntrar(persona){
		return persona.quiereEntrar(self) and self.dejarEntrar(persona)
	}
	
	method entraPersona(persona){
		personasDentro.add(persona)
	}
	
	method servirJarra(persona, capacidad){
		if (personasDentro.contains(persona)){
			persona.comprarCerveza(new Jarra(litros = capacidad, marca= self.marcaDeCerveza()))
			}
		else{
			self.error("Persona no esta en la carpa")
		}
	}
	
	method ebriosEmpedernidos()= personasDentro.count({
		p=>p.estaEbrio() and p.jarrasConMasDe1Litro()
	})
	
	method esHomogenea()= personasDentro.map({p=>p.nacionalidad()}).asSet().size() == 1
	
	method noSeLeSirvio(){
		return personasDentro.filter({p=> not p.carpasCerveza().contains(self)})
	}
	
	method
	
}
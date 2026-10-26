import pacman-game.*
import wollok.game.*
import direcciones.*
import trampas.*
import sonidos.*
import mapa.*


object pacman {
    
    var bombas = 0

    var  property position = game.origin()
    var direccionActual = derecha

    method matar(){
        muerte.sonidoMuerte()
        game.removeVisual(self)
        bombas = 0
    }
    //method text () {
        //return  "=" + bombas
    //}
    method image(){
        return "pacman-" + direccionActual.nombreDireccion() + ".png"
    }

    method agarrarBomba(){
        bombas += 1
    }

    method position(){
        return position
    }

    method mover(direccion) {
        const nuevaPosition = direccion.siguiente(position) 
        
        // Si la dirección devolvió una posición diferente (no se chocó contra el borde del mapa)
        if (nuevaPosition != position) {
            if (not self.hayMurosAdelante(nuevaPosition)) {
                position = nuevaPosition
                direccionActual = direccion
            }
        }
    }

    method hayMurosAdelante(posicion) {
        // Obtenemos el diseño de texto del mapa
        const mapaTexto = generadorMapa.diseño()
        
        // Traducimos la coordenada Y de Wollok a la fila de la lista de texto (19 - y)
        const filaTexto = 19 - posicion.y()
        const columnaTexto = posicion.x()
        
        // Leemos el caracter exacto en esa posición
        const caracter = mapaTexto.get(filaTexto).charAt(columnaTexto)
        
        // Si el caracter es "#", es un muro sólido. Retorna true.
        return caracter == "#"
    }

    method ponerBomba(){
       if (bombas > 0){ 
            self.validarPosicionVacia()
            bombas -= 1
            game.addVisual(new Bomba (position = self.position()))
        }

    }

    method bombasEnCelda() { return game.colliders(self) }
    
    method validarPosicionVacia() {
		if (not self.bombasEnCelda().isEmpty()) {
			self.error("Ya hay una bomba!!!")
		}
    }
}
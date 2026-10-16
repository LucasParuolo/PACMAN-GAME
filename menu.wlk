import wollok.game.*
import pacman.*
import bombasRandom.*
import spawners.*
import pacman-game.*
import fondo.*


object menu {

    var property juegoIniciado = false
    var property fondoDeJuego = "menuInicio.png"

    method iniciar(){
        
        fondoDeJuego= "fondo.jpg"
        juegoIniciado = true
        game.addVisual(fondo)
// BOMBAS AZULES
        game.schedule(5000, { game.addVisual(new BombaRandom (position = game.at(2, 10)))})
        game.schedule(5000,{ game.addVisual(new BombaRandom (position = game.at(12, 10)))})
        game.schedule(5000,{ game.addVisual(new BombaRandom (position = game.at(10, 10)))})

// SPAWNER DISPARADORES
        spawner.spawnearCant_Invasores(2)

// COLISIONES 
        game.onCollideDo(pacman, {elemento => elemento.chocoConPacman()})
        game.addVisualCharacter(pacman)
    }
}
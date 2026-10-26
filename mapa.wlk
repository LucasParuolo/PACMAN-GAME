import muro.*
import wollok.game.*
import pacman.*
import bombasRandom.*
import spawners.*

object generadorMapa {
  var property diseño = [
    "####################",
    "#                  #",
    "# ####   ##   #### #",
    "# ####   ##   #### #",
    "#                  #",
    "#    ##########    #",
    "#    ##########    #",
    "##      ####      ##",
    "##      ####      ##",
    "#    ##      ##    #",
    "#    ##########    #",
    "#    ##########    #",
    "#                  #",
    "# ####   ##   #### #",
    "# ####   ##   #### #",
    "#   ##        ##   #",
    "##  ## ########## ##",
    "#                  #",
    "#                  #",
    "####################"
  ]

  method crear() {
    (0 .. 19).forEach{ y =>
      (0 .. 19).forEach{ x =>
        const caracter = diseño.get(19 - y).charAt(x)
        if (caracter == "#") {
          game.addVisual(new Muro(position = game.at(x, y)))
        }
      }
    }
    
    pacman.position(game.at(10, 1))
    game.addVisual(pacman)

    // Eventos de tiempo y spawns
    game.schedule(5000, { game.addVisual(new BombaRandom(position = game.at(2, 10))) })
    game.schedule(5000, { game.addVisual(new BombaRandom(position = game.at(12, 10))) })
    game.schedule(5000, { game.addVisual(new BombaRandom(position = game.at(10, 10))) })
    //spawner.spawnearCant_Invasores(2)
  }
}
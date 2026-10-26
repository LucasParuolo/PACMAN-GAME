import wollok.game.*
object tablero {
    method dentro(position) {
        return position.x().between(0, game.width() - 1) 
           and position.y().between(0, game.height() - 1)
    }
}

object arriba {
    method siguiente(position) {
        const nueva = game.at(position.x(), position.y() + 1)
        return if (tablero.dentro(nueva)) nueva else position
    }
    method nombreDireccion() = "arriba"
}

object abajo {
    method siguiente(position) {
        const nueva = game.at(position.x(), position.y() - 1)
        return if (tablero.dentro(nueva)) nueva else position
    }
    method nombreDireccion() = "abajo"
}

object derecha {
    method siguiente(position) {
        const nueva = game.at(position.x() + 1, position.y())
        return if (tablero.dentro(nueva)) nueva else position
    }
    method nombreDireccion() = "derecha"
}

object izquierda {
    method siguiente(position) {
        const nueva = game.at(position.x() - 1, position.y())
        return if (tablero.dentro(nueva)) nueva else position
    }
    method nombreDireccion() = "izquierda"
}
import Foundation

struct Player {
    var eleccion: Opciones?

    mutating func elegir(opcion: Opciones) {
        self.eleccion = opcion
    }
}
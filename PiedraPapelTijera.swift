import Cocoa
import Fundamentals

enum Opciones: Int {
    case piedra = 0
    case papel = 1
    case tijera = 2
    case salir = 3
}

func opcionesUsuarioInput() -> Opciones? {
    print("Elige entre estas opciones:\n")
    print("0 - Piedra")
    print("1 - Papel")
    print("2 - Tijera")
    print("3 - Salir del juego")

    guard let input = readLine(), 
        let valor = Int(input), 
        let opcion = Opcion(rawValue: valor) else {
    print("Entrada invalida, debe ser un numero entre 0 y 3")
    return nil
    }

    return opcion
}

func main(){
    while true {
    if let opcion = opcionesUsuarioInput() {
        switch opcion {
            case .piedra:
                print("Elegiste la opción: Piedra")
            case .papel:
                print("Elegiste la opción: Papel")
            case .tijera:
                print("Elegiste la opción: Tijera")
            case .salir:
                print("Saliendo del juego")
                return
            }
        }
    }
}

main()
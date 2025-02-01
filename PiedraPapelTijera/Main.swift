import Foundation

func main() {
    print("Bienvenido a Piedra, Papel o Tijera!")

    while true {
        print("\nElige entre estas opciones:")
        print("0 - Piedra")
        print("1 - Papel")
        print("2 - Tijera")
        print("3 - Salir del juego")

        guard let input = readLine(),
            let value = Int(input),
            let playerChoice = Opciones(rawValue: value) else {
                print("Entrada inválida, elige un numero ente el 0 y 3")
                continue
            }

        if playerChoice == .salir {
            print("aliendo del Juego. Hasta luego!")
            break
        }

        let computerChoice = computerChoice()
        print("Tú elegiste: \(playerChoice)")
        print("La computadora eligió: \(computerChoice) \n")

        let resultado = determineWinner(playerChoice: playerChoice, computerChoice: computerChoice)
        print("El ganador es: \(resultado)")    
    }
    
}
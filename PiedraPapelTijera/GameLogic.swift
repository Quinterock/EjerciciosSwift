import Foundation

func determineWinner(playerChoice: Opciones, computerChoice: Opciones) -> String {
    if playerChoice == computerChoice {
        return "Es un empate!"
    }

    switch (playerChoice, computerChoice) {
        case (.piedra, .tijera), (.papel, .piedra), (.tijera, .papel)
        return "Ganaste!"
        default: 
        return "Perdiste!"
    }
}
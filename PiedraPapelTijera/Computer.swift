import Foundation

func computerChoice() -> Opciones {
    return Opciones(rawValue: Int(in: 0...2))!
}
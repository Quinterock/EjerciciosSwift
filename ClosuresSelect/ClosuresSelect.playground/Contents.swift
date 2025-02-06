import Foundation


// MARK: - Exercise 1: startWithVowels
/// Filtra un array de strings para obtener solo aquellos que comienzan con vocal
///
/// - Parameter strings: Un array de strings (`[String]`) a filtrar
///
/// - Returns: Un array de strings (`[String]`) que contiene solo las cadenas que empiezan por vocal
///
/// La función es case-insensitive (funciona tanto con mayúsculas como minúsculas)
/// e ignora caracteres acentuados
///
/// Ejemplo de uso:
/// ```swift
/// let words = ["Avión", "Casa", "Iglesia", "Mesa", "Oso"]
/// let result = startWithVowels(strings: words)
/// print(result) // Output: ["Avión", "Iglesia", "Oso"]
/// ```

func startWithVowels(strings: [String]) -> [String] {
    let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
    return strings.filter { vocal in
        if let firstCharacter = vocal.first?.lowercased() {
            return vowels.contains(firstCharacter)
        }
        return false
    }
}
print("Ejercicio 1")
let words1 = ["Avión", "Casa", "Iglesia", "Mesa", "Oso"]
let result1 = startWithVowels(strings: words1)
print(result1) // Output: ["Avión", "Iglesia", "Oso"]



// MARK: - Exercise 2: longerThan
/// Filtra un array de strings para obtener aquellos cuya longitud es mayor que un valor especificado
///
/// - Parameters:
///   - strings: Un array de strings (`[String]`) a filtrar
///   - length: Un entero (`Int`) que especifica la longitud mínima
///
/// - Returns: Un array de strings (`[String]`) con las cadenas más largas que `length`
///
/// Ejemplo de uso:
/// ```swift
/// let words = ["Hola", "Mundo", "Programación", "Swift"]
/// let result = longerThan(strings: words, length: 5)
/// print(result) // Output: ["Programación"]
/// ```

func longerThan(strings: [String], length: Int) -> [String] {
    return strings.filter { $0.count > length }
}

print("\nEjercicio 2")
let words2 = ["Hola", "Mundo", "Programación", "Swift"]
let result2 = longerThan(strings: words2, length: 5)
print(result2) // Output: ["Programación"]


// MARK: - Exercise 3: select
/// Filtra un array de strings usando un predicado personalizable
///
/// - Parameters:
///   - sequence: Un array de strings (`[String]`) a filtrar
///   - predicate: Una closure que recibe un `String` y devuelve un `Bool`
///
/// - Returns: Un array de strings (`[String]`) que cumplen con el predicado
///
/// Ejemplo de uso:
/// ```swift
/// let words = ["Swift", "iOS", "Programming"]
/// let result = select(sequence: words) { $0.count > 3 }
/// print(result) // Output: ["Swift", "Programming"]
/// ```

func select(sequence: [String], predicate: (String) -> Bool) -> [String] {
    return sequence.filter(predicate)
}
print("\nEjercicio 3")
let words3 = ["Swift", "iOS", "Programming"]
let result3 = select(sequence: words3) { $0.count > 3 }
print(result3) // Output: ["Swift", "Programming"]


// MARK: - Exercise 4: longerThanFive
/// Verifica si un string tiene una longitud mayor que 5
///
/// - Parameter text: El string (`String`) a verificar
///
/// - Returns: `true` si la longitud es mayor que 5, `false` en caso contrario
///
/// Esta función está diseñada para ser usada como predicado en la función `select`

print("\nEjercicio 4")
func longerThanFive(text: String) -> Bool {
    return {$0 > 5}
}

// MARK: - Exercise 5: startingWithVowelWordsFrom
/// Filtra un array de strings para obtener aquellos que comienzan con vocal, utilizando la función `select`
///
/// - Parameter sequence: Un array de strings (`[String]`) a filtrar
///
/// - Returns: Un array de strings (`[String]`) que comienzan con vocal
///
/// Ejemplo de uso:
/// ```swift
/// let words = ["Avión", "Casa", "Iglesia", "Mesa", "Oso"]
/// let result = startingWithVowelWordsFrom(sequence: words)
/// print(result) // Output: ["Avión", "Iglesia", "Oso"]
/// ```

func startingWithVowelWordsFrom(sequence: [String]) -> [String] {
    return select(sequence: sequence) {startWithVowels(strings: [$0])}
}
/// let words = ["Avión", "Casa", "Iglesia", "Mesa", "Oso"]
/// let result = startingWithVowelWordsFrom(sequence: words)
/// print(result) // Output: ["Avión", "Iglesia", "Oso"]
// MARK: - Exercise 6: select2
/// Versión mejorada de `select` que incluye una closure de finalización
///
/// - Parameters:
///   - sequence: Un array de strings (`[String]`) a filtrar
///   - predicate: Una closure que recibe un `String` y devuelve un `Bool`
///   - completion: Una closure que se ejecuta al finalizar con el resultado del filtrado
///
/// - Returns: Un array de strings (`[String]`) que cumplen con el predicado
///
/// La función ejecuta la closure de completion con el resultado antes de retornarlo



// MARK: - Exercise 7: wordsInUppercaseFrom
/// Filtra e imprime strings que están completamente en mayúsculas
///
/// - Parameter sequence: Un array de strings (`[String]`) a filtrar
///
/// - Returns: Un array de strings (`[String]`) que están completamente en mayúsculas
///
/// La función imprime el resultado después de 3 segundos, mostrando cada palabra
/// en minúsculas
///
/// Ejemplo de uso:
/// ```swift
/// let words = ["HOLA", "Mundo", "SWIFT", "programming"]
/// let result = wordsInUppercaseFrom(sequence: words)
/// // Después de 3 segundos imprime:
/// // Las cadenas que estaban en mayúsculas eran:
/// // hola
/// // swift
/// ```




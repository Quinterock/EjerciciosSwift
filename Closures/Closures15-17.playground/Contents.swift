// MARK: - Exercise 15: compress with completion
/// Combina los elementos de un array de enteros usando una operación específica y ejecuta una acción al finalizar
///
/// - Parameters:
///   - sequence: Un array de enteros (`[Int]`) que contiene los números a combinar
///   - initialValue: El valor inicial para comenzar la combinación (por defecto es 0)
///   - combinationOperation: Una función que toma dos enteros y retorna un entero,
///     definiendo cómo se combinarán los elementos
///   - completion: Una closure de finalización que se ejecuta cuando la operación ha terminado,
///     independientemente del resultado. No recibe parámetros y no retorna ningún valor
///
/// - Returns: Un entero opcional (`Int?`) que representa:
///   - El resultado de combinar todos los elementos según la operación especificada
///   - `nil` si el array está vacío
///
/// - Important: El completion handler se ejecutará SIEMPRE, incluso si el array está vacío
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [1, 2, 3, 4]
///
/// // Ejemplo básico con completion
/// let result = compress(sequence: numbers,
///                      combinationOperation: { $0 + $1 }) {
///     print("¡Operación completada!")
/// }
/// // Output: "¡Operación completada!"
/// // result contiene Optional(10)
///
/// // Ejemplo con valor inicial personalizado
/// let resultWithInitial = compress(
///     sequence: numbers,
///     initialValue: 5,
///     combinationOperation: { $0 + $1 }) {
///         print("Suma completada con valor inicial")
/// }
/// // Output: "Suma completada con valor inicial"
/// // resultWithInitial contiene Optional(15)
///
/// // Ejemplo con array vacío
/// let empty = [Int]()
/// let emptyResult = compress(
///     sequence: empty,
///     combinationOperation: { $0 + $1 }) {
///         print("Procesamiento de array vacío completado")
/// }
/// // Output: "Procesamiento de array vacío completado"
/// // emptyResult contiene nil
/// ```

func compress(sequence: [Int],
              initialValue: Int = 0,
              combinationOperation: (Int, Int) -> Int,
              completion: (() -> Void)? = nil) -> Int? {
    
    guard !sequence.isEmpty else {
        completion?() //Se ejecuta si el array esta vacio
        return nil //Sale de la funcion
    }
    
    let result = sequence.reduce(initialValue, combinationOperation)
    
    completion?()
    return result
}

// Ejemplo de uso
let numbers = [1, 2, 3, 4]

let result = compress(sequence: numbers,
                      combinationOperation: { $0 + $1 }) {
    print("¡Operación completada!")
}
print(result ?? "nil") // Output: Optional(10)

// MARK: - Exercise 16: squareSumAndPrintWithCompress
/// Calcula la suma de los cuadrados de una secuencia de números e imprime un mensaje al completar
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a procesar
///
/// - Returns: Un entero opcional (`Int?`) que representa:
///   - La suma de los cuadrados de todos los números en la secuencia
///   - `nil` si el array está vacío
///
/// La función imprime "squareSumAndPrintWithCompress operation completed." cuando termina la operación,
/// independientemente del resultado
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [1, 2, 3]
/// let result = squareSumAndPrintWithCompress(sequence: numbers)
/// // Imprime: "squareSumAndPrintWithCompress operation completed."
/// print(result) // Output: Optional(14) // (1² + 2² + 3² = 1 + 4 + 9 = 14)
///
/// let empty = [Int]()
/// let emptyResult = squareSumAndPrintWithCompress(sequence: empty)
/// // Imprime: "squareSumAndPrintWithCompress operation completed."
/// print(emptyResult) // Output: nil
///
/// let singleNumber = [5]
/// let singleResult = squareSumAndPrintWithCompress(sequence: singleNumber)
/// // Imprime: "squareSumAndPrintWithCompress operation completed."
/// print(singleResult) // Output: Optional(25) // (5² = 25)
/// ```

func squareSumAndPrintWithCompress(sequence: [Int]) -> Int? {
    guard !sequence.isEmpty else {
        print("squareSumAndPrintWithCompress operation completed.")
        return nil
    }
    //let result = sequence.reduce(0) {$0 + $1 * $1}
    let result = sequence.reduce(0){(accumulator, currentValue) in accumulator + currentValue * currentValue
    }
    print("squareSumAndPrintWithCompress operation completed.")
    return result
}

// MARK: - Exercise 17: sumMultiplesOfThreeAndPrintWithCompress
/// Calcula la suma de los múltiplos de 3 en una secuencia e imprime un mensaje después de 4 segundos
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a procesar
///
/// - Returns: Un entero opcional (`Int?`) que representa:
///   - La suma de todos los números que son múltiplos de 3 en la secuencia
///   - `nil` si el array está vacío
///
/// - Important: La función imprime "sumMultiplesOfThreeAndPrintWithCompress operation completed."
///   4 segundos después de completar la operación. Buscad cómo implementar este delay.
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [1, 3, 4, 6, 7, 9]
/// let result = sumMultiplesOfThreeAndPrintWithCompress(sequence: numbers)
/// print(result) // Output: Optional(18) // (3 + 6 + 9 = 18)
/// // Después de 4 segundos imprime:
/// // "sumMultiplesOfThreeAndPrintWithCompress operation completed."
///
/// let noMultiples = [1, 2, 4, 5, 7, 8]
/// let resultNoMultiples = sumMultiplesOfThreeAndPrintWithCompress(sequence: noMultiples)
/// print(resultNoMultiples) // Output: Optional(0)
/// // Después de 4 segundos imprime:
/// // "sumMultiplesOfThreeAndPrintWithCompress operation completed."
///
/// let empty = [Int]()
/// let emptyResult = sumMultiplesOfThreeAndPrintWithCompress(sequence: empty)
/// print(emptyResult) // Output: nil
/// // Después de 4 segundos imprime:
/// // "sumMultiplesOfThreeAndPrintWithCompress operation completed."
/// ```

func sumMultiplesOfThreeAndPrintWithCompress(sequence: [Int]) -> Int? {
    guard !sequence.isEmpty else { Dispatch.main.asyncAfter(dead);
        return nil}
    return sequence.reduce(0) { ($0 + $1 % 3 == 0 ? $1 : 0)}
}

//DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//    // Este código se ejecutará después de 5 segundos
//    print("¡5 segundos han pasado!")
//}

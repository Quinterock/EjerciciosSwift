import Foundation

// MARK: - Exercise 1: sumAll
/// Calcula la suma de todos los elementos en un array de números enteros
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a sumar
///
/// - Returns: Un entero (`Int`) que representa la suma de todos los elementos del array.
/// Si el array está vacío, retorna 0 ya que es el elemento neutro de la suma.
///
/// # Implementación
/// Utiliza un bucle for para iterar sobre cada elemento y mantiene un acumulador
///
/// Ejemplo de uso:
///
/// let numbers = [1, 2, 3, 4, 5]
/// let result = sumAll(sequence: numbers)
/// print(result) // Output: 15
///
/// let empty = [Int]()
/// let resultEmpty = sumAll(sequence: empty)
/// print(resultEmpty) // Output: 0
///

func sumAll (sequence: [Int]) -> Int {
    //return sequence.reduce(0, {acomulador, numero in
        //acomulador + numero})
    //return sequence.reduce(0, {$0 + $1})
    return sequence.reduce(0, +)
}

let numbers = [1, 2, 3, 4, 5]
let result1 = sumAll(sequence: numbers)
print(result1)//15

// MARK: - Exercise 2: multiplyAll
/// Calcula el producto de todos los elementos en un array de números enteros
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a multiplicar
///
/// - Returns: Un entero (`Int`) que representa el producto de todos los elementos del array.
/// Si el array está vacío, retorna 1 ya que es el elemento neutro de la multiplicación.
///
/// # Implementación
/// Utiliza un bucle for para iterar sobre cada elemento y mantiene un acumulador del producto
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [2, 3, 4]
/// let result = multiplyAll(sequence: numbers)
/// print(result) // Output: 24
///
/// let empty = [Int]()
/// let resultEmpty = multiplyAll(sequence: empty)
/// print(resultEmpty) // Output: 1
/// ```

func multiplyAll(sequence: [Int]) -> Int {
    return sequence.reduce(1, *)
}

let numbers2 = [2, 3, 4]
let result2 = multiplyAll(sequence: numbers2)
print(result2)

let empty2 = [Int]()
let resultEmpty2 = multiplyAll(sequence: empty2)
print(resultEmpty2) 

// MARK: - Exercise 3: compress
/// Tipo alias que representa una función que combina dos enteros y produce un resultado entero. Debe llamarse IntCombiner


/// Reduce un array de enteros a un único valor mediante una operación de combinación especificada como último parámetro
///
/// - Parameters:
///   - sequence: Un array de enteros (`[Int]`) que se desea comprimir
///   - initialValue: El valor inicial (`Int`) que se usará como punto de partida para la combinación
///   - combinationOperation: Una función del tipo `IntCombiner` que define cómo combinar dos enteros.
///     Esta función toma dos parámetros enteros y devuelve un entero como resultado
///
/// - Returns: Un entero (`Int`) que representa el resultado de aplicar secuencialmente
///   la operación de combinación a todos los elementos del array
///
/// # Implementación
/// La función utiliza un acumulador que comienza con el valor inicial y aplica
/// la operación de combinación con cada elemento del array secuencialmente
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [1, 2, 3, 4]
///
/// // Ejemplo de suma
/// let sum = compress(sequence: numbers,
///                   initialValue: 0,
///                   combinationOperation: { $0 + $1 })
/// print(sum) // Output: 10
///
/// // Ejemplo de multiplicación
/// let product = compress(sequence: numbers,
///                       initialValue: 1,
///                       combinationOperation: { $0 * $1 })
/// print(product) // Output: 24
///
/// // Ejemplo con función nombrada
/// func max(_ a: Int, _ b: Int) -> Int { return a > b ? a : b }
/// let maximum = compress(sequence: numbers,
///                       initialValue: Int.min,
///                       combinationOperation: max)
/// print(maximum) // Output: 4
/// ```

typealias IntCombiner = (Int, Int) -> Int

func compress(sequence: [Int], initialValue : Int, combinationOperation: IntCombiner) -> Int {
    return sequence.reduce(initialValue, combinationOperation)
}

let numbers3 = [1, 2, 3, 4]

// Ejemplo de suma
let sum = compress(sequence: numbers3, initialValue: 0, combinationOperation: { $0 + $1 })
print(sum) // Output: 10

// Ejemplo de multiplicación
let product = compress(sequence: numbers3, initialValue: 1, combinationOperation: { $0 * $1 })
print(product) // Output: 24

// MARK: Exercise 4: sumWithCompress
/// Calcula la suma de todos los elementos en un array de enteros utilizando la función `compress`
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a sumar
///
/// - Returns: Un entero (`Int`) que representa la suma de todos los elementos del array.
/// Si el array está vacío, retorna 0 (el valor inicial)
///
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [1, 2, 3, 4, 5]
/// let result = sumWithCompress(sequence: numbers)
/// print(result) // Output: 15
///
/// let empty = [Int]()
/// let resultEmpty = sumWithCompress(sequence: empty)
/// print(resultEmpty) // Output: 0
/// ```

func sumWithCompress(sequence: [Int]) -> Int {
    return compress(sequence: sequence, initialValue: 0, combinationOperation: +)
}

let numbers4 = [1, 2, 3, 4, 5]
let result4 = sumWithCompress(sequence: numbers4)
print(result4)

let empty4 = [Int]()
let resultEmpty4 = sumWithCompress(sequence: empty4)
print(resultEmpty4)

// MARK: Exercise 5: multiplyWithCompress
/// Calcula el producto de todos los elementos en un array de enteros utilizando la función `compress`
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a multiplicar
///
/// - Returns: Un entero (`Int`) que representa el producto de todos los elementos del array.
/// Si el array está vacío, retorna 1 (el valor inicial, elemento neutro de la multiplicación)
///
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [2, 3, 4]
/// let result = multiplyWithCompress(sequence: numbers)
/// print(result) // Output: 24
///
/// let empty = [Int]()
/// let resultEmpty = multiplyWithCompress(sequence: empty)
/// print(resultEmpty) // Output: 1
/// ```

func multiplyWithCompress (sequence: [Int]) -> Int {
return compress(sequence: sequence, initialValue: 1, combinationOperation: *)
}
let numbers5 = [2, 3, 4]
let result5 = multiplyWithCompress(sequence: numbers5)
print(result5)

let empty5 = [Int]()
let resultEmpty5 = multiplyWithCompress(sequence: empty5)
print(resultEmpty5)

// MARK: Exercise 6: sumEvenWithCompress
/// Calcula la suma de todos los números pares en un array de enteros utilizando la función `compress`
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a evaluar
///
/// - Returns: Un entero (`Int`) que representa la suma de todos los números pares del array.
/// Si el array está vacío o no contiene números pares, retorna 0
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [1, 2, 3, 4, 5, 6]
/// let result = sumEvenWithCompress(sequence: numbers)
/// print(result) // Output: 12 (2 + 4 + 6)
///
/// let noEvens = [1, 3, 5, 7]
/// let resultNoEvens = sumEvenWithCompress(sequence: noEvens)
/// print(resultNoEvens) // Output: 0
///
/// let empty = [Int]()
/// let resultEmpty = sumEvenWithCompress(sequence: empty)
/// print(resultEmpty) // Output: 0
/// ```
func sumEvenWithCompress(sequence: [Int]) -> Int {
return compress(sequence: sequence, initialValue: 0, combinationOperation:
                    {$1 % 2 == 0 ? $0 + $1 : $0})
}

let numbers6 = [1, 2, 3, 4, 5, 6]
let result6 = sumEvenWithCompress(sequence: numbers6)
print(result6)

let noEvens = [1, 3, 5, 7]
let resultNoEvens = sumEvenWithCompress(sequence: noEvens)
print(resultNoEvens)

let empty6 = [Int]()
let resultEmpty6 = sumEvenWithCompress(sequence: empty6)
print(resultEmpty6)

// MARK: Exercise 7: sumEvensSubtractOddsWithCompress
/// Calcula la diferencia entre la suma de números pares y la suma de números impares en un array de enteros
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a evaluar
///
/// - Returns: Un entero (`Int`) que representa el resultado de sumar todos los números pares
/// y restar todos los números impares del array. Si el array está vacío, retorna 0
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [1, 2, 3, 4]
/// let result = sumEvensSubtractOddsWithCompress(sequence: numbers)
/// print(result) // Output: 2 ((2 + 4) - (1 + 3))
///
/// let onlyEvens = [2, 4, 6]
/// let resultEvens = sumEvensSubtractOddsWithCompress(sequence: onlyEvens)
/// print(resultEvens) // Output: 12
///
/// let onlyOdds = [1, 3, 5]
/// let resultOdds = sumEvensSubtractOddsWithCompress(sequence: onlyOdds)
/// print(resultOdds) // Output: -9
///
/// let empty = [Int]()
/// let resultEmpty = sumEvensSubtractOddsWithCompress(sequence: empty)
/// print(resultEmpty) // Output: 0
/// ```
func sumEvensSubtractOddsWithCompress(sequence: [Int]) -> Int {
    return compress(sequence: sequence, initialValue: 0, combinationOperation: { $1 % 2 == 0 ? $0 + $1 : $0 - $1 })
}
let numbers7 = [1, 2, 3, 4]
let result7 = sumEvensSubtractOddsWithCompress(sequence: numbers7)
print(result7)  // Output: 2 ((2 + 4) - (1 + 3))

let onlyEvens = [2, 4, 6]
let resultEvens7 = sumEvensSubtractOddsWithCompress(sequence: onlyEvens)
print(resultEvens7)  // Output: 12

let onlyOdds7 = [1, 3, 5]
let resultOdds7 = sumEvensSubtractOddsWithCompress(sequence: onlyOdds7)
print(resultOdds7)  // Output: -9

let empty7 = [Int]()
let resultEmpty7 = sumEvensSubtractOddsWithCompress(sequence: empty7)
print(resultEmpty7)  // Output: 0

// MARK: Exercise 8: maxElementWithCompress
/// Encuentra el elemento más grande en un array de enteros utilizando la función `compress`
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a evaluar
///
/// - Returns: Un entero (`Int`) que representa el valor máximo encontrado en el array.
/// Si el array está vacío, retorna `Int.min` (el valor mínimo posible para un Int)
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [1, 5, 2, 8, 3]
/// let result = maxElementWithCompress(sequence: numbers)
/// print(result) // Output: 8
///
/// let negatives = [-5, -2, -8, -1]
/// let resultNeg = maxElementWithCompress(sequence: negatives)
/// print(resultNeg) // Output: -1
///
/// let empty = [Int]()
/// let resultEmpty = maxElementWithCompress(sequence: empty)
/// print(resultEmpty) // Output: Int.min
///
/// let singleElement = [42]
/// let resultSingle = maxElementWithCompress(sequence: singleElement)
/// print(resultSingle) // Output: 42
/// ```

func maxElementsWithCompress (sequence: [Int]) -> Int {
    if sequence.isEmpty {
        return Int.min
    }
    return compress(sequence: sequence, initialValue: Int.min, combinationOperation: max)
}

let numbers8 = [1, 5, 2, 8, 3]
let result8 = maxElementsWithCompress(sequence: numbers8)
print(result8)

let negatives8 = [-5, -2, -8, -1]
let resultNeg8 = maxElementsWithCompress(sequence: negatives8)
print(resultNeg8)

let empty8 = [Int]()
let resultEmpty8 = maxElementsWithCompress(sequence: empty8)
print(resultEmpty8)

let singleElement8 = [42]
let resultSingle8 = maxElementsWithCompress(sequence: singleElement8)
print(resultSingle8)

// MARK: Exercise 9: minElementWithCompress
/// Encuentra el elemento más pequeño en un array de enteros utilizando la función `compress`
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a evaluar
///
/// - Returns: Un entero (`Int`) que representa el valor mínimo encontrado en el array.
/// Si el array está vacío, retorna `Int.max` (el valor máximo posible para un Int)
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [3, 1, 5, 2, 8]
/// let result = minElementWithCompress(sequence: numbers)
/// print(result) // Output: 1
///
/// let negatives = [-5, -2, -8, -1]
/// let resultNeg = minElementWithCompress(sequence: negatives)
/// print(resultNeg) // Output: -8
///
/// let empty = [Int]()
/// let resultEmpty = minElementWithCompress(sequence: empty)
/// print(resultEmpty) // Output: Int.max
///
/// let singleElement = [42]
/// let resultSingle = minElementWithCompress(sequence: singleElement)
/// print(resultSingle) // Output: 42
/// ```

func minElementWithCompress(sequence: [Int]) -> Int {
    if sequence.isEmpty {
        return Int.max
    }
    return compress(sequence: sequence, initialValue: Int.max, combinationOperation: min)
}

let numbers9 = [3, 1, 5, 2, 8]
let result9 = minElementWithCompress(sequence: numbers9)
print(result9)

let negatives9 = [-5, -2, -8, -1]
let resultNeg9 = minElementWithCompress(sequence: negatives9)
print(resultNeg9)

let empty9 = [Int]()
let resultEmpty9 = minElementWithCompress(sequence: empty9)
print(resultEmpty9)

let singleElement9 = [42]
let resultSingle9 = minElementWithCompress(sequence: singleElement9)
print(resultSingle9)

// MARK: - Exercise 10: positiveNumbersCountWithCompress
/// Cuenta la cantidad de números positivos en un array de enteros utilizando la función `compress`
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a evaluar
///
/// - Returns: Un entero (`Int`) que representa la cantidad de números positivos (mayores que 0)
/// encontrados en el array. Si el array está vacío, retorna 0
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [-1, 0, 3, -4, 5, 6]
/// let result = positiveNumbersCountWithCompress(sequence: numbers)
/// print(result) // Output: 3 (cuenta 3, 5, 6)
///
/// let allNegative = [-1, -2, -3]
/// let resultNeg = positiveNumbersCountWithCompress(sequence: allNegative)
/// print(resultNeg) // Output: 0
///
/// let withZero = [0, 0, 0]
/// let resultZero = positiveNumbersCountWithCompress(sequence: withZero)
/// print(resultZero) // Output: 0 (el cero no se considera positivo)
///
/// let empty = [Int]()
/// let resultEmpty = positiveNumbersCountWithCompress(sequence: empty)
/// print(resultEmpty) // Output: 0
/// ```

func positiveNumbersCountWithCompress(sequence: [Int]) -> Int {
    return compress(sequence: sequence, initialValue: 0, combinationOperation: { $0 + ($1 > 0 ? 1 : 0) })
}
let numbers10 = [-1, 0, 3, -4, 5, 6]
let result10 = positiveNumbersCountWithCompress(sequence: numbers10)
print(result10)

let allNegative10 = [-1, -2, -3]
let resultNeg10 = positiveNumbersCountWithCompress(sequence: allNegative10)
print(resultNeg10)

let withZero10 = [0, 0, 0]
let resultZero10 = positiveNumbersCountWithCompress(sequence: withZero10)
print(resultZero10)

let empty10 = [Int]()
let resultEmpty10 = positiveNumbersCountWithCompress(sequence: empty10)
print(resultEmpty10)

// MARK: - Exercise 11: allEvensWithCompress
/// Verifica si todos los números en un array de enteros son pares utilizando la función `compress`
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a evaluar
///
/// - Returns: Un booleano (`Bool`) que indica:
///   - `true` si todos los números en el array son pares
///   - `false` si hay al menos un número impar o si el array está vacío
///
/// La función funciona contando los números pares y comparando este contador
/// con el tamaño total del array. Si son iguales, significa que todos son pares.
///
/// Ejemplo de uso:
/// ```swift
/// let allEven = [2, 4, 6, 8]
/// let result1 = allEvensWithCompress(sequence: allEven)
/// print(result1) // Output: true
///
/// let someOdd = [2, 4, 5, 6]
/// let result2 = allEvensWithCompress(sequence: someOdd)
/// print(result2) // Output: false
///
/// let empty = [Int]()
/// let result3 = allEvensWithCompress(sequence: empty)
/// print(result3) // Output: false
///
/// let singleOdd = [3]
/// let result4 = allEvensWithCompress(sequence: singleOdd)
/// print(result4) // Output: false
///
/// let singleEven = [2]
/// let result5 = allEvensWithCompress(sequence: singleEven)
/// print(result5) // Output: true
/// ```

func allEvenWithCompress(sequence: [Int]) -> Bool {
    if sequence.isEmpty {
            return false
        }
    let evenCount = compress(sequence: sequence, initialValue: 0, combinationOperation: { $0 + ($1 % 2 == 0 ? 1 : 0) })
    return evenCount == sequence.count
}
let allEven11 = [2, 4, 6, 8]
let result11 = allEvenWithCompress(sequence: allEven11)
print(result11) // Output: true

let someOdd11 = [2, 4, 5, 6]
let resultOdd11 = allEvenWithCompress(sequence: someOdd11)
print(resultOdd11) // Output: false

let empty11 = [Int]()
let resultEmpty11 = allEvenWithCompress(sequence: empty11)
print(resultEmpty11) // Output: false

let singleOdd11 = [3]
let resultSingleOdd11 = allEvenWithCompress(sequence: singleOdd11)
print(resultSingleOdd11) // Output: false

let singleEven11 = [2]
let resultSingleEven11 = allEvenWithCompress(sequence: singleEven11)
print(resultSingleEven11) // Output: true

// MARK: - Exercise 12: allMultiplesOfThreeWithCompress
/// Verifica si todos los números en un array de enteros son múltiplos de 3 utilizando la función `compress`
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a evaluar
///
/// - Returns: Un booleano (`Bool`) que indica:
///   - `true` si todos los números en el array son múltiplos de 3
///   - `false` si hay al menos un número que no es múltiplo de 3 o si el array está vacío
///
/// La función funciona contando los números que son múltiplos de 3 y comparando este contador
/// con el tamaño total del array. Si son iguales, significa que todos son múltiplos de 3.
///
/// Ejemplo de uso:
/// ```swift
/// let allMultiples = [3, 6, 9, 12]
/// let result1 = allMultiplesOfThreeWithCompress(sequence: allMultiples)
/// print(result1) // Output: true
///
/// let someNotMultiples = [3, 6, 7, 9]
/// let result2 = allMultiplesOfThreeWithCompress(sequence: someNotMultiples)
/// print(result2) // Output: false
///
/// let empty = [Int]()
/// let result3 = allMultiplesOfThreeWithCompress(sequence: empty)
/// print(result3) // Output: false
///
/// let singleNotMultiple = [4]
/// let result4 = allMultiplesOfThreeWithCompress(sequence: singleNotMultiple)
/// print(result4) // Output: false
///
/// let singleMultiple = [6]
/// let result5 = allMultiplesOfThreeWithCompress(sequence: singleMultiple)
/// print(result5) // Output: true
/// ```

func allMultiplesOfThreeWithCompress(sequence: [Int]?) -> Bool {
    guard let sequence = sequence else {
        return false 
    }
    
    if sequence.isEmpty {
        return false 
    }
    
    let multipleOfThree = compress(sequence: sequence, initialValue: 0, combinationOperation:  {$0 + ($1 % 3 == 0 ? 1 : $0)})
    return multipleOfThree == sequence.count
}
let allMultiples12 = [3, 6, 9, 12]
let result12 = allMultiplesOfThreeWithCompress(sequence: allMultiples12)
print(result12) // Output: true

let someNotMultiples12 = [3, 6, 7, 9]
let resultNotMultiples12 = allMultiplesOfThreeWithCompress(sequence: someNotMultiples12)
print(resultNotMultiples12) // Output: false

let empty12 = [Int]()
let resultEmpty12 = allMultiplesOfThreeWithCompress(sequence: empty12)
print(resultEmpty12) // Output: false

let singleNotMultiple12 = [4]
let resultSingleNotMultiple12 = allMultiplesOfThreeWithCompress(sequence: singleNotMultiple12)
print(resultSingleNotMultiple12) // Output: false

let singleMultiple12 = [6]
let resultSingleMultiple12 = allMultiplesOfThreeWithCompress(sequence: singleMultiple12)
print(resultSingleMultiple12) // Output: true

// MARK: - Exercise 13: sumAllEvensAndOddsWithCompress
/// Calcula simultáneamente la suma de los números pares e impares en un array de enteros
/// utilizando dos llamadas a la función `compress`
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a evaluar
///
/// - Returns: Una tupla de dos enteros donde:
///   - `evens`: La suma de todos los números pares
///   - `odds`: La suma de todos los números impares
///   Si el array está vacío, retorna (0, 0)
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [1, 2, 3, 4, 5, 6]
/// let result = sumAllEvensAndOddsWithCompress(sequence: numbers)
/// print(result.evens) // Output: 12 (2 + 4 + 6)
/// print(result.odds)  // Output: 9 (1 + 3 + 5)
///
/// let onlyEvens = [2, 4, 6]
/// let resultEvens = sumAllEvensAndOddsWithCompress(sequence: onlyEvens)
/// print(resultEvens) // Output: (evens: 12, odds: 0)
///
/// let onlyOdds = [1, 3, 5]
/// let resultOdds = sumAllEvensAndOddsWithCompress(sequence: onlyOdds)
/// print(resultOdds) // Output: (evens: 0, odds: 9)
///
/// let empty = [Int]()
/// let resultEmpty = sumAllEvensAndOddsWithCompress(sequence: empty)
/// print(resultEmpty) // Output: (evens: 0, odds: 0)
/// ```

func sumAllEvensAndOddsWithCompress(sequence: [Int]) -> (evens: Int, odds: Int) {
    let evens = compress(sequence: sequence, initialValue: 0) { $0 + ($1 % 2 == 0 ? $1 : 0) }
    let odds = compress(sequence: sequence, initialValue: 0) { $0 + ($1 % 2 != 0 ? $1 : 0) }
    return (evens, odds)
}
let numbers13 = [1, 2, 3, 4, 5, 6]
let result13 = sumAllEvensAndOddsWithCompress(sequence: numbers13)
print(result13.evens) // Output: 12 (2 + 4 + 6)
print(result13.odds)  // Output: 9 (1 + 3 + 5)

let onlyEvens13 = [2, 4, 6]
let resultEvens13 = sumAllEvensAndOddsWithCompress(sequence: onlyEvens13)
print(resultEvens13.evens) // Output: 12
print(resultEvens13.odds)  // Output: 0

let onlyOdds13 = [1, 3, 5]
let resultOdds13 = sumAllEvensAndOddsWithCompress(sequence: onlyOdds13)
print(resultOdds13.evens) // Output: 0
print(resultOdds13.odds)  // Output: 9

let empty13 = [Int]()
let resultEmpty13 = sumAllEvensAndOddsWithCompress(sequence: empty13)
print(resultEmpty13.evens) // Output: 0
print(resultEmpty13.odds)  // Output: 0
// MARK: - Exercise 14: compress without initial value
/// Modificación de la función compress sin valor inicial que combina los elementos de un array de enteros usando una operación específica
///
/// - Parameters:
///   - sequence: Un array de enteros (`[Int]`) que contiene los números a combinar
///   - combinationOperation: Una función que toma dos enteros y retorna un entero,
///     definiendo cómo se combinarán los elementos
///
/// - Returns: Un entero opcional (`Int?`) que representa:
///   - El resultado de combinar todos los elementos según la operación especificada
///   - `nil` si el array está vacío
///
/// - Warning: Esta versión de `compress` difiere de la original en que no requiere un valor inicial
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [1, 2, 3, 4]
///
/// // Suma todos los elementos
/// let sum = compress(sequence: numbers) { $0 + $1 }
/// print(sum) // Output: Optional(10)
///
/// // Encuentra el máximo
/// let maximum = compress(sequence: numbers) { max($0, $1) }
/// print(maximum) // Output: Optional(4)
///
/// // Multiplica todos los elementos
/// let product = compress(sequence: numbers) { $0 * $1 }
/// print(product) // Output: Optional(24)
///
/// let empty = [Int]()
/// let resultEmpty = compress(sequence: empty) { $0 + $1 }
/// print(resultEmpty) // Output: nil
///
/// let singleElement = [5]
/// let resultSingle = compress(sequence: singleElement) { $0 + $1 }
/// print(resultSingle) // Output: Optional(5)
/// ```

func compress1(sequence: [Int], // Suma: [1, 2, 3, 4] ->  accum = 1, number = 2 ||| accum = 3, number = 3 ||| accum = 6, number = 4
              // Multiplicación: [1, 2, 3, 4] ->  accum = 1, number = 2 ||| accum = 2, number = 3 ||| accum = 6, number = 4 ||| accum = 24
               // Mayor valor: [1, 2, 3, 4] ->  accum = 1, number = 2 ||| accum = 2, number = 3 ||| accum = 3, number = 4 ||| accum = 4
             combinationOperation: IntCombiner) -> Int? {
    // Si no conseguimos valor incial no podemos seguir con esta implementación
    if sequence.isEmpty {
        return nil
    }
    var accum = sequence.first! // Force unwrap porque el primer elemento existe
    for number in sequence.dropFirst() {
        accum = combinationOperation(accum, number)
    }
    return accum
}



func compress3(_ sequence:[Int], _ combinationOperation:IntCombiner) -> Int? {
    guard let initialValue = sequence.first else {
        return nil
    }
    
    return sequence.reduce(initialValue,combinationOperation)
}
// Ejemplo 1: Suma
let numbers14 = [1, 2, 3, 4]
let sum14 = compress1(sequence: numbers14) { $0 + $1 }
print(sum14) // Output: Optional(10)

// Ejemplo 2: Máximo
let maximum14 = compress1(sequence: numbers14) { max($0, $1) }
print(maximum14) // Output: Optional(4)

// Ejemplo 3: Producto
let product14 = compress1(sequence: numbers14) { $0 * $1 }
print(product14) // Output: Optional(24)

// Ejemplo 4: Array vacío
let empty14 = [Int]()
let resultEmpty14 = compress1(sequence: empty14) { $0 + $1 }
print(resultEmpty14) // Output: nil

// Ejemplo 5: Un solo elemento
let singleElement14 = [5]
let resultSingle14 = compress1(sequence: singleElement14) { $0 + $1 }
print(resultSingle14) // Output: Optional(5)



let sum3 = compress3([1, 2, 3, 4]) { $0 + $1 }
print(sum3) // Output: Optional(10)

let max3 = compress3([1, 2, 3, 4]) { max($0, $1) }
print(max3) // Output: Optional(4)

let product3 = compress3([1, 2, 3, 4]) { $0 * $1 }
print(product3) // Output: Optional(24)

let empty3 = [Int]()
let resultEmpty3 = compress3(empty3) { $0 + $1 }
print(resultEmpty3) // Output: nil

let singleElement3 = [5]
let resultSingle3 = compress3(singleElement3) { $0 + $1 }
print(resultSingle3) // Output: Optional(5)

 

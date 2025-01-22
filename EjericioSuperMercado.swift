import Foundation
import Cocoa

///Paso 1: Tipos de datos
let supermarketName = "Super Awesome Market"
let supermarketAddress = "Calle Ficticia, 123"
let operativeYears = 10
let customerSatisfactionLevel = 4.5
var isOpen = true

///Paso 2: Arrays - Gestionar inventario

var products = ["manzanas","plátanos","leche","huevos","pan"]
products.append("caramelos")

print(products.count)

///3: Sets - Seguimiento de clientes frecuentes

var frequentCustomers: Set<String> = ["alice", "bob", "charlie"]
frequentCustomers.remove("charlie")
frequentCustomers.insert("diana")

if frequentCustomers.contains("alice"){
    print("alice es cliente frecuente")
}else {
    print("alice no es cliente frecuente")
}
print("Clientes frecuentes actuales: \(frequentCustomers)")

///Paso 4: Tuplas - Información de ofertas

let weeklyOffer = (product: "manzanas", price: 2.99, discount: 20)
let newPrice = weeklyOffer.price * (1 - (Double(weeklyOffer.discount) / 100))
print(newPrice)

///Paso 5: Diccionarios - Registro de ventas

// Paso 1: Crear el diccionario
var salesRecord: [String: Int] = [
    "manzanas": 50,
    "plátanos": 30,
    "leche": 20,
    "huevos": 10
]

// Paso 2: Actualizar los datos
salesRecord["manzanas"]? += 5  
salesRecord["huevos"] = 0      

// Paso 3: Imprimir el producto y su cantidad vendida
for (producto, cantidad) in salesRecord {
    print("\(producto): \(cantidad)")
}
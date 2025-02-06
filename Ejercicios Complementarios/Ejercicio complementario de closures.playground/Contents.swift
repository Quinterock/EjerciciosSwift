import Cocoa

/*
Ejercicio: Simulación de Proceso de Entrega de Ordenes

Objetivo:
Implementar un sistema que simula el flujo de trabajo de un restaurante para procesar y entregar órdenes utilizando Structs y Closures. Varias entidades (Camarero, Cocinero y Repartidor) interactúan en este sistema y transicionan entre diferentes etapas (preparación y entrega) usando retardos para simular el tiempo requerido para cada operación.

Requisitos:
1. Crear una estructura `Orden` que represente un pedido con propiedades para un identificador único y una descripción de la orden.
2. Implementar un `Camarero`que tiene que hacer el pedido. Se supone que es inmediato
2. Implementar un `Cocinero` que tiene la responsabilidad de preparar pedidos. Cada pedido tarda 5 segundos en completarse
3. Implementar un `Repartidor` que maneja la entrega de pedidos. El repartidor tarda 3 segundos en llevar el pedido
4. Probar el flujo completo con al menos una orden, asegurando que las operaciones de preparación y entrega se ejecutan coherentemente.
5. Cada vez que uno de los trabajadores, sea camarero, cocinero o repartidor, ejecuta su acción, debe imprimirse un mensaje por pantalla. Por ejemplo:

 El camarero hace el pedido Pizza Margherita.
 Cocinero está preparando el pedido Pizza Margherita.
 El pedido Pizza Margherita está listo.
 Repartidor ha recogido el pedido Pizza Margherita.
 El pedido Pizza Margherita ha sido entregado.
 Proceso completado para el pedido: Pizza Margherita
 
Instrucciones:
1. Usa los structs `Orden`, `Camarero`, `Cocinero` y `Repartidor` para modelar el sistema.
*/

struct Order {
    var id: Int
    var orderDescription: String
}

struct Waiter {
    func takeOrder(_ order: Order, completeOrder: (Order) -> Void) {
        print("The waiter took the order: \(order.orderDescription)")
        completeOrder(order)
        print("El camarero se pone a limpiar el restaurante.")
    }
}

struct Chef {
    func prepareOrder(_ order: Order, completeOrder: (Order) -> Void){
        print("Se está preparando el pedido \(order.orderDescription)...")
//        DispatchQueue.global().asyncAfter(deadline: .now() + 5, execute: d)
        sleep(5)
        print("La orden \(order.orderDescription) completada")
        completeOrder(order)
    }
}

struct Repartidor {
    func entregarOrden(_ order: Order, completado: (Order) -> Void) {
        print("Se está preparando el pedido \(order.orderDescription)...")

        sleep(5)
        print("La orden \(order.orderDescription) completada")
        completado(order)
    }
}

let pedido1 = Order(id: 1, orderDescription: "Pizza Margherita")

let camarero = Waiter()
let cocinero = Chef()
let repartidor = Repartidor()

camarero.takeOrder(pedido1) { order in
    cocinero.prepareOrder(order) { order in
        repartidor.entregarOrden(order) { order in
            print("Proceso completado para el pedido: \(order.orderDescription)")
        }
    }
}

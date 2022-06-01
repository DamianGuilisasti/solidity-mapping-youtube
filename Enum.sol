// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.7;

contract MyContract {

    // Enum: Representar diferentes opciones.
    // En Solidity, Enum significa Enumerable.
    // Enums son user-defined data types que restringen la variable para tener sólo uno de los valores predefinidos.

    // Internamente, Enums son tratados como números.
    // Solidity automáticamente convierte los Enums a unsigned integers.

    // Un Enum debe tener por lo menos uno de los valores de la lista.
    // Este valor no puede ser un número (positivo o negativo) o un boolean (true o false).
    
    // Default 0.

    // Creating an Enum

    enum SHIPPING_STATUS { None, Pending, Shipped, Rejected, Canceled }
    enum ORDER_STATUS { None, Pending, Completed, Rejected, Canceled }

    // Declaring a variable of type Enum.

    ORDER_STATUS orderStatus;
    SHIPPING_STATUS shippingStatus;

    // Update Function

    function setCompleted() external {
        orderStatus = ORDER_STATUS.Completed;
    }

    // Read Function

    function getOrderStatus() external view returns(ORDER_STATUS){
        return orderStatus;
    }

    function getShippingStatus() external view returns(SHIPPING_STATUS){
        return shippingStatus;
    }

    function setOrderCompleted() external {
        require(shippingStatus == SHIPPING_STATUS.Shipped , "Shipping Status should be Shipped");

        orderStatus = ORDER_STATUS.Completed;
    }

    // Pasar como parámetro un Enum

    function setShippingStatus(SHIPPING_STATUS _shipping_status) external {
        shippingStatus = _shipping_status;
    }


}
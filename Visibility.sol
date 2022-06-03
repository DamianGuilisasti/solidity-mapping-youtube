// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.7;

contract MyContract {
    // Visibility:
    // private - La variable o función puede ser accedida desde dentro del SC.
    // internal - Desde dentro y desde contratos que heredan del SC padre.
    // public - Desde dentro y fuera del SC.
    // external - Solo desde fuera del SC. (Solo para funciones)
    /*

    _________________________

     A                    
                          
    private privada()     
    internal interna()   
    public publica()       
    external externa()    


    _________________________

     B is A                           
                                         
    interna()                       
    publica()                      

    _________________________

    C:

    publica()
    externa()

    */
}

// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.7;

contract A {
    uint256 private x = 0;
    uint256 internal y = 1;
    uint256 public z = 2;

    function privada() private pure returns (uint256) {
        return 0;
    }

    function interna() internal pure returns (uint256) {
        return 0;
    }

    function publica() public pure returns (uint256) {
        return 0;
    }

    function externa() external pure returns (uint256) {
        return 0;
    }

    function example() private view returns (uint256) {
        return x + y + z;

        /*

        privada();
        interna();
        publica();

        */
    }
}

contract B is A {
    function example2() external view returns (uint256) {
        return y + z;

        /*

            interna()
            publica()

            */
    }
}

pragma solidity ^0.4.15;

contract Counter {
    /* Constructor */
    uint count = 0;
    address owner;

    function Counter() {
        owner = msg.sender;
    }

    function increment() public {
        if (owner == msg.sender) {
            count = count + 1;
        }
    }

    function getCount() constant returns (uint) {
       return count;
    }

    function kill() {
       if (owner == msg.sender) { // We check who is calling
          selfdestruct(owner); //Destruct the contract
       }
    }
}

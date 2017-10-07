pragma solidity ^0.4.11;

contract Counter {

    address owner;
    address factory;
    uint count = 0;

    function Counter(address _owner) {
        owner = _owner;
        factory = msg.sender;
    }

    modifier isOwner(address _caller) {
        require(msg.sender == factory);
        require(_caller == owner);
        _;
    }

    function increment(address caller) public isOwner(caller) {
       count = count + 1;
    }

    function getCount() public constant returns (uint) {
       return count;
    }

}

contract CounterFactory {

  mapping(address => address) counters;

  function createCounter() public {
    if (counters[msg.sender] == 0) {
      counters[msg.sender] = new Counter(msg.sender);
    }
  }

  function getCount(address account) public constant returns (uint) {
    if (counters[account] != 0) {
      return (Counter(counters[account]).getCount());
    }
  }


}

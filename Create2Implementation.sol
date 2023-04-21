pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-sdk/blob/v2.7.1/packages/lib/contracts/Initializable.sol";

contract test is Initializable {
    address payable public owner;

    function initialize(address payable _owner) initializer public {
        owner = _owner;
    }

    function withdraw() public {
        require(owner == msg.sender);
        owner.transfer(address(this).balance);
    }
}

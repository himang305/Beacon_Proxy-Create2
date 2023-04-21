pragma solidity ^0.5.0;

import "./test.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.5.0/contracts/utils/Create2.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.5.0/contracts/utils/Address.sol";

contract VaultFactory {
    event VaultCreated(address test);
    
    function deployVault(uint salt, address payable owner) public {
        address vaultAddress;

        vaultAddress = Create2.deploy(bytes32(salt), type(test).creationCode);
        test(vaultAddress).initialize(owner);
        
        emit VaultCreated(vaultAddress);
    }

    function computeAddress(uint salt) public view returns (address) {
        return Create2.computeAddress(bytes32(salt), type(test).creationCode);
    }
    
    function sendValue(uint salt) external payable {
        address vaultAddress;
        
        vaultAddress = Create2.computeAddress(bytes32(salt), type(test).creationCode);
        Address.sendValue(Address.toPayable(vaultAddress), msg.value); 
    }
}

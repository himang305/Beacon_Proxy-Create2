// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract Vaultv1 is Initializable {

    string public name;
    uint256 public vaLue;

    error Down(string reason);

    function initialize(string memory _name, uint256 _vaLue) public initializer {
        name = _name;
        vaLue = _vaLue;
    }

    function down() public {
        if (vaLue == 0) revert Down("!vaLue");
        vaLue--;
    }

}

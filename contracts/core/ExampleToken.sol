// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ExampleToken {
    string public constant name = "Fisch Test Token";
    string public constant symbol = "FISCH";
    uint8 public constant decimals = 18;

    mapping(address => uint256) public balanceOf;

    constructor() {
        balanceOf[msg.sender] = 1_000_000 ether;
    }
}

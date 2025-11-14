// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "./core/ExampleToken.sol";

contract ExampleTokenTest is Test {
    ExampleToken token;

    function setUp() public {
        token = new ExampleToken();
    }

    function testInitialBalance() public {
        assertEq(token.balanceOf(address(this)), 1_000_000 ether);
    }
}

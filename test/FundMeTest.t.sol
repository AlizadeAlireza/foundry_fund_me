// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";

contract FundMeTest is Test {
    uint24 x = 1;

    function setUp() external returns (uint24) {
        x = 22;
        return x;
    }

    function testDemo() public {
        assertEq(x, 22);
    }
}

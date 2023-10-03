// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundMeTest is Test {
    FundMe fundMe;

    function setUp() external {
        fundMe = new FundMe();
    }

    function testMinimumDollarIsFive() public {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
        console.log("alireza");
    }

    function testOwnerIsMsgSender() public {
        console.log(msg.sender);
        console.log(fundMe.i_owner());
        console.log(address(this));
        assertEq(fundMe.i_owner(), address(this));
    }

    function testPriceFeedVersionIsAccurate() public {
        uint version = fundMe.getVersion();
        assertEq(version, 4);
    }

    function testGettingTheOwner() public {
        assertEq(fundMe.getOwner(), address(this));
    }
}

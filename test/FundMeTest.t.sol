// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";

contract FundMeTest is Test {
    FundMe fundMe;
    address sepolia_priceFeed = 0x694AA1769357215DE4FAC081bf1f309aDC325306;

    function setUp() external {
        // fundMe = new FundMe(sepolia_priceFeed);
        // new deploy contract
        DeployFundMe deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
    }

    function testMinimumDollarIsFive() public {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
        console.log("alireza");
    }

    function testOwnerIsMsgSender() public {
        console.log(msg.sender);
        console.log(fundMe.i_owner());
        console.log(address(this));
        assertEq(fundMe.i_owner(), msg.sender);
    }

    function testPriceFeedVersionIsAccurate() public {
        uint version = fundMe.getVersion();
        assertEq(version, 4);
    }

    function testGettingTheOwner() public {
        assertEq(fundMe.getOwner(), msg.sender);
    }
}

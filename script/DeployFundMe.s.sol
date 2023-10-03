// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "../script/HelperConfig.s.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        // before broadcast  is not a real tx
        HelperConfig helperConfig = new HelperConfig();
        address ethUsdPriceFeed = helperConfig.activeNetworkConfig();

        // after broadcast is a real tx
        vm.startBroadcast();
        FundMe fundMe = new FundMe(ethUsdPriceFeed);
        vm.stopBroadcast();
        return (fundMe);
    }
}

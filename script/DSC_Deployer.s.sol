// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {DSCEngine} from "../src/DSCEngine.sol";
import {Real} from "../src/RealToken.sol";
import {Script} from "forge-std/Script.sol";

contract DSC_Deployer is Script {
    string priceFeedAddress = address(0);

    function run() external {
        vm.startBroadcast();
        Real real = new Real("Decentralized Real", "BRLC");
        DSCEngine dscEngine = new DSCEngine(payable(real), priceFeedAddress);
        real.transferOwnership(address(dscEngine));
        vm.stopBroadcast();
    }
}

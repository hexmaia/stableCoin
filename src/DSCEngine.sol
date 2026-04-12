// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

// Designed to be as minimal as possible, and have the tokens maintain a 1 token = R$1 peg

import {Real} from "./RealToken.sol";
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract DSCEngine {
    error DSCEngine__CouldntCallRealContract();

    address payable private sRealContractAddress;
    Real private sRealContract;
    AggregatorV3Interface sPriceFeed;

    function depositCollateralAndMintDsc() external payable {
        /*(bool success, ) = payable(sRealContractAddress).call{value: msg.value}(
            ""
        );
        if (!success) {
            revert DSCEngine__CouldntCallRealContract();
        } else {
            sRealContract.mint(msg.sender, msg.value);
        }*/
    }

    function redeemCollateralForDsc() external {}

    function mintDsc() external {}

    function burnDsc() external {}

    function liquidate() external {}

    function getHealthFactor() external {}

    constructor(
        address payable _realContractAddress,
        address _priceFeedAddress
    ) {
        sRealContractAddress = _realContractAddress;
        sRealContract = Real(sRealContractAddress);
    }
}

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

// Layout of Contract:
// version
// imports
// interfaces, libraries, contracts
// errors
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions

/* This contract is only the implementation of ERC20, to be governed by its engine RealTokenEngine*/
/* It doesn't contain any of the logic */

import {ERC20Burnable, ERC20} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract Real is ERC20Burnable, Ownable {
    error Real_MustBeMoreThanZero();
    error Real_BurnAmountExceedsBalance();
    error Real_NotZeroAddress();

    address private sOwner;

    constructor() ERC20("Decentralized Real", "BRLC") {
        sOwner = msg.sender;
    }

    function burn(uint256 _amount) public override onlyOwner {
        uint256 balance = balanceOf(msg.sender);

        if (_amount <= 0) {
            revert Real_MustBeMoreThanZero();
        }
        if (balance < _amount) {
            revert Real_BurnAmountExceedsBalance();
        }
        super.burn(_amount);
    }

    function mint(
        address _to,
        uint256 _amount
    ) external onlyOwner returns (bool) {
        if (_to == address(0)) {
            revert Real_NotZeroAddress();
        }
        if (_amount <= 0) {
            revert Real_MustBeMoreThanZero();
        }

        _mint(_to, _amount);
        return true;
    }
}

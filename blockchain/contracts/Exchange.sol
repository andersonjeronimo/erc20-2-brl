// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import "./IRealStableCoin.sol";

contract Exchange is Ownable {
    IRealStableCoin private immutable stableCoin;

    constructor(address _stableCoin) Ownable(msg.sender) {
        stableCoin = IRealStableCoin(_stableCoin);
    }

    function deposit(address customer, uint amount) external onlyOwner {
        stableCoin.mint(customer, amount);
    }

    function withdraw(address customer, uint amount) external onlyOwner {
        stableCoin.burn(customer, amount);
    }
}

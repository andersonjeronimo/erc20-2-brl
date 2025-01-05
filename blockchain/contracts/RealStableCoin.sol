// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import "./IRealStableCoin.sol";

contract RealStableCoin is ERC20, Ownable {
    address public exchange;

    constructor() ERC20("RealStableCoin", "BRLT") Ownable(msg.sender) {}

    function setExchange(address _exchange) external onlyOwner {
        exchange = _exchange;
    }

    function mint(address to, uint256 amount) external onlyExchange {
        _mint(to, amount);
    }

    function burn(address to, uint256 amount) external onlyExchange {
        _burn(to, amount);
    }

    modifier onlyExchange() {        
        require(
            msg.sender == exchange,
            "Only the exchange can make this call."
        );
        _;
    }
}

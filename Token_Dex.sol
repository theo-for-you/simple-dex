// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/math/Math.sol";



contract Token_DEX  {
    mapping(address => uint256) balances;
    uint256 eth_balance;
    IERC20 Token;
    uint fee = 1000;

    constructor(address token_address) payable {
        Token = IERC20(token_address);

        eth_balance = msg.value;
    }

    function buy_token() public payable {
        eth_balance += msg.value;

        uint real_value = msg.value - Math.mulDiv(msg.value, 1, fee);

        uint256 token_amount = Math.mulDiv(real_value, Token.balanceOf(address(this)), eth_balance);

        Token.transfer(msg.sender, token_amount);
    }

    function sell_token(uint256 amount) public {
        bool res = Token.transferFrom(msg.sender, address(this), amount);
        require(res);

        amount -= Math.mulDiv(amount, 1, fee);

        uint256 eth_amount = Math.mulDiv(amount, eth_balance, Token.balanceOf(address(this)));

        (res, ) = msg.sender.call{value: eth_amount}("");
        eth_balance -= eth_amount;
    }
}   
# Simple DEX
Allows to exchange a token to the native coin. 

> **NOTE:** needs both token and coin deposits after creation

## How to buy / sell
 - Call **buy_token**() with wei value to buy tokens on your sender's account
 - Call **sell_token**(uint256) after approving an amount tokens to get wei on your address 

## How it works
 - Easy interaction 
 - Regulates price on large buys/sells
 - Adds liquidity using fee to stay in the pool

## Todo
 - Add a graphical interface
 - Add price preview


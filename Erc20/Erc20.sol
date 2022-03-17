// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Kokotoken is ERC20, Ownable {
    uint rate;
    uint FixedSupply;
    //address owner;
    constructor() ERC20 ("Kokotoken", "kok") {
        rate = 1000;
        FixedSupply = 1000000 * 10 ** 18;
        // owner = msg.sender;
        _mint(msg.sender, 5000 *10 ** 18);
    }
function buyToken(address receiver) public payable {
        require (msg.value > 0, "I will be rich , very soon");
        uint amountToBuy = msg.value * rate;
        require (FixedSupply >= (totalSupply() + amountToBuy), "Cannot Exceed Fixed Supply" );
        _mint(receiver, amountToBuy);
    }
}

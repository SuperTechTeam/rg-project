// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
/**
   ____    _    __  ____   __
  / ___|  / \   \ \/ /\ \ / /
 | |  _  / _ \   \  /  \ V / 
 | |_| |/ ___ \  /  \   | |  
  \____/_/   \_\/_/\_\  |_|  
 */
contract GaxyToken is ERC20BurnableUpgradeable, OwnableUpgradeable {
    using SafeMath for uint;
     uint256 private totalTokens;
    function initialize() initializer public {
        totalTokens = 1 * 10 ** 9 * 10 ** uint256(decimals()); 
        __ERC20_init("Radiant Galaxy", "GAXY");
        __Ownable_init();
        _mint(msg.sender, totalTokens);
    }
    
    function getBurnedAmountTotal() external view returns (uint256 _amount) {
        return totalTokens.sub(totalSupply());
    }
}
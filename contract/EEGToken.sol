// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/presets/ERC20PresetMinterPauserUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

/**
  _____ _____ ____ 
 | ____| ____/ ___|
 |  _| |  _|| |  _ 
 | |___| |__| |_| |
 |_____|_____\____|
                   
 */
contract EEGToken is ERC20PresetMinterPauserUpgradeable, OwnableUpgradeable {
    using SafeMath for uint256;
    uint256 private totalTokens;

    function initialize(string memory name, string memory symbol)
        public
        override
        initializer
    {
        totalTokens = 1 * 10**9 * 10**uint256(decimals());
        __ERC20PresetMinterPauser_init(name, symbol);
        __Ownable_init_unchained();
        _mint(msg.sender, totalTokens);
    }

    function getBurnedAmountTotal() external view returns (uint256 _amount) {
        return totalTokens.sub(totalSupply());
    }
}

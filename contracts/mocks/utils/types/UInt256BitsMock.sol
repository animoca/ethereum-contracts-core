// SPDX-License-Identifier: MIT

pragma solidity >=0.7.6 <0.8.0;

import {UInt256Extract} from "../../../utils/types/UInt256Extract.sol";
import {UInt256Inject} from "../../../utils/types/UInt256Inject.sol";

contract UInt256BitsMock {
    using UInt256Extract for uint256;
    using UInt256Inject for uint256;

    function requireInjectExtractValueUnchanged(
        uint256 integer,
        uint256 value,
        uint8 length,
        uint8 index
    ) external pure {
        require(value == (integer.inject(value, length, index).extract(length, index)), "UInt256Bits: mismatch");
    }

    function extract(
        uint256 integer,
        uint8 length,
        uint8 index
    ) external pure returns (uint256) {
        return integer.extract(length, index);
    }

    function inject(
        uint256 integer,
        uint256 value,
        uint8 length,
        uint8 index
    ) external pure returns (uint256) {
        return integer.inject(value, length, index);
    }
}

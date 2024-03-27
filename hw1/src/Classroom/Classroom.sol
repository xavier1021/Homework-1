// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentV1 {
    bool private called;

    constructor() {
        called = false; // 明确地设置初始状态
    }

    function register() external returns (uint256) {
        if (!called) {
            called = true;
            return 1000;
        }
        return 123;
    }
}

interface IClassroomV2 {
    function isEnrolled() external view returns (bool);
}

contract StudentV2 {
    function register() external view returns (uint256) {
        if (!IClassroomV2(msg.sender).isEnrolled()) {
            return 1000;
        } else {
            return 123;
        }
    }
}

interface IClassroomV3 {
    function isEnrolled() external view returns (bool);
    function code() external view returns (uint256);
}

contract StudentV3 {
    function register() external view returns (uint256) {
        return gasleft() == 7194 ? 1000 : 123;
    }
}

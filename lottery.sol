// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

contract Lottery {
    // Defining magager, players and winner
    address public manager;
    address payable[] public players;
    address payable public winner;

    // Setting up manager address
    constructor() {
        manager = msg.sender;
    }

    // Function to participate
    function participate() public payable {
        require(msg.value == 1 ether, "Please pay ony 1 Ether only");
        players.push(payable(msg.sender));
    }

    // To get the balance of the contract
    function getBalance() public view returns (uint) {
        require(manager == msg.sender, "You are not the manager");
        return address(this).balance;
    }

    // To pick a random winner
    function random() public view returns (uint) {
        return
            uint(
                keccak256(
                    abi.encodePacked(
                        block.prevrandao,
                        block.timestamp,
                        players.length
                    )
                )
            );
    }
}

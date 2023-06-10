// SPDX-License-Identifier: MIT

pragma solidity 0.9;

contract Lottery {
    // Defining magager, players and winner
    address public manager;
    address payable[] public players;
    address payable public winner;

    // Setting up manager address
    Constructor () {
        manager = msg.sender;
    }

    // Function to participate
    function participate() public payable () {
        require (msg.value == 1 ether, "Please pay ony 1 Ether only");
        players.push(payable(msg.sender));
    }
}

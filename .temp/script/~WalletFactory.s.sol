
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.12;

import "forge-std/~Script.sol";
import "../src/~WalletFactory.sol";
import {IEntryPoint} from "account-abstraction/interfaces/IEntryPoint.sol";

contract WalletFactoryScript is Script {
    // Address of the EntryPoint contract on Goerli
    IEntryPoint constant ENTRYPOINT =
        IEntryPoint(0x5FF137D4b0FDCD49DcA30c7CF57E578a026d2789);

    function run() external {
        // Remove the line that tries to parse the private key as a uint256
        // uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(); // Start broadcasting transactions without the private key

        WalletFactory walletFactory = new WalletFactory(ENTRYPOINT); // Initialize the WalletFactory contract

        vm.stopBroadcast(); // Stop broadcasting transactions
    }
}

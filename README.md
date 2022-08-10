# Force Send Ether Sample Project

- With help of selfdestruct(address) functionality of Solidity, we can destruct self contract and send all ethers in existing contract to the address passed as an argument in function call.

- This ignores all the condition checks in the called contract and force sends Ether to that contract.

- To prevent any miss functionality in called contract due to this behaviour, we should store contract ether balance in `state variable` and use them in condition checks rather than directly putting `address(this).balance` expression.

To demonstrate the fix, refer to EthStoreV2. 
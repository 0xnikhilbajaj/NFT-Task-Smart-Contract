# ERC-721 Non-Fungible Token (NFT) Contract Documentation

**Contract Deployed:** [0x41ee7169D027bAf4D9c5E1f8a2FF46EF9e29eFd9](https://sepolia.etherscan.io/address/0x41ee7169D027bAf4D9c5E1f8a2FF46EF9e29eFd9#code)  
**UI Deployed:** [https://nft-zig-iota.vercel.app/](https://nft-zig-iota.vercel.app/)

The ERC-721 Non-Fungible Token (NFT) contract, named MyNFT, is a Solidity smart contract that adheres to the ERC-721 standard. This contract facilitates the creation and management of unique tokens(ERC721).

## Key Features:

- **Minting Functionality:** The contract allows for the minting of new NFTs. Users can mint NFTs to a maximum limit defined by the constant `MAX_TOKENS_PER_ADDRESS`. Each address can mint up to 5 NFTs.
  
- **Flexible Minting Options:** There are multiple minting functions provided to accommodate different scenarios:
  - *Single Mint:* Allows a user to mint an NFT for themselves or any other specified recipient address.
  - *Batch Mint:* Enables the owner to mint multiple NFTs for a specific user address.
  
- **Ownership and Permission Control:** The contract utilizes the OpenZeppelin Ownable contract, ensuring that only the owner has the authority to perform certain actions such as minting to a specified recipient or batch.

## Contract Deployment:

The contract is deployed on the Sepolia testnet, the source code is verified on Etherscan, ensuring its transparency and accessibility to the public.

## Contract Specifications:

- **Name and Symbol:** The NFT collection is named and symbolized accordingly, allowing for easy identification and recognition within the Ethereum ecosystem.
  
- **Constructor:** The contract constructor initializes the contract owner and sets the name and symbol of the NFT collection.

## Minting Functions:

- `mint()`: Allows for the minting of a single NFT to function caller.
- `mint(address to)`: Enables the owner to mint a single NFT and assign it to a specified recipient.
- `batchMint(address to, uint256 numberOfTokens)`: Permits the owner to mint multiple NFTs and assign them to the same recipient in a batch process.

## Internal Minting Function:

The `_mint` function is an internal function responsible for minting NFTs. It increments the token ID counter, mints the NFT to the specified recipient, updates the token ownership mapping, and emits an event indicating the successful minting of the NFT.

## Deployment Process:

The deployment process followed for developing and deploying the ERC-721 contract using Hardhat

### Steps:

1. **Set up a Hardhat environment** using [Setting up project](https://hardhat.org/hardhat-runner/docs/guides/project-setup).
  
2. **Create the Smart Contract:** Create a new Solidity smart contract with Solidity version 0.8.23 named `MyNFT.sol` in the contracts directory.
  
3. **Write Deployment Script:** Create a new deployment script file named `deploy.js` in the scripts directory to deploy the created smart contract.
  
4. **Configure Environment Variables:** Create a `.env` file in the root of your project and set the following environment variables:
```
SEPOLIA_URL=<Your Ethereum RPC URL>
PRIVATE_KEY=<Your Ethereum private key>
ETHERSCAN_API_KEY=<Your Etherscan API Key>
```
5. **Deploy Contract:** Run the deployment script with Hardhat, specifying the network you want to deploy to:
```npx hardhat run scripts/deploy.ts --network sepolia```

6. **Verify Contract:** After successful deployment, verify the contract on Etherscan using Hardhat's verification plugin:
```npx hardhat verify --network sepolia DEPLOYED_CONTRACT_ADDRESS CONSTRUCTOR_ARGUMENTS```

7. **Interact with the Contract:** Once deployed and verified, you can interact with the contract on [Etherscan](https://sepolia.etherscan.io/).

## Steps to Set up the Repository:

1. Run the command `yarn install`.

2. Make a copy of `.env.example` and rename it to `.env`.

3. Add Private key, RPC URL, and Etherscan API key to `.env`.

4. Run `yarn compile`.

5. Deploy using `NETWORK=<your network> yarn deploy`.

### Find the solution here:

- **Github URL:** [https://github.com/NikhilBajaj3196/NFT-Task-Smart-Contract](https://github.com/NikhilBajaj3196/NFT-Task-Smart-Contract)

- **Deployed Contract:** [0x41ee7169D027bAf4D9c5E1f8a2FF46EF9e29eFd9](https://sepolia.etherscan.io/address/0x41ee7169D027bAf4D9c5E1f8a2FF46EF9e29eFd9#code)

- **Vercel UI:** [https://nft-zig-iota.vercel.app/](https://nft-zig-iota.vercel.app/)

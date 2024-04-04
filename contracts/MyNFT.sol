// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.23;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {Context} from "@openzeppelin/contracts/utils/Context.sol";

/**
 * @title MyNFT
 * @notice A contract for managing non-fungible tokens (NFTs).
 * Users can mint NFTs up to a maximum limit defined by MAX_TOKENS_PER_ADDRESS.
 */
contract MyNFT is Context, ERC721, Ownable {
    // Maximum number of NFTs that can be owned by a single address.
    uint256 public constant MAX_TOKENS_PER_ADDRESS = 5;

    // Counter for generating token IDs.
    uint256 private tokenIdCounter;

    // Mapping to track the number of NFTs owned by each address.
    mapping(address => uint256) internal nftPerRecipient;

    event Mint(address indexed recipient, uint256 tokenId);

    // Error thrown when the mint limit per address is exceeded.
    error MintLimitExceed();

    /**
     * @notice Constructor to initialize the MyNFT contract.
     * @param owner initial owner of the contract.
     * @param name name of the NFT collection.
     * @param symbol symbol of the NFT collection.
     */
    constructor(address owner, string memory name, string memory symbol) Ownable(owner) ERC721(name, symbol) {}

    /**
     * @notice Allows the owner to mint a NFT and assign it to themselves.
     * @dev This function does not accept any arguments.
     */
    function mint() external {
        // Assuming each recipient can be minted NFT up to MAX_TOKENS_PER_ADDRESS
        if (nftPerRecipient[_msgSender()] == MAX_TOKENS_PER_ADDRESS) revert MintLimitExceed();
        _mint(_msgSender());
    }

    /**
     * @notice Allows user to mint a NFT and assign it to a recipient.
     * Ideally this should be only allowed for Owner.
     * @dev This function accepts one argument
     * @param to The address of the recipient for the minted NFT.
     */
    function mint(address to) external {
        // Assuming each recipient can be minted NFT up to MAX_TOKENS_PER_ADDRESS
        if (nftPerRecipient[to] == MAX_TOKENS_PER_ADDRESS) revert MintLimitExceed();

        _mint(to);
    }

    /**
     * @notice Allows the owner to mint multiple NFTs and assign them to the same recipient.
     * @param to address of the recipient for the minted NFTs.
     * @param numberOfTokens number of NFTs to mint.
     * @return tokenIds array containing the IDs of the minted NFTs.
     */
    function batchMint(address to, uint256 numberOfTokens) external onlyOwner returns (uint256[] memory tokenIds) {
        // Assuming each recipient can be minted NFT up to MAX_TOKENS_PER_ADDRESS
        uint256 tokensToMint = MAX_TOKENS_PER_ADDRESS - nftPerRecipient[to];
        tokensToMint = (tokensToMint > numberOfTokens) ? numberOfTokens : tokensToMint;
        if (tokensToMint <= 0) revert MintLimitExceed();
        tokenIds = new uint256[](tokensToMint);

        for (uint256 i = 0; i < tokensToMint; i++) {
            tokenIds[i] = _mint(to);
        }
        return tokenIds;
    }

    /**
     * @notice Internal function to mint NFT and emit event.
     * @param to address of the recipient for the minted NFT.
     * @return tokenId id of the minted NFT.
     */
    function _mint(address to) internal returns (uint256 tokenId) {
        tokenId = tokenIdCounter++;
        ERC721._safeMint(to, tokenId);
        nftPerRecipient[to]++;
        emit Mint(to, tokenId);
    }
}

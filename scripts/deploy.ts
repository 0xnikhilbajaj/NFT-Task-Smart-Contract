import { ethers } from "hardhat";

async function main() {
  const MyNFTContractFactory = await ethers.getContractFactory("MyNFT");
  console.log("Deploying MyNFT contract...");

  const MyNFTContract = await MyNFTContractFactory.deploy('0xbc741Cc2bD5a40B93f3EDdb60805D811c310398B',"MyNFTCollection","MyNFT") // [owner,NFT_name,NFT_symbol)]
  await MyNFTContract.waitForDeployment();
  console.log(
    "MyNFT Contract Contract deployed to:",
    await MyNFTContract.getAddress(),
  );
}
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

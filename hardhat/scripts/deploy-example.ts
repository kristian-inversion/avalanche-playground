import { ethers } from "hardhat";

async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying with:", deployer.address);

  const ExampleToken = await ethers.getContractFactory("ExampleToken");
  const token = await ExampleToken.deploy();
  await token.deployed();

  console.log("ExampleToken deployed to:", token.address);
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});

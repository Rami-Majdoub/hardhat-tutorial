async function deployContract(contractName) {
  const ContractFactory = await ethers.getContractFactory(contractName);
  const deployedContract = await ContractFactory.deploy();

  console.log(`${contractName} address : `, deployedContract.address);

  return deployedContract;
}

async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying contracts with the account:", deployer.address);

  const { readdirSync } = require('fs');
  const files = await readdirSync("contracts");
  contracts = files
    .filter(f => f.substring(f.length-4) == ".sol")
    .map(f => f.substring(0, f.length-4));

  // await Promise.all(contracts.map(deployContract));

  for (var i = 0; i < contracts.length; i++) {
    const c = await deployContract(contracts[i]);
    // c.interface.fragments.forEach(fn => console.log(fn.type + " " + fn.name));
  }

  // const artifacts = require('./../artifacts/contracts/Bank.sol/Bank.json');
  // const contract = new ethers.Contract("0x06b77ee016f8f2f6ff7e361f5b7165ba16797cce",
  //   artifacts.abi,
  //   deployer);
  // console.log(await contract.getBalanceOfContract());
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

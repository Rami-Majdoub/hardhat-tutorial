npm init -y
npm install --save-dev hardhat
npx hardhat
npx hardhat compile

npm install --save-dev chai
npm install --save-dev ethereum-waffle #
npm install --save-dev @nomiclabs/hardhat-ethers ethers @nomiclabs/hardhat-waffle
npx hardhat test

npx hardhat run scripts/deploy.js --network rinkeby

npm install --save-dev @nomiclabs/hardhat-etherscan
npx hardhat verify --network rinkeby "0xB41C7d4a75D58a5Ae88533D76999a106916D20eb"
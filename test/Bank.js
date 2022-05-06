const { expect } = require("chai");

describe("Bank", function () {

  let ContractBank;
  let bank;
  let accountOfdeployer, account1, account2;
  let addressOfDeployer, address1, address2;
  // deploy contract
  beforeEach(async function(){
    ContractBank = await ethers.getContractFactory("Bank");
    bank = await ContractBank.deploy();

    [accountOfdeployer, account1, account2] = await ethers.getSigners();

    addressOfDeployer = accountOfdeployer.address;
    address1 = account1.address;
    address2 = account2.address;
  });

  describe("initial values", function () {
    it("Should store deployer address", async function () {
      expect(await bank.owner()).to.equal(addressOfDeployer);
    });

    it("Should have initial 0 balance", async function () {
      expect(await bank.getBalance()).to.equal(0);
      expect(await bank.getBalanceOf(address1)).to.equal(0);
      expect(await bank.getBalanceOfContract()).to.equal(0);
    });

  });

  describe("Transactions", function () {
    describe("deposit", function () {
      it("Deposit Should receive ETH", async function () {
        await expect(bank.deposit()).to.be.reverted;
      });

      it("should save the value deposited", async function () {
        await bank.deposit({value: 1});
        await expect(await bank.getBalance()).to.equal(1);
      });
    });

    describe("withdraw", function () {
      it("Should not withdraw 0 ETH", async function () {
        await expect(bank.withdraw(0)).to.be.revertedWith("withdraw 0 eth");
      });
      it("should not withdraw more than what deposed", async function () {
        await expect(bank.withdraw(1)).to.be.revertedWith("not enough eth");
      });
    });

  });
});

const HDWalletProvider = require('@truffle/hdwallet-provider');
const mnemonic = 'initial jelly survey reduce clinic laugh twelve sad final puzzle used dumb'; // Replace with your actual mnemonic or private key.

module.exports = {
  compilers: {
    solc: {
      version: "0.8.9", // Specify the Solidity compiler version here
    },
  },
  networks: {
    fuji: {
      provider: () => new HDWalletProvider(mnemonic, 'https://api.avax-test.network/ext/bc/C/rpc'),
      network_id: 43113,
      gas: 3000000,
      gasPrice: 470000000000,
    },
    // Add other configurations as needed.
  },
};

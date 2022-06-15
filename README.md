# ZAR Stablecoin Experimental System

## Resources

Price Feed for ZAR stablecoin value

- [ZAR / USD Chainlink Price Feed](https://data.chain.link/ethereum/mainnet/fiat/zar-usd)

Price Feeds for Collateral types

- [ETH / USD Chainlink Price Feed](https://data.chain.link/ethereum/mainnet/crypto-usd/eth-usd)

- [USDC / USD Chainlink Price Feed](https://data.chain.link/ethereum/mainnet/stablecoins/usdc-usd)

## Architecture

If Diamond:
```
- Diamond
    - AppStorage
    - Facets
        - Collateral Market Facet
        - Collateral Market Factory Facet
        - Liquidation Facet
        - Oracle Facet
        - Treasury Facet
        - Staking Facet
```

## Mechanisms

### Minting ZARX

ZARX is the stablecoin in this protocol which aims to be pegged to the value of ZAR, in a 1:1 ratio.

ZARX can only be minted by users who have deposited collateral into the system, up to a specific collateral ratio which is dependent on the type of collateral used.

The protocol takes a once-off fee (which varies depending on the collateral type) when ZARX is minted.

### Collateral Types

New collateral types can be added to the protocol. At the start we aim to only support WETH and USDC.

Each collateral type has it's own
 - minting fee
 - collateralization ratio limit
 - liquidation ratio
 - liquidation reward

### Collateralized Debt Positions (CDPs)

A user (address) can have one CDP per collateral market.

CDPs should be easily discoverable via generous event data and versatile view functions. This is to decrease the insolvancy risk of the protocol, but surfacing profitable liquidations for liquidation bots.



### Liquidations

Liquidiations happen smoothly (inspired by Aave) and don't liquidate all capital at once.

<!-- TODO smooth liquidation research needed -->

When a liquidation is available, a user must supply the required amount of ZARX back to the protocol (to be burnt)




## Installation

To install with [Foundry](https://github.com/gakonst/foundry):

```
forge install [user]/[repo]
```

## Local development

This project uses [Foundry](https://github.com/gakonst/foundry) as the development framework.

### Dependencies

```
make update
```

### Compilation

```
make build
```

### Testing

```
make test
```

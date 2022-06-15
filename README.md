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

### Liquidity Mining

A portion of vesting TZAR tokens will be emitted over the first 2 years of the protocol's existance. Emissions will linearly decline over this period.

These rewards will flow to ZARX CDP holders (in proportion to time holding the CDP) and liquidators.

### Liquidations

Liquidiations happen smoothly (inspired by Aave) and don't liquidate all capital at once.

<!-- TODO smooth liquidation research needed -->

When a liquidation is available, a user must supply the required amount of ZARX back to the protocol (to be burnt)


### Protocol Fees and Revenue

The protocol earns revenue in a few different ways:

- Minting fees
- Liquidation fees
- Low-risk yield generated on underlying collateral (supplied to Aave)

All protocol revenue flows into a protocol treasury, which is directly managed by the protocol multi-sig, but ultimately governed through proposals by stTZAR holders.

A fee switch exists which can direct a portion of protocol revenue directly to the stTZAR stakers, but will be set to 0% at launch.

### Staking

The native token of the protocol, TZAR, can be staked for stTZAR.

For the first 60 days after staking, stTZAR is non-transferrable and non-withdrawable for TZAR. After 60 days, stTZAR can be transferred or burnt to withdraw the underlying TZAR and any rewards earned over the staking period.

Only stTZAR holders are eligible for voting in protocol governance, which includes governance of the protocol treasury funds.

stTZAR may receive a direct share of protocol revenue, but the fee switch will be set to 0 at launch. This may be changed later in a governance vote.

### Governance

Snapshot and the stTZAR balances will be used to implement governance voting for the protocol. The voted proposals will then be actioned by the multisig in the short term.

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

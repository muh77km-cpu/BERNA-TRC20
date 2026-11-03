# BERNA-TRC20
Official open-source TRC-20 smart contract for BERNA, a fixed-supply utility token supporting the BERNA.CHAT artificial intelligence platform on the TRON blockchain.
BERNA Smart Contract — TRON Mainnet

Contract Address

TCpXTwEhBuUae5RpVcjPEJnfoEpVZ9LmPe

Website

**https://bernalabs.com
Official source-code repository for the BERNA token supporting the BERNA.CHAT artificial intelligence platform.
Deployment
Property	Value
Network	TRON Mainnet
Standard	TRC-20
Token name	BERNA
Symbol	BERNA
Decimals	6
Initial supply	6,000,000,000 BERNA
Deployment	One-time initial supply to administrator wallet
New minting	Not available
Holder burning	Optional, from caller's own balance only
Owner freezing / forced burning	Not available
On-chain governance	None
Administrator	TBTqM6KJXTvrx7ucmXbMzidwyUNmT5QSV2
Contract	TCpXTwEhBuUae5RpVcjPEJnfoEpVZ9LmPe
Compiler	TRON Solidity 0.8.20, optimization enabled, 200 runs
License	MIT


View verified contract on TRONSCAN
Purpose
BERNA is a fixed-supply utility token intended to support the BERNA.CHAT AI ecosystem, including future payments, subscriptions, and AI-powered digital services. These uses depend on separate product integration and should not be mistaken for features already implemented in the token contract.
Token behavior
- Entire initial supply is created at deployment and assigned to the designated administrator wallet.
- Standard token transfer, approve, transferFrom, balanceOf, allowance and totalSupply functions are supported.
- Holders can permanently destroy their own tokens via burn(amount); burning does not give any USDT back.
- There is no mint function, upgrade function, blacklist, pause, administrative forced burn, or built-in token sale.
- The admin address is immutable informational metadata; the deployed token does not grant that address privileged control over holder balances.
Market and liquidity
BERNA may be paired with USDT in an external liquidity pool. A pool initially funded at a 1 BERNA : 1 USDT ratio sets an opening pool quotation only. It does not make BERNA a stablecoin, guarantee a USD price, create collateral backing, or grant redemption rights. Actual market prices may fluctuate, and shallow pools can experience substantial price impact.
Source and verification
- Primary smart contract: [`BERNA.sol`](BERNA.sol)
- Contract code status: source verified on TRONSCAN according to the issuer-provided explorer result.
- Independent security audit: not completed / none supplied.
- Before use with significant funds, undertake security testing, independent audit, and applicable legal review.
Public resources
- Website: https://berna.chat
- Repository: https://github.com/muh77km-cpu/BERNA-TRC20
- Whitepaper: [`BERNA_Whitepaper_v1.pdf`](BERNA_Whitepaper_v1.pdf)
Risk disclaimer
BERNA is not an asset-backed stablecoin, has no guaranteed value of USD 1, and has no built-in USDT redemption facility. Smart-contract, key custody, liquidity, market, third-party, integration and regulatory risks apply. The initial token supply was assigned to one administrator wallet, which creates concentration risk. This document is technical and informational, not a promise of investment returns.
License
The verified Solidity contract declares SPDX license identifier MIT. See LICENSE if included in this repository.

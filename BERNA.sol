
 // SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title BERNA
 * @notice Fixed-supply TRC-20 utility token for the BERNA.CHAT AI platform.
 * @dev This token is NOT a stablecoin and does NOT promise USD redemption.
 *      Trading prices depend on external markets and liquidity pools.
 *      The admin receives all supply once; the admin has NO special powers
 *      to mint, pause, freeze, or burn tokens held by anyone else.
 *      An external DEX may create a BERNA/USDT pool after deployment.
 */
contract BERNA {
    string public constant name = "BERNA";
    string public constant symbol = "BERNA";
    uint8 public constant decimals = 6;

    uint256 public constant INITIAL_SUPPLY = 6_000_000_000 * 1_000_000;
    uint256 public totalSupply;
    address public immutable admin; // Information only; no admin-only privileges.

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor(address administratorWallet) {
        require(administratorWallet != address(0), "BERNA: zero admin");
        admin = administratorWallet;
        totalSupply = INITIAL_SUPPLY;
        balanceOf[administratorWallet] = INITIAL_SUPPLY;
        emit Transfer(address(0), administratorWallet, INITIAL_SUPPLY);
    }

    function transfer(address to, uint256 amount) external returns (bool) {
        _transfer(msg.sender, to, amount);
        return true;
    }

    function approve(address spender, uint256 amount) external returns (bool) {
        require(spender != address(0), "BERNA: zero spender");
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(address from, address to, uint256 amount)
        external returns (bool)
    {
        uint256 allowed = allowance[from][msg.sender];
        if (allowed != type(uint256).max) {
            require(allowed >= amount, "BERNA: insufficient allowance");
            unchecked {
                allowance[from][msg.sender] = allowed - amount;
            }
            emit Approval(from, msg.sender, allowance[from][msg.sender]);
        }
        _transfer(from, to, amount);
        return true;
    }

    /// @notice Permanently destroys only the caller's own BERNA; no USDT refund.
    function burn(uint256 amount) external {
        require(amount > 0, "BERNA: zero burn");
        uint256 balance = balanceOf[msg.sender];
        require(balance >= amount, "BERNA: insufficient balance");
        unchecked {
            balanceOf[msg.sender] = balance - amount;
        }
        totalSupply -= amount;
        emit Transfer(msg.sender, address(0), amount);
    }

    function _transfer(address from, address to, uint256 amount) internal {
        require(from != address(0), "BERNA: zero sender");
        require(to != address(0), "BERNA: zero recipient");
        uint256 balance = balanceOf[from];
        require(balance >= amount, "BERNA: insufficient balance");
        unchecked {
            balanceOf[from] = balance - amount;
        }
        balanceOf[to] += amount;
        emit Transfer(from, to, amount);
    }
}

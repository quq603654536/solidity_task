// SPDX-License-Identifier: MIT
// 参考 openzeppelin-contracts/contracts/token/ERC20/IERC20.sol实现一个简单的 ERC20 代币合约。要求：
// 合约包含以下标准 ERC20 功能：
// balanceOf：查询账户余额。
// transfer：转账。
// approve 和 transferFrom：授权和代扣转账。
// 使用 event 记录转账和授权操作。
// 提供 mint 函数，允许合约所有者增发代币。
// 提示：
// 使用 mapping 存储账户余额和授权信息。
// 使用 event 定义 Transfer 和 Approval 事件。
// 部署到sepolia 测试网，导入到自己的钱包

pragma solidity ^0.8;

contract MyToken{
    string public name = "MyToken";
    string public symbol = "MTK";
    address public owner;

    mapping (address account => uint256 amount) private _balances;
    mapping (address => mapping (address => uint256)) private _allowances;

    event Transfer(address from, address to, uint256 value);
    event Approve(address owner, address spender, uint256 amount);
    
    constructor() {
        owner = msg.sender;
    }

    // 获取账户余额
    function balanceOf(address account) public view  returns (uint256) {
        return _balances[account];
    }

    // 调用者向所选账户转账
    function transfer(address to, uint256 value) public returns (bool){
       require(_balances[msg.sender] > 0, "balance not enough");

        _balances[msg.sender] -= value;
        _balances[to] += value;

        emit Transfer(msg.sender, to, value);

        return true;
    }

    function transFrom(address from, address to, uint256 amount) public returns (bool){
        //是否有授权操作
        require(_allowances[msg.sender][from] >= amount, "not allow transfer");
        require(from != to, "can not transfes self");
        require(_balances[from] >= amount, "balance not enough");
        
        _balances[from] -= amount;
        _balances[to] += amount;

        emit Transfer(from, to, amount);

        return true;
    }

    //授权
    function approve(address spender, uint256 amount) public returns (bool) {
        require(_allowances[msg.sender][spender] == 0, "approve transfer");  //允许调用者授权
        
        _allowances[msg.sender][spender] = amount;   ///保存授权信息
    
        emit Approve(msg.sender, spender, amount);

        return true;
    }


    //向某个用户增发代币
    function mint(address to, uint256 value) public returns (bool) {
        require(msg.sender == owner, "not the owner");
        require(to != address(0), "Mint to zero address");

        _balances[to] += value;

        emit Transfer(address(0), to, value);

        return true;
    }

    function myAddress() public view returns (address){
        //0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
        //0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
        return msg.sender;
    }
}
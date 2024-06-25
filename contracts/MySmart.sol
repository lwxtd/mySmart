// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract MySmart {

    uint256 number;



    address payable owner;
    struct Memo{
        address payable adress1;
        uint256 ration1;
        address payable adress2;
        uint256 ration2;
        uint256 sendAmount;
    }

Memo[] memos;
constructor(){
owner=payable (msg.sender);
}

function sendMoney (address payable adr1,uint256 rat1,address payable adr2,uint256 rat2) public payable {
    require(msg.value>0,"Please send more than 0 ether");
    adr1.transfer(msg.value*rat1/100);
    adr2.transfer(msg.value*rat2/100);
    memos.push(Memo(adr1,rat1,adr2,rat2,msg.value));
}


function getMemos() public view returns(Memo[] memory){
    return memos;
}


receive() external payable {
  owner.transfer(msg.value);
}

  
}
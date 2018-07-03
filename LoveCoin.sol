pragma solidity ^0.4.19;

contract Owned {
    address public owner;

    function Owned() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        owner = newOwner;
    }

    function getOwner() public constant returns (address) {
        return owner;
    }
}
   
   mapping(string => string[]) private messages;
   mapping(string => string[]) private messageOwners;
   // list for managing message owner list

   string[] public owners;
   string[] loveMessages;
   uint public ownerID = 0;

   event LeaveMessage(string userName, string message);

contract LoveCoin is Owned{
   function leaveMessage(string userName, string message) onlyOwner public {
       ownerID ++;
       owners.push(userName);
       messages[userName] = loveMessages.push(message);
       LeaveMessage(userName, message);
   }

   function getOwnerName(uint id) onlyOwner public view returns (string) {
        return owners[id];
    }

    function getMessage(string userName, uint index) onlyOwner public view returns (string){
        string findUser = messages[userName]
        return findUser[index];
    }
}
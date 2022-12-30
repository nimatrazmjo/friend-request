//SPDX-License-Identifier: Unlicesed

pragma solidity >0.7.0 <0.9.0;

contract Friends {

    struct Person {
        address[] friends;
        address[] requestSent;
        address[] requestReceived;
    }

    mapping(address => Person) people;

    modifier requestExists(address friend) {
        bool exists = false;
        for ( uint256 i = 0; i < people[msg.sender].requestReceived.length; i++) {
            if (people[msg.sender].requestReceived[i] == friend) {
                exists = true;
                break;
            }
        }
        require(exists == true, "Request does not exist");
        _;
    }

    modifier checkAlreadyRequested(address friend) {
        bool exists = false;
        for (uint256 i = 0; i < people[msg.sender].requestSent.length; i++) {
            if (people[msg.sender].requestSent[i] == friend) {
                exists = true;
                break;
            }
        }
        require(exists == false, "Request already sent");
        _;
    }

    modifier shouldRequestoItself(address friend) {
        require(msg.sender != friend, "You cannot send request to yourself");
        _;
    }

    modifier checkAlreadyFriends(address friend) {
        bool exists = false;
        for (uint256 i = 0; i < people[msg.sender].friends.length; i++) {
            if (people[msg.sender].friends[i] == friend) {
                exists = true;
                break;
            }
        }
        require(exists == false, "Already friends");
        _;
    }

    function removeRequest(address friend) private {
        for ( uint256 i = 0; i < people[msg.sender].requestReceived.length; i++ ) {
            if (people[msg.sender].requestReceived[i] == friend) {
                people[msg.sender].requestReceived[i] = people[msg.sender]
                    .requestReceived[
                        people[msg.sender].requestReceived.length - 1
                    ];
                people[msg.sender].requestReceived.pop();
                break;
            }
        }
    }

    function sedFriendsRequest(address friend)
        public
        checkAlreadyRequested(friend)
        checkAlreadyFriends(friend)
        shouldRequestoItself(friend)

    {
        people[msg.sender].requestSent.push(friend);
        people[friend].requestReceived.push(msg.sender);
    }

    function getFriendsRequests() public view returns (address[] memory) {
        return people[msg.sender].requestReceived;
    }

    function getNumberOfRequests() public view returns (int256) {
        return int256(people[msg.sender].requestReceived.length);
    }

    function getFriends() public view returns (address[] memory) {
        return people[msg.sender].friends;
    }

    function acceptFriendRequest(address friend) public requestExists(friend) {
        people[msg.sender].friends.push(friend);
        people[friend].friends.push(msg.sender);
        removeRequest(friend);
    }
}

# friend-request
web 3 smart contract ot send, receive frields request using soliditu #web3, #blockchain


<div class="html">
  <p>
    Write a smart contract named <span>Friends</span> that allows users to send
    and accept friend requests. The following are rules this smart contract
    should adhere to.
  </p>
  <ul>
    <li>
      A user cannot cannot send more than one friend request to the same
      address.
    </li>
    <li>
      A user cannot send a friend request to a user that has sent them a friend
      request.
    </li>
    <li>
      A user cannot send a friend request to a user they are already friends
      with.
    </li>
    <li>
      A user cannot accept a friend request that doesn't exist or that they have
      already accepted.
    </li>
    <li>A user cannot send a friend request to themselves.</li>
  </ul>
  <p>
    Use advanced solidity features like modifiers and structs when implementing
    the functions defined below.
  </p>
  <ul>
    <li>
      <span>getFriendRequests()</span>: returns
      <span>address[]</span> containing the addresses of users that have sent
      this user a request that they have yet to accept (i.e., don't return
      accepted requests).
    </li>
    <li>
      <span>getNumberOfFriends()</span>: returns a <span>uint</span> value
      representing the number of friends the calling user has.
    </li>
    <li>
      <span>getFriends()</span>: returns <span>address[]</span>
      containing the addresses of the calling users friends.
    </li>
    <li>
      <span>sendFriendRequest(address friend)</span>: sends a friend request to
      the provided <span>address</span>.
    </li>
    <li>
      <span>acceptFriendRequest(address friend)</span>: accepts a pending friend
      request.
    </li>
  </ul>
  <p>
    Make sure all of the functions above are <span>public</span> and have the
    correct signature. You may add as many other functions, types, structs,
    enums etc. as you like.
  </p>
</div>

Learned from ***algoexpert*** blockchain course

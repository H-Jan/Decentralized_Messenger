pragma solidity 0.8.7;

import "./BlockChainChat.sol";

contract chatChainTest {
  BlockChainChat chatToTest;

  /// 'beforeAll' runs before all other tests
  function beforeAll () public {
    chatToTest = new chatChain();
  }
function checkSendMessage () public {
    // Send a first message
    chatToTest.sendMessage("Hello World!");

    // Ensure the messages variable contains 1 message
    Assert.equal(chatToTest.getMessages().length, uint(1), "messages state variable should contain 1 message");

    // Ensure that our first message's content is "Hello World!"
    Assert.equal(chatToTest.getMessages()[0].content, string("Hello World!"), "The first Message in message should be \"Hello World!\"");

    // Send a second message
    chatToTest.sendMessage("This chat is super fun.");

    // Ensure the messages variable contains 2messages
    Assert.equal(chatToTest.getMessages().length, uint(2), "messages state variable should contain 2 messages");
  }
}
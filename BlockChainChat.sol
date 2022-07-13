pragma solidity 0.8.7;


contract chatChain {
    event newMessage(address indexed from, uint timestamp, string message);

    struct Message {
        address waver;
        string message;
        uint timestamp;
    }

    Message[] messages;

    function sendMessage(string calldata _content) public {
        uint contentLength = bytes(_content).length;
        require(contentLength > 0, "Don't forget to write a message!");
        messages.push(Message(msg.sender, _content, block.timestamp));
        emit newMessage(msg.sender, block.timestamp, _content)
    }

    function getMessages() view public returns (Message[] memory) {
        return messages;
    }
}
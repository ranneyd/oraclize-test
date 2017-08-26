pragma solidity ^0.4.4;

import "./usingOraclize.sol";

contract Youtube is usingOraclize {

    string public viewsCount;

    event ViewsReceived(string views);

    function Youtube() {
        OAR = OraclizeAddrResolverI(0x6f485C8BF6fc43eA212E93BBF8ce046C7f1cb475);
    }

    function __callback(bytes32 myid, string result) {
        if (msg.sender != oraclize_cbAddress()) throw;
        viewsCount = result;
        ViewsReceived(result);
    }

    function update(uint delay) {
        oraclize_query(delay, 'URL', 'html(https://www.youtube.com/watch?v=9bZkp7q19f0).xpath(//*[contains(@class, "watch-view-count")]/text())');
    }
}

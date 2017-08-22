pragma solidity ^0.4.4;

import "./oraclizeAPI.sol";

contract Youtube is usingOraclize {

    string public viewsCount;

    function Youtube() {
        //OAR = OraclizeAddrResolverI(resolve_addr);  //add this line if you are using Oraclize in private chain environment
        update(0);
    }

    function __callback(bytes32 myid, string result) {
        if (msg.sender != oraclize_cbAddress()) throw;
        viewsCount = result;
    }

    function update(uint delay) {
        oraclize_query(delay, 'URL', 'html(https://www.youtube.com/watch?v=9bZkp7q19f0).xpath(//*[contains(@class, "watch-view-count")]/text())');
    }
    function getViews() returns(string) {
        return viewsCount;
    }
}
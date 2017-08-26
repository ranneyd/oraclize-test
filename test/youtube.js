var Youtube = artifacts.require("./Youtube.sol");

contract('youtube', function(accounts) {

  it('Receive Youtube Views', () => {
    return Youtube.deployed().then((_instance) => {
      var events = _instance.ViewsReceived()

      events.watch((error, result) => {
        if (error == null) {
          console.log("views: ", result.args.views);
          events.stopWatching()
        }
      });

      _instance.update(0, {
        from: accounts[0],
        gas: 2000000
      });
    });
  });
});

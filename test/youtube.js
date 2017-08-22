var Youtube = artifacts.require("./Youtube.sol");

contract('youtube', function(accounts) {
    it("should put 10000 MetaCoin in the first account", function() {
        return Youtube.deployed().then(function(instance) {
            return instance.getViews.call();
        }).then(function(views) {
            assert.equal(views, 20000000, "Views stuff");
        });
    });
});

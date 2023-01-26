const {workspace, services} = require('coc.nvim')

var EXTENSION_NS = "sorbet";

var SorbetContentProvider = (function () {
  function SorbetContentProvider(lspServices) {
    this.lspServices = lspServices;
  }

  SorbetContentProvider.prototype.provideTextDocumentContent = function (uri, token) {
    if (this.lspServices === null) {
      this.lspServices = getLspServices()
    }
    console.log("uri: " + uri + ", token: " + token);
    console.log("client: " + this.lspServices);
    return Promise.resolve(this.lspServices.sendRequest("sorbet", "sorbet/readFile", { uri: uri.toString() }, token));
  };
  return SorbetContentProvider;
}());

async function getLspServices() {
  var sorbetLsp = services.getService("sorbet");
  if (sorbetLsp === null || sorbetLsp.client === null) {
    return null;
  }

  await sorbetLsp.client.onReady();
  console.log("sorbet ready");
  return services;
}

exports.activate = async context => {
  context.subscriptions.push(
    workspace.registerTextDocumentContentProvider(
      EXTENSION_NS,
      new SorbetContentProvider(await(getLspServices()))
    )
  );
}

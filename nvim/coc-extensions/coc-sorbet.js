const {workspace, services} = require('coc.nvim')

var EXTENSION_NS = "sorbet:https";

var SorbetContentProvider = (function () {
  function SorbetContentProvider(lspServices) {
    this.lspServices = lspServices;
  }

  SorbetContentProvider.prototype.provideTextDocumentContent = function (uri, token) {
    if (this.lspServices === null) {
      this.lspServices = getLspServices()
    }
    // console.log("uri: " + uri + ", token: " + token);
    // console.log("client: " + this.lspServices);
    return this.lspServices.sendRequest("sorbet", "sorbet/readFile", { uri: uri.toString() }, token).then(
      (values) => {
        return values.text;
      },
      (error) => {
        console.error("sorbet/readFile error: " + error)
        "";
      }
    );
  };
  return SorbetContentProvider;
}());

async function getLspServices() {
  var sorbetLsp = services.getService("sorbet");

  if (sorbetLsp === null) {
    return null;
  }
  if (sorbetLsp.client === null) {
    await new Promise(r => setTimeout(r, 5000));
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

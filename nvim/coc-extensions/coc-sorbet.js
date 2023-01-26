const {workspace, services} = require('coc.nvim')

var HTTPS_EXTENSION_NS = "sorbet:https";
var BUILD_EXTENSION_NS = "sorbet:build";

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
    return getLspServices();
  }

  await sorbetLsp.client.onReady();
  return services;
}

exports.activate = async context => {
  var lspServices = await getLspServices()

  if (lspServices != null) {
    console.log("sorbet ready");

    // manually set the autocmd with `sorbet:build/` because coc always
    // sets up the autocmd with a `:/` suffix after the scheme, which won't work
    // for `sorbet:build/${FILE_PATH}` files.
    let content = `
augroup coc_sorbet_build_autocmd
autocmd!
  autocmd BufReadCmd,FileReadCmd,SourceCmd ${BUILD_EXTENSION_NS}/* call coc#rpc#request('CocAutocmd', ['BufReadCmd','${BUILD_EXTENSION_NS}', expand('<afile>')])
augroup end`;
    workspace.nvim.exec(content, false);

    context.subscriptions.push(
      workspace.registerTextDocumentContentProvider(
        HTTPS_EXTENSION_NS,
        new SorbetContentProvider(lspServices)
      ),
      workspace.registerTextDocumentContentProvider(
        BUILD_EXTENSION_NS,
        new SorbetContentProvider(lspServices)
      ),
    );
  }
}

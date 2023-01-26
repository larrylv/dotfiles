const {workspace, services} = require('coc.nvim')

var SCHEMES = [
  "sorbet:build",
  "sorbet:https"
]

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

    let cmds = [];
    for (let scheme of SCHEMES) {
      // manually set the autocmd with `sorbet:build/` because coc always sets
      // up the autocmd with a `:/` suffix after the scheme, which won't work
      // for `sorbet:build/${FILE_PATH}` files.
      // Also disable ALE as rubocop & cocsorbet complains about a lot of things
      // for the files not in our codebase.
      cmds.push(`autocmd BufReadCmd,FileReadCmd,SourceCmd ${scheme}/* call coc#rpc#request('CocAutocmd', ['BufReadCmd','${scheme}', expand('<afile>')]) | ALEDisableBuffer`);
      cmds.push(`autocmd BufReadCmd,FileReadCmd,SourceCmd ${scheme}:/* call coc#rpc#request('CocAutocmd', ['BufReadCmd','${scheme}', expand('<afile>')]) | ALEDisableBuffer`);
      context.subscriptions.push(
        workspace.registerTextDocumentContentProvider(
          scheme,
          new SorbetContentProvider(lspServices)
        )
      );
    }

    let content = `
augroup coc_sorbet_dynamic_autocmd
  autocmd!
  ${cmds.join("\n  ")}
augroup end`;

    workspace.nvim.exec(content, false);
  }
}

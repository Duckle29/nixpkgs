{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,

  # Package dependencies 
  sopel,
  wolframalpha,
}:

buildPythonPackage rec {
  pname = "sopel-wolfram";
  version = "0.6.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "2821c50af435e0225cb7f7bcc6370b0eaee16cad2a78bc2af47ed8fd05025c4c";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    sopel
    wolframalpha
  ];
  
  doCheck = false;

  pythonImportsCheck = [
    "sopel_wolfram.plugin"
  ];

  meta = {
    changelog = "https://github.com/dgw/sopel-wolfram/releases/tag/v${version}";
    homepage = "https://github.com/dgw/sopel-wolfram/";
    description = "Plugin for sopel IRC bot to send wolfram alpha queries in IRC";
    license = lib.licenses.efl20;
  }

}

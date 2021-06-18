{ mkDerivation, base, bytestring, Cabal, cpphs, data-flags
, directory, filepath, lib, libxkbcommon, process, random
, storable-record, template-haskell, text, time, transformers, unix
, vector
}:
mkDerivation {
  pname = "xkbcommon";
  version = "0.0.3";
  src = builtins.fetchTarball {
    url = "https://github.com/Ongy/haskell-xkbcommon/archive/a1455b51c053289b1b5b27d19d4159180647228d.tar.gz";
    sha256 = "03sw3isp64p1pqdwsagkvbppl8yqg7gwji5h7c80kci8dsx351zr";
  };
  setupHaskellDepends = [
    base Cabal cpphs directory filepath process template-haskell text
  ];
  libraryHaskellDepends = [
    base bytestring cpphs data-flags filepath process storable-record
    template-haskell text transformers
  ];
  librarySystemDepends = [ libxkbcommon ];
  testHaskellDepends = [ base unix ];
  benchmarkHaskellDepends = [ base random time vector ];
  description = "Haskell bindings for libxkbcommon";
  license = lib.licenses.mit;
  doCheck = false;
}

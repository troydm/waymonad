{ mkDerivation, base, bytestring, Cabal, cpphs, data-flags
, directory, filepath, lib, libxkbcommon, process, random
, storable-record, template-haskell, text, time, transformers, unix
, vector
}:
mkDerivation {
  pname = "xkbcommon";
  version = "0.0.3";
  src = ./hsroots/haskell-xkbcommon;
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
}

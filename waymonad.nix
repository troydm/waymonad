{ mkDerivation, base, bytestring, clock, composition, config-schema
, config-value, containers, data-default, deepseq, directory
, formatting, ghc-prim, hayland, HFuse, hsroots, lib, hslibinput
, mtl, network, process, safe, semigroupoids, stm
, template-haskell, text, time, transformers, unix, unliftio
, unliftio-core, waymonad-scanner, xdg-basedir, xkbcommon
}:
mkDerivation {
  pname = "waymonad";
  version = "0.0.1.0";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    base bytestring clock composition config-schema config-value
    containers data-default deepseq directory formatting ghc-prim
    hayland HFuse hsroots hslibinput mtl network process safe
    semigroupoids stm template-haskell text time transformers unix
    unliftio unliftio-core waymonad-scanner xdg-basedir xkbcommon
  ];
  executableHaskellDepends = [
    base containers hayland hsroots hslibinput text xkbcommon
  ];
  homepage = "https://github.com/ongy/waymonad";
  description = "Wayland compositor build on the ideas of Xmonad";
  license = lib.licenses.lgpl21Only;
}

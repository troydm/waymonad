{ mkDerivation, base, c2hs, data-flags, lib, libGL, pkg-config
, process, template-haskell, time, transformers, wayland, xml
}:
mkDerivation {
  pname = "hayland";
  version = "0.1.1.0";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    base data-flags process template-haskell time transformers xml c2hs
  ];
  libraryPkgconfigDepends = [ libGL wayland ];
  libraryToolDepends = [ c2hs pkg-config ];
  executableHaskellDepends = [ base c2hs ];
  testHaskellDepends = [ base process xml c2hs ];
  description = "Haskell bindings for the C Wayland library";
  license = lib.licenses.mit;
}

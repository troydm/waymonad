{ mkDerivation, base, bytestring, cereal, containers, hayland
, hsroots, lib, mtl, process, template-haskell, text, wayland, xml
}:
mkDerivation {
  pname = "waymonad-scanner";
  version = "0.1.0.0";
  src = ./waymonad-scanner;
  libraryHaskellDepends = [
    base bytestring cereal containers hayland hsroots mtl process
    template-haskell text xml
  ];
  libraryPkgconfigDepends = [ wayland ];
  license = lib.licenses.lgpl21Only;
}

{ mkDerivation, base, bytestring, lib, libinput, text }:
mkDerivation {
  pname = "libinput";
  version = "0.1.0.0";
  src = ./.;
  libraryHaskellDepends = [ base bytestring text ];
  libraryPkgconfigDepends = [ libinput ];
  license = lib.licenses.lgpl21Only;
}

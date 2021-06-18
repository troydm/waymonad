{ mkDerivation, base, bytestring, lib, libinput, text }:
mkDerivation {
  pname = "libinput";
  version = "0.1.0.0";
  src = builtins.fetchTarball {
    url = "https://github.com/waymonad/libinput/archive/22d009f0c5555845fb57ded83fabd0b5adba3a0f.tar.gz";
    sha256 = "0chm0b4dygk3972bjfn6iv6ckba4h3yrxgjkbr2kwjdch22d35gy";
  };
  libraryHaskellDepends = [ base bytestring text ];
  libraryPkgconfigDepends = [ libinput ];
  license = lib.licenses.lgpl21Only;
}

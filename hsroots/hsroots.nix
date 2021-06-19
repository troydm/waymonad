{ mkDerivation, base, bytestring, composition, hayland, lib
, hslibinput, pixman, text, unix, wayland, wlroots, xkbcommon
, libX11
}:
mkDerivation {
  pname = "hsroots";
  version = "0.1.0.0";
  src = ./.;
  libraryHaskellDepends = [
    base bytestring composition hayland hslibinput text unix xkbcommon
  ];
  librarySystemDepends = [ hslibinput wayland libX11 ];
  libraryPkgconfigDepends = [ pixman wlroots ];
  description = "A small simple wrapper around wolroots";
  license = lib.licenses.lgpl21Only;
}

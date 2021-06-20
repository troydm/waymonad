{ mkDerivation, base, bytestring, composition, hayland, lib
, hslibinput, pixman, text, unix, wayland, wlroots, xkbcommon
, libX11, fetchFromGitHub
}:
let
  wlroots' = wlroots.overrideAttrs (o: {
    src = fetchFromGitHub {
      owner = "swaywm";
      repo = "wlroots";
      rev = "04c9ca4198a729a95a6368bbbf0438d1ba3465fa";
      sha256 = "+pPULTGDkQg1/mqy98soQ2UjUTblw/FnZTSoFW+n5cc=";
    };
    mesonFlags = o.mesonFlags ++ ["-Dwerror=false"];
  });
in mkDerivation {
  pname = "hsroots";
  version = "0.1.0.0";
  src = ./.;
  libraryHaskellDepends = [
    base bytestring composition hayland hslibinput text unix xkbcommon
  ];
  librarySystemDepends = [ libX11 ];
  libraryPkgconfigDepends = [ wayland pixman wlroots' ];
  description = "A small simple wrapper around wlroots";
  license = lib.licenses.lgpl21Only;
}

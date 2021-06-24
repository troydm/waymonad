{ mkDerivation, base, bytestring, composition, hayland, lib
, hslibinput, pixman, text, unix, wayland, wlroots, xkbcommon
, libX11, fetchFromGitHub, freerdp
}:
let
  wlroots' = wlroots.overrideAttrs (o: rec {
    version = "0.7.0";
    src = fetchFromGitHub {
      owner = "swaywm";
      repo = "wlroots";
      rev = version;
      sha256 = "iiBRcY/NpQUJZDvQUHS0feuwa8du5RNpb+2wpa9R/Us=";
    };
    mesonFlags = o.mesonFlags ++ ["-Dwerror=false"];
    nativeBuildInputs = o.nativeBuildInputs ++ [freerdp];
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

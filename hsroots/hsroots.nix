{ mkDerivation, base, bytestring, composition, hayland, lib
, hslibinput, pixman, text, unix, wayland, wlroots, xkbcommon
, libX11, fetchFromGitHub, freerdp, mesa
}:
let
  wlroots' = wlroots.overrideAttrs (o: rec {
    version = "0.12.0";
    src = fetchFromGitHub {
      owner = "swaywm";
      repo = "wlroots";
      rev = version;
      sha256 = "1rE3D+kQprjcjobc95/mQkUa5y1noY0MdoYJ/SpFQwY=";
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
  librarySystemDepends = [ libX11 mesa ];
  libraryPkgconfigDepends = [ wayland pixman wlroots' ];
  description = "A small simple wrapper around wlroots";
  license = lib.licenses.lgpl21Only;
}

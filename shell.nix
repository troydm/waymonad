let
  pkgs = import <nixpkgs> { overlays = [ (import ./overlay.nix) ]; };
in pkgs.haskellPackages.shellFor {
  packages = p: [ p.waymonad p.hsroots p.hayland  ];
  withHoogle = true;
  buildInputs = [ pkgs.cabal-install pkgs.cabal2nix ];
}

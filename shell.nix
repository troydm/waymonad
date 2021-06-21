{ pkgs' ? import <nixpkgs> {} }:
let
  pkgs = pkgs'.extend (import ./overlay.nix);
in pkgs.haskellPackages.shellFor {
  packages = p: [ p.waymonad p.hsroots p.hayland p.waymonad-scanner ];
  withHoogle = true;
  buildInputs = [ pkgs.cabal-install pkgs.cabal2nix pkgs.haskell-language-server ];
}

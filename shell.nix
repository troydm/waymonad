{ pkgs ? import <nixpkgs> {} }:
pkgs.haskellPackages.shellFor {
  packages = p: [ (p.callPackage ./hayland.nix {}) ];
  withHoogle = true;
  buildInputs = [ pkgs.cabal-install pkgs.cabal2nix ];
}

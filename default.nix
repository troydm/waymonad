{ pkgs ? import <nixpkgs> {} }:
pkgs.haskellPackages.callPackage ./hayland.nix {}

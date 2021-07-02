{ pkgs ? import (import ./sources.nix).nixpkgs {} }:
let pkgs' = pkgs; in
let
  pkgs = pkgs'.extend (import ./overlay.nix);
in pkgs.haskellPackages.waymonad

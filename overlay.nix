_: pkgs:
let
  sources = import ./sources.nix;
in {
  haskellPackages = pkgs.haskellPackages.override {
    overrides = self: super: {
      hayland = self.callPackage ./hayland/hayland.nix {};
      hslibinput = self.callPackage (import "${sources.libinput}/libinput.nix") {};
      hsroots = self.callPackage ./hsroots/hsroots.nix {};
      waymonad-scanner = self.callPackage ./waymonad-scanner/waymonad-scanner.nix {};
      waymonad = self.callPackage ./waymonad.nix {};
      xkbcommon = self.callPackage (import "${sources.xkbcommon}/xkbcommon.nix") {};
    };
  };
}

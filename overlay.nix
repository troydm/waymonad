_: pkgs: {
  haskellPackages = pkgs.haskellPackages.override {
    overrides = self: super: {
      hayland = self.callPackage ./hsroots/haskell-wayland/hayland.nix {};
      hsroots = self.callPackage ./hsroots/hsroots.nix {};
      libinput = self.callPackage ./libinput.nix { libinput = pkgs.libinput; };
      waymonad = self.callPackage ./waymonad.nix {};
      waymonad-scanner = self.callPackage ./waymonad-scanner.nix {};
      xkbcommon = self.callPackage ./xkbcommon.nix {};
    };
  };
}

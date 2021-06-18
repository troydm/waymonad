_: pkgs: {
  haskellPackages = pkgs.haskellPackages.override {
    overrides = self: super: {
      hayland = self.callCabal2nix "hayland" ./hsroots/haskell-wayland {};
      HFuse = self.callCabal2nix "HFuse" ./hfuse {};
      hsroots =
        pkgs.haskell.lib.overrideCabal
        (self.callCabal2nix "hsroots" ./hsroots { input = pkgs.libinput; })
        (o: { librarySystemDepends = o.librarySystemDepends ++ [ pkgs.xorg.libX11 ]; });
      libinput =
        self.callCabal2nix "libinput" ./hsroots/libinput { inherit (pkgs) libinput; };
      waymonad =
        pkgs.haskell.lib.overrideCabal
        (self.callCabal2nix "waymonad" ./. {})
        (o: {
          librarySystemDepends = o.librarySystemDepends ++
            (with pkgs; [ wayland pkgconfig wlroots pixman fuse gegl_0_4 ]);
        });
      waymonad-scanner =
        self.callCabal2nix "waymonad-scanner" ./waymonad-scanner {};
      xkbcommon =
        pkgs.haskell.lib.overrideCabal
        (self.callCabal2nix "xkbcommon" ./hsroots/haskell-xkbcommon {})
        (o: { librarySystemDepends = o.librarySystemDepends ++ (with pkgs; [ linuxHeaders ]); });
    };
  };
}

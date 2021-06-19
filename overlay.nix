_: pkgs:
let
  xkbcommon_src = builtins.fetchTarball {
    url = "https://github.com/L-as/haskell-xkbcommon/archive/fbf66b30fde9a1dbda1cb591d13d55ff295d49bc.tar.gz";
    sha256 = "0n93ma0cqnv89060qnay5l54id5qplf30z00bv18f6g7iq0sqcpm";
  };
  libinput_src = builtins.fetchTarball {
    url = "https://github.com/L-as/libinput/archive/da47b1e900ddc0e0ea68de4f36cf74064d5fe998.tar.gz";
    sha256 = "06gm7jc97hj19w200gpn515yf9h1q4jmvylh9h2gjs5x6f01mwhy";
  };
in {
  haskellPackages = pkgs.haskellPackages.override {
    overrides = self: super: {
      hayland = self.callPackage ./hayland/hayland.nix {};
      hsroots = self.callPackage ./hsroots/hsroots.nix {};
      hslibinput = self.callPackage (import "${libinput_src}/libinput.nix") {};
      waymonad-scanner = self.callPackage ./waymonad-scanner/waymonad-scanner.nix {};
      waymonad = self.callPackage ./waymonad.nix {};
      xkbcommon = self.callPackage (import "${xkbcommon_src}/xkbcommon.nix") {};
    };
  };
}

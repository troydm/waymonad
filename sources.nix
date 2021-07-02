{
  xkbcommon = builtins.fetchTarball {
    url = "https://github.com/L-as/haskell-xkbcommon/archive/fbf66b30fde9a1dbda1cb591d13d55ff295d49bc.tar.gz";
    sha256 = "0n93ma0cqnv89060qnay5l54id5qplf30z00bv18f6g7iq0sqcpm";
  };
  libinput = builtins.fetchTarball {
    url = "https://github.com/L-as/libinput/archive/da47b1e900ddc0e0ea68de4f36cf74064d5fe998.tar.gz";
    sha256 = "06gm7jc97hj19w200gpn515yf9h1q4jmvylh9h2gjs5x6f01mwhy";
  };
  nixpkgs = builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/258e959faf55c76c1855b57ee26a97027a303c28.tar.gz";
    sha256 = "04yb2mg86pz85w83fnj4qgggx5pjdc7hlnfs18s6jzwrcs5v8l3p";
  };
}

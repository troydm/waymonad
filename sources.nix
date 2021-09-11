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
    url = "https://github.com/NixOS/nixpkgs/archive/91d2ebe422fa7f3745c7ef7b73dde8dbb2a0a382.tar.gz";
    sha256 = "0p5wii9gk2b2cxniq6b5hlqjvaj30hks0qfym24lnfdvb3wppz0q";
  };
}

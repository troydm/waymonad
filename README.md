## About

Waymonad is a Wayland compositor made with wlroots that aims to feel like [xmonad](https://github.com/xmonad/xmonad).

This is a fork of Waymonad that hopes to get it working again.
Hopefully we'll get it merged back into waymonad/waymonad eventually.

## Communication channels

Join us in [#waymonad:matrix.org](https://matrix.to/#/#waymonad:matrix.org)!

## Running it

You must first install [Nix](https://nixos.org/download.html),
and after that you can run `nix-shell` in the root of the repository.
This will give you an environment with GHC, Cabal, etc.

Now you can simply run `cabal run` which hopefully will launch Waymonad.
You can launch a program inside Waymonad by simply setting WAYLAND_DISPLAY
before launching a program, i.e. `env WAYLAND_DISPLAY=wayland-1 pavucontrol`.
If you're not already running a Wayland compositor, it will likely be `wayland-0` instead.

## Contributing

The current main goal is to update the wlroots we use to the latest one incrementally.
To update the version used, set the revision in hsroots/hsroots.nix and fill
the sha256 hash with zeroes.
You can either fix what's broken by the update or remove the features broken,
both are completely fine. The priority is most of all just using
to the latest wlroots.

### Future

Both hayland and hsroots also need a redesign such that there is a safe
API that won't cause a segfault if you do something incorrect, but that
will have to happen after updating wlroots to the latest version.

## Troubleshooting

Try running `nix-shell --pure` instead if you're having problems inside the shell.
Make sure to set `XDG_RUNTIME_DIR` and `WAYLAND_DISPLAY` if you do this.

<img src="./assets/logo-light.svg">

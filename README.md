## About

Waymonad is a Wayland compositor made with wlroots that aims to feel like [xmonad](https://github.com/xmonad/xmonad).

This is a fork of Waymonad that will hopefully be merged back into https://github.com/waymonad/waymonad eventually.

## Communication channels

Join us in [#waymonad:matrix.org](https://matrix.to/#/#waymonad:matrix.org)!

## Running it

You must first install [Nix](https://nixos.org/download.html),
and after that you can run `nix-shell --pure` in the root of the repository.
This will give you an environment with GHC, Cabal, etc.

Now you can simply run `cabal run` which hopefully will launch Waymonad.
You can launch a program inside Waymonad by simply setting WAYLAND_DISPLAY
before launching a program, e.g. `env WAYLAND_DISPLAY=wayland-1 pavucontrol`.
If you're not already running a Wayland compositor, it will likely be `wayland-0` instead.

## Status

- It runs on wlroots 0.14.0 (latest as of now)
- It is not documented nor user friendly
- It crashes occasionally due to pointer handling bugs
- It needs some internal redesigning (see Contributing)

## Contributing

Newcomers can start by trying to remove hayland/Graphics/Wayland/Scanner
since it's made redundant by waymonad-scanner AFAICT, and then fixing
the breakage that results in.

### hsroots

hsroots needs a redesign so that it at least exposes a semi-safe interface, where you don't
have to juggle pointers around like now. It also needs to run all wlroots functions from a
single thread since it's not thread safe. Right now waymonad just isn't compiled with -threaded
to avoid thread safety issues.
The same is possibly true for hayland.

The design I'm thinking of:
- All wlroots function calls are delegated to a bound thread using a channel.
- All "wlr objects" returned from the API will be wrapped in something like an `IORef Ptr`.
- A signal handler on "wlr objects" will be installed onto the destroy event such that the above `IORef` is set to null atomically when the object is destroyed.
- There will also have to be a finalizer on this that removes the signal handler from the destroy signal handler linked list.

AFAICT there shouldn't be any thread-safety issues with the above.

You are free to help implement the above.

## Troubleshooting

Try running `nix-shell` instead if you're having problems inside the shell.
Make sure to set `XDG_RUNTIME_DIR` and `WAYLAND_DISPLAY` if you do this.

If you can't get it to build, try deleting dist-newstyle each time you change something, so that
you can get a clean build.

<img src="./assets/logo-light.svg">

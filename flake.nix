# mkdir some-dir \
# && cd some-dir \
# && git clone https://github.com/PedroRegisPOAR/tracecode-toolkit.git \
# && cd tracecode-toolkit \
# && nix shell --command ./configure
#
#
# chmod +x tracecode
#
# TODO: how to make it work?
# NOTE: the traced command is the ls command.
# TRACE_DIR="$(pwd)"
# strace -ff -y -ttt -qq -a1 -o $TRACE_DIR/trace-ls ls
#
# ./tracecode --develop ?? --deploy ??? graphic

{
  description = "TODO: what put here?";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        name = "tracecode-toolkit";

        pkgs = import nixpkgs {
          inherit system;
        };
      in
      rec {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            bashInteractive
            coreutils
            gcc
            gnumake
            python2
          ];

          shellHook = ''
            echo "Entering the nix devShell"
          '';
        };
      });
}

{
  description = "lean dev";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
        {
          devShells.default = with pkgs; mkShell {
            buildInputs = [
            ];
            nativeBuildInputs = [
              lean
              gcc
              gnumake
              stdenv.cc.cc.lib
            ];
          };
        }
    );
}

{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  buildInputs = [
    pkgs.nixpkgs-fmt
    pkgs.julia-stable-bin
  ];

  shellHook = ''
    # ...
  '';
}

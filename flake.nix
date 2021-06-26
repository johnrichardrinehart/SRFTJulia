{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils/master";
  };

  outputs = inputs:
  let
    nixpkgs = inputs.nixpkgs;
    flake-utils = inputs.flake-utils;
  in
    flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
    in
    rec {
      packages = flake-utils.lib.flattenTree {
        hello = pkgs.hello;
      };
      defaultPackage = packages.hello;
      apps.hello = flake-utils.lib.mkApp { drv = packages.hello; };
      defaultApp = apps.hello;
      devShell = import ./shell.nix { inherit pkgs;};
#      specialArgs = { pkgs = nixpkgs; };
    }
    );
}

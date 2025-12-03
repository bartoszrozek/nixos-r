{
  description = "Custom R build with proper install";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    packages.${system}.r-442 = import ./versions/r-442.nix { inherit pkgs; };
  };
}


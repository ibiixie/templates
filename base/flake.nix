{
  description = "A generic Nix flake template";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    _inputs@{ self, nixpkgs, ... }:
    let
      inherit (nixpkgs) lib;

      supportedSystems = [ "x86_64-linux" ];
      forAllSystems = lib.genAttrs supportedSystems;
      pkgsFor = forAllSystems (system: import nixpkgs { inherit system; });
    in
    {
      packages = forAllSystems (system: { });

      devShells = forAllSystems (system: {
        default = pkgsFor.${system}.callPackage ./shell.nix { pkgs = pkgsFor.${system}.pkgs; };
      });

      formatter = forAllSystems (system: {
        default = pkgsFor.${system}.pkgs.nixfmt-rfc-style;
      });

      # TODO implement these
      # nixosModules.default = ./nix/module.nix { };
      # homeManagerModules.default = ./nix/hm-module.nix { };
    };
}

{
  description = "Kompute configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs =
    inputs@{ nixpkgs, ... }:
    let
      nixosConfigurations = hosts: {
        nixosConfigurations = builtins.listToAttrs (
          map (
            { name, system }:
            let
              pkgs = import nixpkgs {
                inherit system;
                config.allowUnfree = true;
              };
            in
            {
              inherit name;
              value = nixpkgs.lib.nixosSystem {
                inherit system pkgs;
                specialArgs = { inherit inputs; };
                modules = [
                  ./hosts/shared.nix
                  ./hosts/${name}/configuration.nix
                ];
              };
            }
          ) hosts
        );
      };
    in
    nixosConfigurations [
      {
        name = "kompute";
        system = "x86_64-linux";
      }
      {
        name = "raspberry";
        system = "x86_64-linux";
      }
    ];
}

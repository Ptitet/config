{
  description = "Kompute configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    otter-launcher = {
      url = "github:kuokuo123/otter-launcher";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.darwin.follows = "";
      inputs.home-manager.follows = "home-manager";
    };
    cli-of-life = {
      url = ./sources/cli-of-life;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    keal = {
      url = ./sources/keal;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ nixpkgs, agenix, ... }:
    let
      nixosConfigurations = hosts: {
        nixosConfigurations = builtins.listToAttrs (
          map (
            { name, system }:
            {
              inherit name;
              value = nixpkgs.lib.nixosSystem {
                inherit system;
                specialArgs = { inherit inputs; };
                modules = [
                  ./hosts/base.nix
                  ./hosts/${name}/configuration.nix
                  {
                    nixpkgs.config.allowUnfree = true;
                  }
                  agenix.nixosModules.default
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
        name = "liberty";
        system = "x86_64-linux";
      }
    ];
}

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
    # keal = {
    #   url = ./sources/keal;
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    minegrub = {
      url = "github:Lxtharia/minegrub-theme";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    try = {
      url = "github:tobi/try";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    eden = {
      # pinned because takes 20+ minutes to build
      url = "github:Daaboulex/eden-nix/9c0887b4abd952cecebd3ec3e4697bd9fe3eb354";
      inputs.nixpkgs.url = "github:NixOS/nixpkgs/3084f14a926eba4cddf8c95eca1d81435c5cf3cd";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      agenix,
      home-manager,
      minegrub,
      eden,
      ...
    }:
    let
      nixosConfigurations = hosts: {
        nixosConfigurations = builtins.listToAttrs (
          map (
            {
              name,
              system,
              extraModules ? [ ],
            }:
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
                  home-manager.nixosModules.default
                ]
                ++ extraModules;
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
        extraModules = [
          minegrub.nixosModules.default
          eden.nixosModules.default
        ];
      }
    ];
}

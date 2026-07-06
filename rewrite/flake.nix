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
    minegrub = {
      url = "github:Lxtharia/minegrub-theme";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    try = {
      url = "github:tobi/try";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    let
      lib = import ./lib.nix (inputs // { flakeRoot = "/home/jules/nixos"; });
    in
    lib.nixosConfigurations [
      {
        name = "kompute";
        system = "x86_64-linux";
        plateform = "laptop";
        users = [ "jules" ];
      }
      {
        name = "liberty";
        system = "x86_64-linux";
        plateform = "laptop";
        users = [ "jules" ];
      }
      {
        name = "black-thing";
        system = "x86_64-linux";
        plateform = "desktop";
        users = [ "jules" ];
      }
    ];
}

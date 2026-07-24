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
      url = "github:tobi/try-cli";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    wattage = {
      url = "github:v81d/wattage";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    let
      lib = import ./lib.nix { inherit inputs; flakeRoot = "/home/jules/nixos"; };
      jules = {
        name = "jules";
        groups = [ "wheel" ];
        shell = pkgs: pkgs.zsh;
      };
    in
    lib.nixosConfigurations [
      {
        name = "kompute";
        system = "x86_64-linux";
        plateform = "laptop";
        users = [ jules ];
      }
      {
        name = "liberty";
        system = "x86_64-linux";
        plateform = "laptop";
        users = [ jules ];
      }
      {
        name = "black-thing";
        system = "x86_64-linux";
        plateform = "desktop";
        users = [ jules ];
      }
    ];
}

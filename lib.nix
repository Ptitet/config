{ inputs, flakeRoot }:
let
  mapToAttrs = f: l: builtins.listToAttrs (map f l);
  mkUsers = { hostname, users }: { pkgs, ... }: {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit inputs flakeRoot; };
      users = mapToAttrs ({ name, ... }: {
        inherit name;
        value = {
          imports = [
            ./users/${name}/home.nix
            ./users/${name}/hosts/${hostname}
            {
              programs.home-manager.enable = true;
            }
          ];
          home = {
            username = name;
            homeDirectory = "/home/${name}";
          };
        };
      }) users;
    };
    users.users = mapToAttrs (
      {
        name,
        groups ? [ ],
        shell ? (pkgs: pkgs.bash),
      }:
      {
        inherit name;
        value = {
          shell = shell pkgs;
          extraGroups = groups;
          isNormalUser = true;
        };
      }
    ) users;
  };
in
{
  nixosConfigurations = hosts: {
    nixosConfigurations = mapToAttrs (
      {
        name,
        system,
        plateform,
        users,
      }:
      {
        inherit name;
        value = inputs.nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs plateform flakeRoot; };
          modules = [
            ./hosts/features/base
            ./hosts/${name}/configuration.nix
            {
              networking.hostName = name;
            }
            (mkUsers {
              inherit users;
              hostname = name;
            })
            inputs.agenix.nixosModules.default
            inputs.home-manager.nixosModules.default
          ];
        };
      }
    ) hosts;
  };
}

inputs: rec {
  mapToAttrs = f: l: builtins.listToAttrs (map f l);
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
          specialArgs = { inherit inputs plateform; };
          modules = [
            ./hosts/features/base
            ./hosts/${name}/configuration.nix
            {
              networking.hostName = name;
            }
            (mkUsers users)
            inputs.agenix.nixosModules.default
            inputs.home-manager.nixosModules.default
          ];
        };
      }
    ) hosts;
  };
  mkUsers = { hostname, users }: {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit inputs; };
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
        shell ? inputs.pkgs.bash,
      }:
      {
        inherit name;
        value = {
          inherit shell;
          extraGroups = groups;
          isNormalUser = true;
        };
      }
    ) users;
  };
}

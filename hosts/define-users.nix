{
  inputs,
  pkgs,
  config,
}:
users:
let
  hostname = config.networking.hostName;
in
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users = builtins.listToAttrs (
      map (
        { name, ... }:
        {
          inherit name;
          value = ../users/${name}/hosts/${hostname}.nix;
        }
      ) users
    );
  };
  users.users = builtins.listToAttrs (
    map (
      {
        name,
        description ? "",
        groups ? [ ],
        shell ? pkgs.bash,
      }:
      {
        inherit name;
        value = {
          inherit description shell;
          extraGroups = groups;
          isNormalUser = true;
        };
      }
    ) users
  );
}

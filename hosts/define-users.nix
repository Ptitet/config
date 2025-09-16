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
          value = {
            imports =
              let
                userdir = "../users/${name}";
              in
              [
                ./${userdir}/base.nix
                ./${userdir}/hosts/${hostname}
              ];
            home = {
              username = name;
              homeDirectory = "/home/${name}";
              stateVersion = "25.05"; # Don't touch that
            };
          };
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

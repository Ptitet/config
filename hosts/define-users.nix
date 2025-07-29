{
  inputs,
  pkgs,
  config,
}@args:
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
          value =
            import ../users/${name} args # Base config shared among hosts
            // import ../users/${name}/hosts/${hostname}.nix args # Host-specific config
            // {
              programs.home-manager.enable = true;
              # Let Home Manager install and manage itself
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

{ config, pkgs, ... }:
{
  imports = [
    ./shared/shell
    ./shared/cli/git.nix
  ];

  xdg.configFile =
    let
      configs = builtins.attrNames (builtins.readDir ./config);
      configPath = "${config.home.homeDirectory}/nixos/users/jules/config";
      mapFn = name: {
        inherit name;
        value.source = config.lib.file.mkOutOfStoreSymlink "${configPath}/${name}";
      };
    in
    builtins.listToAttrs (map mapFn configs);

  programs = {
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    chromium = {
      enable = true;
    };
  };

  home.packages = with pkgs; [
    typst
    evince
  ];

  programs.home-manager.enable = true; # Let Home Manager install and manage itself
}

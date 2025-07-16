{
  pkgs,
  inputs,
  config,
  ...
}:
let
  username = "jules";
  system = "x86_64-linux";
in
{
  imports = [
    ./categories
    ./apps
    ./services
  ];
  users.users.${username} = {
    description = "${config.networking.hostName}'s god";
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    isNormalUser = true;
    shell = pkgs.zsh;
  };

  environment.shellAliases = {
    ll = "ls -l";
    la = "ls -A";
    lal = "ls -lA";
  };

  apps = {
    zen-browser.enable = true;
    firefox.enable = true;
    zed.enable = true;
    steam.enable = true;
  };

  graphical.enable = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit username inputs system; };
  };
  home-manager.users.${username} = {
    programs.home-manager.enable = true; # Let Home Manager install and manage itself.
    home.packages = with pkgs; [
      obsidian
      baobab
      bun
      discord
      fastfetch
      hyprpaper
      localsend
    ];

    home = {
      inherit username;
      homeDirectory = "/home/${username}";
      stateVersion = "25.05"; # Don't touch that
    };

  };
}

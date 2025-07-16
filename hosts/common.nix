# Ultra basic config common to all my machines
{ pkgs, ... }:
{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  boot = {
    loader = {
      systemd-boot.enable = true; # Use systemd bootloader
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  networking = {
    networkmanager = {
      enable = true;
      insertNameservers = [
        "1.1.1.1"
        "1.0.0.1"
      ];
    };
    firewall.enable = false;
  };

  environment.systemPackages = with pkgs; [
    wget
    btop
    fzf
  ];
  programs.zsh = {
    enable = true;
    autosuggestions = {
      enable = true;
      async = true;
    };
    enableCompletion = true;
    enableLsColors = true;
    syntaxHighlighting.enable = true;
  };
  programs.fzf.fuzzyCompletion = true;
  programs.bat.enable = true;
  programs.git.enable = true;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  time.timeZone = "Europe/Paris";

  i18n.defaultLocale = "fr_FR.UTF-8";
  console = {
    # font = "FiraCode Nerd Font"; # not working
    keyMap = "fr-latin1";
  };

  services.getty.greetingLine = ''
    \e{green}\l on \n (\s \r)\e{reset}
    It is \t
    Enjoy the pain
  '';

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];
}

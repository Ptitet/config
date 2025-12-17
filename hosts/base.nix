# Ultra basic config common to all my machines
{
  pkgs,
  inputs,
  lib,
  ...
}:
{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  boot = {
    loader = {
      systemd-boot.enable = lib.mkDefault true; # Use systemd bootloader
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  environment.systemPackages = [
    inputs.agenix.packages."x86_64-linux".default
  ];
  environment.pathsToLink = [ "/share/zsh" ]; # https://mynixos.com/home-manager/option/programs.zsh.enableCompletion

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

  time.timeZone = "Europe/Paris";

  i18n = {
    defaultLocale = "fr_FR.UTF-8";
    extraLocales = [ "en_US.UTF-8/UTF-8" ];
  };
  console = {
    keyMap = "fr-latin1";
  };

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];
}

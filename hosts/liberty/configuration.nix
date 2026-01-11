{
  inputs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
    ../users.nix

    ../shared/networking
    ../shared/packages
    ../shared/laptop.nix

    ../shared/misc/mx-master.nix
    ../shared/misc/numworks.nix

    inputs.minegrub.nixosModules.default
  ];

  services.thermald.enable = false;
  programs.auto-cpufreq.enable = false;

  networking.hostName = "liberty";

  boot.loader = {
    systemd-boot.enable = false;
    grub = {
      enable = true;
      efiSupport = true;
      configurationLimit = 3;
      device = "nodev";
      minegrub-theme = {
        enable = true;
        splash = "I use NixOS btw...";
        boot-options-count = 3;
      };
    };
  };

  system.stateVersion = "25.05"; # Don't touch that
}

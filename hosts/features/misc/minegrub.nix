{
  inputs,
  config,
  lib,
  ...
}:
let
  splash = config.features.minegrub.splash;
in
{
  options.features.minegrub.splash = lib.mkOption {
    description = "Minegrub splash";
    default = "I use NixOS btw...";
  };

  config = {
    imports = [
      inputs.minegrub.nixosModules.default
    ];

    boot.loader = {
      systemd-boot.enable = false;
      grub = {
        enable = true;
        efiSupport = true;
        configurationLimit = 3;
        device = "nodev";
        minegrub-theme = {
          inherit splash;
          enable = true;
          boot-options-count = 3;
        };
      };
    };
  };
}

{
  pkgs,
  inputs,
  config,
  ...
}:
let
  define-users = import ../define-users.nix { inherit inputs pkgs config; };
in
(define-users [
  {
    name = "jules";
    description = "${config.networking.hostName}'s god";
    groups = [
      "wheel"
      "networkmanager"
    ];
    shell = pkgs.zsh;
  }
])
// {
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
    ./packages.nix
  ];

  hardware = {
    bluetooth = {
      enable = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
          Experimental = true;
        };
      };
    };
    graphics = {
      extraPackages = with pkgs; [
        intel-vaapi-driver
        mesa
      ];
    };
  };

  networking.hostName = "kompute";

  services = {
    printing.enable = true; # CUPS services for printing
    pipewire = {
      # Enable sound.
      enable = true;
      pulse.enable = true;
    };
    libinput.enable = true; # Enable touchpad support (enabled default in most desktopManager).
    gvfs.enable = true; # Needed for Nautilus
    logind.lidSwitchDocked = "suspend";
    displayManager.ly = {
      # no worky
      enable = true;
      settings = {
        # https://codeberg.org/fairyglade/ly/src/branch/master/res/config.ini
        allow_empty_password = false;
        animation = "colormix";
        asterisk = "0x2022";
        auth_fails = 1;
        clear_password = true;
      };
    };
  };

  system.stateVersion = "25.05"; # Don't touch that
}

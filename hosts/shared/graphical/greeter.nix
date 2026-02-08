{ config, lib, ... }:
let
  greeter = config.my.greeter;
in
{
  options.my.greeter = lib.mkOption {
    type = lib.types.enum [
      "sysc-greet"
      "ly"
    ];
  };

  config = {
    services.sysc-greet = {
      enable = greeter == "sysc-greet";
      compositor = "niri";
    };

    services.displayManager.ly = {
      enable = greeter == "ly";
      x11Support = false; # this is enabled by default but I am on Wayland
      settings = {
        # https://codeberg.org/fairyglade/ly/src/branch/master/res/config.ini
        allow_empty_password = false;
        animation = "colormix";
        asterisk = "0x2022";
        auth_fails = 1;
        brightness_down_cmd = "/run/current-system/sw/bin/brightnessctl -n -e set 5%-";
        brightness_down_key = "F4";
        brightness_up_cmd = "/run/current-system/sw/bin/brightnessctl -e set +5%";
        brightness_up_key = "F5";
        clear_password = true;
      };
    };
  };
}

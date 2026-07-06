{
  config,
  lib,
  pkgs,
  plateform,
  ...
}:
{
  services.displayManager.ly = {
    enable = true;
    x11Support = false; # this is enabled by default but I am on Wayland
    settings = {
      # https://codeberg.org/fairyglade/ly/src/branch/master/res/config.ini
      allow_empty_password = config.services.howdy.enable; # Empty password allowed if Howdy is enabled
      animation = "colormix";
      asterisk = "0x2022";
      auth_fails = 2;
      clear_password = true;
    }
    // lib.mkIf (plateform == "laptop") {
      brightness_down_cmd = "${lib.getExe pkgs.brightnessctl} -n -e set 5%-";
      brightness_down_key = "F4";
      brightness_up_cmd = "${lib.getExe pkgs.brightnessctl} -e set +5%";
      brightness_up_key = "F5";
    };
  };
}

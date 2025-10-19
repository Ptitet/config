{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.services.screensaver;
in
{
  options.my.services.screensaver.enable = lib.mkEnableOption "Enables the screensaver";

  config =
    let
      lock-with-cbonsai = pkgs.writeShellScriptBin "lock-with-cbonsai" ''
        ${pkgs.cbonsai}/bin/cbonsai --screensaver --time 0.05 --wait 2 --message "$(fortune)" --multiplier 10 --life 50 &
        pid="$!"
        ${pkgs.swaylock}/bin/swaylock -f -c 000000
        kill "$pid"
      '';
    in
    lib.mkIf cfg.enable {
      home.packages = with pkgs; [
        swaylock
        swayidle
        cbonsai
        lock-with-cbonsai
      ];
      security.pam.services.swaylock = { };
      services.swayidle = {
        enable = true;
        timeouts = [
          {
            timeout = 20;
            command = "${lock-with-cbonsai}/bin/lock-with-cbonsai";
          }
        ];
      };
    };
}

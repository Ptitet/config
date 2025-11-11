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
      screensaver = pkgs.writeShellScriptBin "screensaver" ''
        ${pkgs.cbonsai}/bin/cbonsai \
        --screensaver \
        --time 0,05 \
        --wait 2 \
        --message "$(${pkgs.fortune}/bin/fortune)" \
        --multiplier 10 \
        --life 50 \
      '';
      pid-file = "/tmp/kitty-screensaver.pid";
      start-screensaver = pkgs.writeShellScriptBin "start-screensaver" ''
        ${pkgs.kitty}/bin/kitty \
          -- ${screensaver}/bin/screensaver > /dev/null &
        pid="$!"
        echo "$pid" > ${pid-file}
        disown
        exit
      '';
      stop-screensaver = pkgs.writeShellScriptBin "stop-screensaver" ''
        # notify-send Stopping screensaver
        pid_file="${pid-file}"
        if [ -f "$pid_file" ]; then
          # notify-send Welcome back!
          pid=$(cat "$pid_file")
          kill "$pid"
          rm "$pid_file"
        fi
      '';
    in
    lib.mkIf cfg.enable {
      home.packages = with pkgs; [
        swayidle
        cbonsai
        screensaver
        start-screensaver
        stop-screensaver
        fortune
      ];
      services.swayidle = {
        enable = true;
        timeouts = [
          {
            timeout = 5;
            command = "${start-screensaver}/bin/start-screensaver";
            resumeCommand = "${stop-screensaver}/bin/stop-screensaver";
          }
        ];
      };
    };
}

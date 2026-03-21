{
  lib,
  config,
  inputs,
  ...
}:
let
  cfg = config.my.cli.try;
in
{
  options.my.cli.try = {
    enable = lib.mkEnableOption "Enables try";
    path = lib.mkOption {
      type = lib.types.str;
    };
  };

  config = lib.mkIf cfg.enable {
    programs.zsh.initContent = ''
      function try() {
        local out
        out=$(${
          inputs.try.packages."x86_64-linux".default
        }/bin/try exec --path "${config.home.homeDirectory}/${cfg.path}" "$@" 2>/dev/tty)
        if [ $? -eq 0 ]; then
          eval "$out"
        else
          echo "$out"
        fi
      }
    '';
  };
}

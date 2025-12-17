{ config, lib, pkgs, ... }:
let
  cfg = config.my.apps.helix;
in
{
  options.my.apps.helix.enable = lib.mkEnableOption "Enables Helix";

  config = lib.mkIf cfg.enable {
    programs.helix.enable = true;
    home.packages = with pkgs; [
      zls
      nixd
      vscode-json-languageserver
      tinymist
      ruff
      typescript-go

      nixfmt-rfc-style
      kdlfmt
    ];
  };
}

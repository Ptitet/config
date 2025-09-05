{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.apps.zed;
in
{
  options.my.apps.zed.enable = lib.mkEnableOption "Enables zed";

  config = lib.mkIf cfg.enable {
    programs.zed-editor = {
      enable = true;
      extensions = [
        "nix"
        "kdl"
        "basher"
        "toml"
      ];
      extraPackages =
        with pkgs;
        let
          lsps = [
            nixd # Nix lsp
            nil # Nix lsp
            hyprls # Hyprlang lsp
            package-version-server # package.json lsp
            vscode-json-languageserver # json lsp
            yaml-language-server # yaml lsp
          ];
          formatters = [ nixfmt-rfc-style ];
        in
        lsps ++ formatters;
    };
  };
}

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
    home.packages = with pkgs; [
      zed-editor
      nixd # Nix lsp
      nil # Nix lsp
      hyprls # Hyprlang lsp
      package-version-server # package.json lsp
      vscode-json-languageserver # json lsp
      yaml-language-server # yaml lsp
      nixfmt-rfc-style
      vulkan-tools # required for zed
      vulkan-loader # required for zed
      vulkan-validation-layers # required for zed
    ];
  };
}

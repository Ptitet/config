{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.apps.zed.enable = lib.mkEnableOption "Enables zed";

  config = lib.mkIf config.apps.zed.enable {
    environment.systemPackages = with pkgs; [
      zed-editor
      nixd # Nix lsp
      nil # Nix lsp
      hyprls # Hyprlang lsp
      package-version-server # package.json lsp
      vscode-json-languageserver # json lsp
      nixfmt-rfc-style
      vulkan-tools # required for zed
      vulkan-loader # required for zed
      vulkan-validation-layers # required for zed
    ];
  };
}

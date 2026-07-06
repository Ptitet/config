{ pkgs, ... }: {
  programs.fresh-editor = {
    enable = true;
    extraPackages = import ../lsps-formatters.nix pkgs;
  };
}

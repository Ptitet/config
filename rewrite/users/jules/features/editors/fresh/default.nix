{ pkgs, ... }: {
  programs.fresh = {
    enable = true;
    extraPackages = import ../lsps-formatters.nix pkgs;
  };
}

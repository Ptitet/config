{
  nix.settings = {
    download-buffer-size = 500000000;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    trusted-users = [ "@wheel" ];
  };
  nixpkgs.config.allowUnfree = true;
}

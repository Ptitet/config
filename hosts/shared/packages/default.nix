{
  imports = [
    ./cli-utils.nix
  ];

  programs = {
    steam.enable = true;
    localsend = {
      enable = true;
      openFirewall = true;
    };
    sniffnet.enable = true;
  };

  services.flatpak.enable = true;
}

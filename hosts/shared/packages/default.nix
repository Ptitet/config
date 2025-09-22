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
  };
}

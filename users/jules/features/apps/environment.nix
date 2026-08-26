{ pkgs, ... }: {
  home.packages = with pkgs; [
    baobab
    typst
    evince
    nmap
    cbonsai
    fortune-kind
    sqlitestudio
    qbittorrent
    # bottles # build fails as of 17/07
    vlc
  ];

  programs = {
    obsidian.enable = true;
    discord = {
      enable = true;
      settings.SKIP_HOST_UPDATE = true;
    };
    fastfetch.enable = true;
    btop = {
      enable = true;
      package = pkgs.btop-rocm;
    };
  };
}

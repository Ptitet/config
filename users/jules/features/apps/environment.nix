{ pkgs, ... }: {
  home.packages = with pkgs; [
    obsidian
    baobab
    discord
    fastfetch
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
}

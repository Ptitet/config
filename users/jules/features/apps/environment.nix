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
    bottles
    vlc
  ];
}

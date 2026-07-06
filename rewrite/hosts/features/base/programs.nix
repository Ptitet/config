{ pkgs, ... }: {
  programs = {
    # Don't know if this should really be here
    zsh = {
      enable = true;
      autosuggestions = {
        enable = true;
        async = true;
      };
      enableCompletion = true;
      enableLsColors = true;
      syntaxHighlighting.enable = true;
    };
    fzf.fuzzyCompletion = true;
    bat.enable = true;
    git.enable = true;
    btop.enable = true;
  };

  environment.pathsToLink = [ "/share/zsh" ]; # https://mynixos.com/home-manager/option/programs.zsh.enableCompletion
  environment.systemPackages = with pkgs; [
    jq
    fd
    killall
    file
    ripgrep
    libqalculate
  ];
}

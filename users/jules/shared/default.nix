{
  imports = [
    ./shell
  ];

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.git = {
    enable = true;
    userName = "Ptitet";
    userEmail = "ptitet73@gmail.com";
    aliases = {
      s = "status";
      lg = "!git log --decorate --oneline --graph --all";
      a = "add";
      c = "commit -m";
    };
    extraConfig = {
      pull.rebase = true;
      init.defaultBranch = true;
    };
  };

  programs.home-manager.enable = true; # Let Home Manager install and manage itself
}

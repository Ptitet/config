{
  programs.git = {
    enable = true;
    settings = {
      aliases = {
        s = "status";
        lg = "!git log --decorate --oneline --graph --all";
        a = "add";
        c = "commit -m";
      };
      user = {
        name = "Ptitet";
        email = "ptitet73@gmail.com";
      };
      pull.rebase = true;
      init.defaultBranch = true;
    };
  };
  programs.lazygit = {
    enable = true;
    enableZshIntegration = true;
  };
}

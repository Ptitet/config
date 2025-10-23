{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Ptitet";
      user.email = "ptitet73@gmail.com";
      aliases = {
        s = "status";
        lg = "!git log --decorate --oneline --graph --all";
        a = "add";
        c = "commit -m";
      };
      pull.rebase = true;
      init.defaultBranch = true;
    };
  };
}

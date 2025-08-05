{ ... }:
{
  home.shellAliases = import ./misc/aliases.nix;

  programs.zsh = {
    enable = true;
    autocd = true;
    autosuggestion = {
      enable = true;
    };
    enableCompletion = true;
    history = {
      append = true;
      saveNoDups = true;
      findNoDups = true;
      ignoreDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;
    };
    syntaxHighlighting.enable = true;
  };
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

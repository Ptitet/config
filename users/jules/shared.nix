{ ... }:
{
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

  programs.home-manager.enable = true; # Let Home Manager install and manage itself
  home =
    let
      name = "jules";
    in
    {
      username = name;
      homeDirectory = "/home/${name}";
      shellAliases = {
        please = "sudo";
      };
      stateVersion = "25.05"; # Don't touch that
    };
}

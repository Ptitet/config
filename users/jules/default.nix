{
  ...
}:
# let
#   username = "jules";
#   system = "x86_64-linux";
# in
{
  home.shellAliases = {
    please = "sudo";
  };
  home.enableZshIntegration = true;

  programs.zsh = {
    enable = true;
    autocd = true;
    autosuggestions = {
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
}

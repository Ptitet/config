# { config, ... }:
{
  imports = [
    ./aliases.nix
  ];

  programs.zsh = {
    enable = true;
    autocd = true;
    autosuggestion.enable = true;
    # dotDir = "${config.homeDirectory}/zsh";
    # plugins = [];
    history = {
      append = true;
      saveNoDups = true;
      findNoDups = true;
      ignoreDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;
    };
    defaultKeymap = "emacs";
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;
  };
}

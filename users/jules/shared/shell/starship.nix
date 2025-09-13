{
  programs.starship = {
    enableInteractive = true;
    enableZshIntegration = true;
    settings = {
      format = ''
        ╭[$username@$host](red) [$directory](light blue) $bun$c
        ╰$env_var $character
      '';
      right_format = "$cmd_duration";
      character = {
        success_symbol = "[➜](bold green) ";
        error_symbol = "[✗](bold red) ";
      };
      env_var = {
        variable = "INTERACTIVE_DEV_SHELL";
        format = "[DEV]";
      };
    };
  };
}

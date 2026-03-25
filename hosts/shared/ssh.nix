{
  programs.ssh = {
    extraConfig = ''
        Host gh
          Hostname github.com
          User git
    '';
    startAgent = true;
  };
}
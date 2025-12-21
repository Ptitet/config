let
  flakeRoot = "/home/jules/nixos";
in
{
  home.shellAliases = {
    # ls
    ls = "ls -h --color=auto";
    la = "ls -A";
    ll = "ls -l";
    lal = "ls -lA";

    # replacements
    grep = "rg";
    cat = "bat";
    less = "bat";

    # shortcuts
    q = "exit";
    c = "clear";
    ff = "fastfetch";
    zed = "zeditor";
    tp = "btop";

    # nixos-rebuild
    rbs = "sudo nixos-rebuild switch --flake ${flakeRoot}";
    rbb = "sudo nixos-rebuild boot --flake ${flakeRoot}";
    rbt = "sudo nixos-rebuild test --flake ${flakeRoot}";
    rbbr = "rbb && reboot";

    # Fun because fun
    please = "sudo";
  };
  programs.zsh.siteFunctions = {
    nix-optimise = ''
      sudo nix-env --delete-generations +3 -p /nix/var/nix/profiles/system
      sudo nix-collect-garbage
      sudo nix-store --optimise
    '';

    use = ''
      local packages=()
      for pkg in "$@"; do
              packages+=("nixpkgs#$pkg")
      done
      nix shell -s IN_USE_SHELL 1 ${"$" + "{packages[@]}"}
    '';
  };
}

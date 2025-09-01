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

    # grep
    grep = "grep --color=auto";

    # shortcuts
    q = "exit";
    c = "clear";
    ff = "fastfetch";
    bt = "bluetoothctl";
    rbs = "sudo nixos-rebuild switch --flake ${flakeRoot}";
    rbb = "sudo nixos-rebuild boot --flake ${flakeRoot}";
    rbt = "sudo nixos-rebuild test --flake ${flakeRoot}";
    rbbr = "rbb && reboot";
    airpods = "bluetoothctl connect 98:A5:F9:0D:EB:CB";
    use = "nix-shell -p";

    # Zed
    zed = "zeditor";
    zeda = "zeditor -a";

    # Fun because fun
    please = "sudo";
  };
  programs.zsh.initContent = ''
    nix-optimiser() {
      sudo nix-env --delete-generations +3 -p /nix/var/nix/profiles/system
      sudo nix-collect-garbage
      sudo nix-store --optimise
    }
  '';
}

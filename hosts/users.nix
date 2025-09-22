{
  pkgs,
  inputs,
  config,
  ...
}:
let
  define-users = import ../define-users.nix { inherit inputs pkgs config; };
in
define-users [
  {
    name = "jules";
    description = "${config.networking.hostName}'s god";
    groups = [
      "wheel"
      "networkmanager"
    ];
    shell = pkgs.zsh;
  }
]

{
  pkgs,
  inputs,
  config,
  ...
}:
let
  define-users = import ../define-users { inherit inputs pkgs config; };
in
(define-users [
  {
    name = "jules";
    groups = [ "wheel" ];
    shell = pkgs.zsh;
  }
])
// {
  imports = [ ];

  networking.hostName = "raspberry";
}

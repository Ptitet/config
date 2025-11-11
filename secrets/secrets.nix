let
  jules = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAkAi2C4N5oUaInFQKv1mODMDaNeZ78Bth4iS9yDlENn Nix secrets";
in
{
  "anki-key.age".publicKeys = [ jules ];
}

{ inputs, ... }: {
  imports = [
    ./boot.nix
    ./programs.nix
    ./nix-settings.nix
    ./localization.nix
    ./networking.nix
  ];

  environment.systemPackages = [
    inputs.agenix.packages."x86_64-linux".default
  ];
}

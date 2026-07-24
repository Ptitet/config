{ pkgs, inputs, ... }: {
  services.upower.enable = true;
  environment.systemPackages = [ inputs.wattage.packages.${pkgs.stdenv.hostPlatform.system}.default ];
}

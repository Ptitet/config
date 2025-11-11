{
  pkgs,
  inputs,
  lib,
  ...
}:
{
  imports = [
    inputs.auto-cpufreq.nixosModules.default
  ];

  programs.auto-cpufreq = {
    enable = lib.mkDefault true;
    settings =
      # let
      #   defaults = {
      #     governor = "schedutil";
      #     turbo = "auto";
      #   };
      # in
      {
        charger = {
          governor = "performance";
          energy_performance_preference = "performance";
          energy_perf_bias = "balance_performance";
          plateform_profile = "performance";
        };
        battery = {
          governor = "powersave";
          energy_performance_preference = "power";
          energy_perf_bias = "balance_power";
          plateform_profile = "balanced";
        };
      };
  };

  services.thermald.enable = lib.mkDefault true;
  environment.systemPackages = with pkgs; [
    thermald
  ];
}

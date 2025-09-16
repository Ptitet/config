{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.auto-cpufreq.nixosModules.default
  ];

  programs.auto-cpufreq = {
    enable = true;
    settings =
      let
        defaults = {
          governor = "schedutil";
          turbo = "auto";
        };
      in
      {
        charger = defaults // {
          energy_performance_preference = "balance_performance";
          energy_perf_bias = "balance_performance";
        };
        battery = defaults // {
          energy_performance_preference = "power";
          energy_perf_bias = "balance_power";
        };
      };
  };

  services.thermald.enable = true;
  environment.systemPackages = with pkgs; [
    thermald
  ];
}

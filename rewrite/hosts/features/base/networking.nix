{ plateform, lib, ... }: {
  networking = {
    networkmanager = {
      enable = true;
      insertNameservers = [ "1.1.1.1" ];
    };
    wireless.scanOnLowSignal = false;
    wireless.enable = lib.mkIf (plateform != "laptop") (lib.mkDefault false);
  };
}

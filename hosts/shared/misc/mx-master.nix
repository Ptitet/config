{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ logiops ];

  systemd.services.logid.wantedBy = [ "multi-user.target" ];
  environment.etc = {
    "logid.cfg" = {
      text = ''
        devices: ({
          name: "Wireless Mouse MX Master";
          hiresscroll: {
            hires: true,
          },
          buttons: ({
            cid: 0xc3;
            action: {
              type: "Gestures";
              gestures: (
                {
                  direction: "Up";
                  action: {
                    type: "Keypress";
                    keys: ["KEY_LEFTCTRL", "KEY_PAGEUP"];
                  };
                },
                {
                  direction: "Down";
                  action: {
                    type: "Keypress";
                    keys: ["KEY_LEFTCTRL", "KEY_PAGEDOWN"];
                  };
                },
                {
                  direction: "Left";
                  mode: "OnRelease";
                  action = {
                    type: "CycleDPI";
                    dpis: [400, 600, 800, 1000, 1200, 1400, 1600];
                  };
                }
              );
            };
          });
        });
      '';
    };
  };
}

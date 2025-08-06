{
  inputs,
  config,
  lib,
  ...
}:
let
  cfg = config.my.apps.zen-browser;
in
{
  imports = [
    inputs.zen-browser.homeModules.twilight
  ];

  options.my.apps.zen-browser.enable = lib.mkEnableOption "Enables Zen browser";

  config = lib.mkIf cfg.enable {
    programs.zen-browser = {
      enable = true;
      policies = {
        AutofillAddressEnabled = false;
        AutofillCreditCardEnabled = false;
        BlockAboutAddons = true; # Extensions should be installed through this config file
        BlockAboutConfig = true; # Config should be done through this file
        CaptivePortal = true;
        DisableFeedbackCommands = true;
        DisableFirefoxAccounts = true;
        DisableFirefoxScreenshots = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableProfileImport = true;
        DisableSetDesktopBackground = true;
        DisableSystemAddonUpdate = true;
        DisableTelemetry = true;
        DisplayBookmarksToolbar = "newtab";
        DontCheckDefaultBrowser = true;
        DownloadDirectory = "\${home}/Téléchargements";
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
          EmailTracking = true;
        };
        FirefoxHome = {
          Search = true;
          TopSites = true;
          SponsoredTopSites = false;
          Highlights = true;
          Pocket = false;
          SponsoredPocket = false;
          Snippets = true;
          Locked = true;
        };
        GoToIntranetSiteForSingleWordEntryInAddressBar = true;
        HomePage = {
          Locked = true;
          StartPage = "previous-session";
        };
        ManagedBookmarks = [
          {
            name = "Nix";
            children = [
              {
                name = "NixOS Search";
                url = "https://search.nixos.org";
              }
              {
                name = "MyNixOS";
                url = "https://mynixos.com";
              }
            ];
          }
        ];
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        OfferToSaveLoginsDefault = false;
        OverrideFirstRunPage = "";
        OverridePostUpdatePage = "";
        PasswordManagerEnabled = false;
        Permissions.Autoplay = {
          Default = "block-audio-video";
          Locked = true;
        };
        PictureInPicture = {
          Enabled = false;
          Locked = true;
        };

        ExtensionSettings = {
          "*".installation_mode = "blocked";
          "uBlock@raymondhill.net" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            installation_mode = "force_installed";
          };
          "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
            installation_mode = "force_installed";
          };
          "firefox@ghostery.com" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ghostery/latest.xpi";
            installation_mode = "force_installed";
          };
          "{2662ff67-b302-4363-95f3-b050218bd72c}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/untrap-for-youtube/latest.xpi";
            installation_mode = "force_installed";
          };
        };

        Preferences =
          let
            lock-false = {
              Value = false;
              Status = "locked";
            };
            lock-true = {
              Value = true;
              Status = "locked";
            };
          in
          {
            "extensions.pocket.enabled" = lock-false;
            "extensions.screenshots.disabled" = lock-true;
            "browser.newtabpage.activity-stream.showSponsored" = lock-false;
            "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
            "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
          };
        RequestedLocales = [
          "fr"
          "en-US"
        ];
        SearchEngines = {
          Default = "duckduckgo";
          PreventInstalls = true;
        };
        SearchSuggestEnabled = true;
        SkipTermsOfUse = true;
        TranslateEnabled = false;
        UserMessaging = {
          ExtensionRecommendations = false;
          FeatureRecommendations = false;
          UrlbarInterventions = false;
          SkipOnboarding = false;
          MoreFromMozilla = false;
          FirefoxLabs = false;
          Locked = true;
        };
        UseSystemPrintDialog = false;
      };
    };
  };
}

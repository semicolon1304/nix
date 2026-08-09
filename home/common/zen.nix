# Good god this config is hideous to look at

{ pkgs, inputs, ... }:
let
  mkLockedAttrs = builtins.mapAttrs (
    _: value: {
      Value = value;
      Status = "locked";
    }
  );

  mkPluginUrl = id: "https://addons.mozilla.org/firefox/downloads/latest/${id}/latest.xpi";

  mkExtensionEntry =
    { id, pinned ? false, }:
    let
      base = {
        install_url = mkPluginUrl id;
        installation_mode = "force_installed";
      };
    in
    if pinned
    then base // { default_area = "navbar"; }
    else base;

  mkExtensionSettings = builtins.mapAttrs (
    _: entry:
      if builtins.isAttrs entry
      then entry
      else mkExtensionEntry { id = entry; }
  );
in
{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];
  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
    policies = {
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = false;
      OfferToSaveLogins = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };

      Preferences = mkLockedAttrs {
        "browser.tabs.warnOnClose" = false;
        "browser.aboutConfig.showWarning" = false;
      };

      ExtensionSettings = mkExtensionSettings {
        "uBlock0@raymondhill.net" = mkExtensionEntry {
          id = "ublock-origin";
          pinned = true;
        };
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = mkExtensionEntry {
          id = "bitwarden-password-manager";
          pinned = true;
        };
        "addon@darkreader.org" = mkExtensionEntry {
          id = "darkreader";
          pinned = true;
        };
        "CookieAutoDelete@kennydo.com" = mkExtensionEntry {
          id = "cookie-autodelete";
          pinned = true;
        };
        # "{20fc2e06-e3e4-4b2b-812b-ab431220cada}" = "startpage-private-search";restore
        "{74145f27-f039-47ce-a470-a662b129930a}" = "clearurls";
        "{85860b32-02a8-431a-b2b1-40fbd64c9c69}" = "github-file-icons";
      };
    };
    profiles.default = {
      mods = [
        "c01d3e22-1cee-45c1-a25e-53c0f180eea8" # Ghost Tabs 
        "4ab93b88-151c-451b-a1b7-a1e0e28fa7f8" # No Sidebar Scrollbar
        "2317fd93-c3ed-4f37-b55a-304c1816819e" # Audio Indicator Enhanced
        "4a222d82-2803-4ed2-a390-90abfce4f195" # Back Fwd Always Hidden 
      ];
      search = {
        force = true; # Enforce declared search engines on each rebuild
        default = "startpage";
        engines = {
          startpage = {
            name = "Startpage";
            urls = [
              {
                template = "https://startpage.com/sp/search?query={searchTerms}";
                params = [
                  # {
                  #   name = "query";
                  #   value = "searchTerms";
                  # }
                ];
              }
            ];
            definedAliases = [ "@startpage" "@sp" ];
          };
          mynixos = {
            name = "My NixOS";
            urls = [
              {
                template = "https://mynixos.com/search?q={searchTerms}";
                params = [
                  {
                    name = "query";
                    value = "searchTerms";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@nx" ];
          };
          nixpkgs = {
              name = "Nix Package Search";
            urls = [
              {
                template = "https://search.nixos.org/packages?query={searchTerms}";
                params = [
                  # {
                  #   name = "query";
                  #   value = "searchTerms";
                  # }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };
          nixopt = {
              name = "Nix Options Search";
            urls = [
              {
                template = "https://search.nixos.org/options?query={searchTerms}";
                params = [
                  # {
                  #   name = "query";
                  #   value = "searchTerms";
                  # }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@no" ];
          };
        };
      };
      settings = {
        "zen.window-sync.enabled" = false;
        "zen.welcome-screen.seen" = true;
        "zen.view.use-single-toolbar" = false;
        "geo.enabled" = false;
        "browser.toolbars.bookmarks.visibility" = "always";
        "browser.startup.page" = "1";
      };
      bookmarks = { 
        force = true; # true = Rewrite bookmarks on each rebuild (overwrite browser changes)
        settings = [
          {
            name = "Nix Sites";
            toolbar = true;
            bookmarks = [
              {
                name = "packages";
                url = "https://search.nixos.org/packages";
              }
            ];
          }
          {
            name = "My Crap";
            toolbar = true;
            bookmarks = [
              {
                name = "Proton Mail";
                url = "https://mail.proton.me/u/1/inbox";
              }
              {
                name = "Proton Calendar";
                url = "https://calendar.proton.me/u/1";
              }
            ];
          }
        ];
      };
    };
  };
}

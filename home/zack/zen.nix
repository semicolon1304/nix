{ inputs, ... }:
let
  # mkLockedAttrs = builtins.mapAttrs (
  #   _: value: {
  #     Value = value;
  #     Status = "locked";
  #   }
  # );

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
  programs.zen-browser = {
    policies = {
      ExtensionSettings = mkExtensionSettings {

        "@buyee-cart-extension" = "add-to-buyee";
        "{8927f234-4dd9-48b1-bf76-44a9e153eee0}" = "better-canvas";
        "tasksforcanvas@jtchengdev.com" = "tasks-for-canvas";
        "{cb31ec5d-c49a-4e5a-b240-16c767444f62}" = "indie-wiki-buddy";
        "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = "return-youtube-dislikes";
        "sponsorBlocker@ajay.app" = "sponsorblock";
        "firefox@tampermonkey.net" = "tampermonkey";
      };
    };
    profiles.default = {
      bookmarks = {
        settings = [
          {
            name = "School";
            toolbar = true;
            bookmarks = [
              {
                name = "Canvas Dashboard";
                url = "https://auburn.instructure.com";
              }
              {
                name = "AUAccess";
                url = "https://experience.elluciancloud.com/auburn/discover";
              }
            ];
          }
        ];
      };
    };
  };
}

{pkgs, lib, ...}: let
  font-name = "MesloLGS NF";
  font-pkg = pkgs.meslo-lgs-nf;
in {
  programs.kitty = {
    enable = true;
    themeFile = lib.mkDefault "gruvbox-dark";
    shellIntegration.enableBashIntegration = true;
    shellIntegration.enableZshIntegration = true;
    font.package = font-pkg;
    font.name = font-name;
    font.size = lib.mkDefault 12;
    quickAccessTerminalConfig = {
      lines = lib.mkDefault 5;
      background_opacity = lib.mkDefault 0.9;
    };
    keybindings = {
      "super+shift+enter" = "new_os_window_with_cwd";
    };
  };
}

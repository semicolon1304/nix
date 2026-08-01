{ inputs, pkgs, lib, ... }:
{
  # TODO: this later
  wayland.windowManager.hyprland = {
    enable = true;
    # systemd.enable = true;
    configType = "lua";
    extraConfig = builtins.readFile ./hypr/hyprland.lua;
      # ${builtins.readFile ./hypr/configs/animations.lua}
      # ${builtins.readFile ./hypr/configs/autostart.lua}
      # ${builtins.readFile ./hypr/configs/env.lua}
      # ${builtins.readFile ./hypr/configs/keybinds.lua}
      # ${builtins.readFile ./hypr/configs/monitors.lua}
      # ${builtins.readFile ./hypr/configs/settings.lua}
      # ${builtins.readFile ./hypr/configs/windowrules.lua}
      # ${builtins.readFile ./hypr/configs/workspaces.lua}
  };
}
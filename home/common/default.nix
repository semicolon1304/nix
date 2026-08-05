{ lib, pkgs, ... }:
{
  imports = [
    ./zsh.nix
    ./kitty.nix
    ./vscodium.nix
    ./zen.nix
    ./noctalia.nix
    ./hyprland.nix
    ./theme.nix
  ];

  # USB Automount
  services.udiskie = {
    enable = true;
    settings = {
      # workaround for
      # https://github.com/nix-community/home-manager/issues/632
      program_options = {
        # replace with your favorite file manager
        file_manager = "${pkgs.nautilus}/bin/nautilus";
      };
    };
    tray = "never";
    notify = false;
  };
  xdg.userDirs.createDirectories = true;


}

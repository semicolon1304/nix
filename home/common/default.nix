{ lib, pkgs, ... }:
{
  imports = [
    ./zsh.nix
    ./kitty.nix
    ./vscodium.nix
    ./zen.nix
    ./noctalia.nix
    ./hyprland.nix
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
  };
  xdg.userDirs.createDirectories = true;


}

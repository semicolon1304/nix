{ pkgs, lib, ... }:
let
  cursor-name = "Bibata-Modern-Classic";
  cursor-pkg = pkgs.bibata-cursors;
  icon-name = "kora";
  icon-pkg = pkgs.kora-icon-theme;
in
{
  home.pointerCursor = {
    enable = true;
    hyprcursor.enable = true;
    gtk.enable = true;
    x11.enable = true;
    package = cursor-pkg;
    name = cursor-name;
    size = lib.mkDefault 24;
  };

  gtk = {
    enable = true;
    theme = {
        name = "Adwaita-dark";
        package = pkgs.gnome-themes-extra;
    };
    cursorTheme = {
      name = cursor-name;
      package = cursor-pkg;
    };

    iconTheme = {
      name = icon-name;
      package = icon-pkg;
    };

    gtk3.extraConfig = {
      "gtk-cursor-theme-name" = cursor-name;
      "gtk-icon-theme-name" = icon-name;
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-cursor-theme-name=${cursor-name}
        gtk-icon-theme-name=${icon-name}
      '';
    };
  };
  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style.name = "adwaita-dark";
  };


}

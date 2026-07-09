{config, lib, pkgs, inputs, ...}: {
  imports = [
    ./hardware-configuration.nix
    #   ../common/default.nix
    ../common
  ];

  # swapDevices = [
  #   {
  #     device = "/swapfile";
  #     size = 8 * 1024;
  #   }
  # ];

  networking.hostName = "forward-onto-dawn";
  # Nix settings

  # Services
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  # services.pulseaudio.enable = true;
  services.libinput.enable = true; # Touchpad

  # Define a user account. Don't forget to set a password with ‘passwd’.


  # Programs and packages and whatnot?

  # Packages

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
}

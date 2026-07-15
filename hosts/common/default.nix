{config, lib, pkgs, inputs, ...}: {
  imports = [
    ./packages.nix
  ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Networking
  networking.networkmanager.enable = true;
  networking.wireless.enable = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;
  services.displayManager.gdm.enable = true;
  services.printing.enable = true;
  services.tailscale.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
  users.users.zack = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };
  services.displayManager.defaultSession = "hyprland";
  system.stateVersion = "26.05"; # Did you read the comment?
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}

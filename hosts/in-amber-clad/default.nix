{ config, lib, pkgs, inputs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../common
  ];

  grub.device = "/dev/nvme0n1p1";
  distro-grub-themes = {
    enable = true;
    theme = "asus-rog";
  };

  # networking.networkmanager.enable = true;
  # services.openssh = {
  #   enable = true;
  #   openFirewall = true;
  #   settings = {
  #     PasswordAuthentication = false;
  #     KbdInteractiveAuthentication = false;
  #     PermitRootLogin = "no";
  #     AllowUsers = [ "myUser" ];
  #     MaxAuthTries = 3;
  #     PerSourcePenalties = "crash:3600s authfail:3600s max:86400s";
  #   };
  # };
  networking.hostName = "in-amber-clad";

  # Graphics 
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;
    powerManagement.enable = true;
    powerManagement.finegrained = true;
  };
  services.xserver.videoDrivers = [ "nvidia" ];

  # Nix settings

  # Services
  
}

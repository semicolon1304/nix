{pkgs, inputs, ...}: {

  programs.steam.enable = true;
  programs.hyprland.enable = true; # Move to hyprland.nix
  programs.zsh.enable = true;
  programs.git.enable = true;
  programs.neovim.enable = true;
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/zack/nix"; # sets NH_OS_FLAKE variable for you
  };

  environment.systemPackages = with pkgs; [
    # Essentials
    kitty
    nautilus
    fastfetch
    home-manager
    brightnessctl
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    # zsh-powerlevel10k # may not need this

    # Terminal Utilities
    btop
    pokemon-colorscripts
    micro
    # meslo-lgs-nf # Font, no other fonts yet tho

    # Programming
    python3
    dotnet-aspnetcore
    jdk
    rustc
    cargo
    jetbrains.rider
    #jetbrains.idea-oss
    #jetbrains.rust-rover
    nixd
    nixpkgs-fmt

    # ...Networking?
    proton-vpn
    tailscale

    # A/V
    evince # Document viewer
    loupe # Image viewer
    mpv # Video player
    ffmpeg
    handbrake

    # Move to hyprland.nix
    noctalia-shell

    vesktop
  ];
}

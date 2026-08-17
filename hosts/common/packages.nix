{ pkgs, inputs, ... }: {

  programs.steam.enable = true;
  programs.hyprland.enable = true; # Move to hyprland.nix
  programs.zsh.enable = true;
  programs.git.enable = true;
  programs.neovim.enable = true;
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/zack/nix"; # sets NH_OS_FLAKE variable for you
  };
  fonts.packages = with pkgs; [
    source-sans
  ];

  # nix.settings = {
  #   extra-substituters = [ "https://noctalia.cachix.org" ];
  #   extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
  # };

  environment.systemPackages = with pkgs; [
    # Essentials
    kitty
    nautilus
    nautilus-open-any-terminal
    sushi # Preview for nautilus
    pcmanfm
    fastfetch
    home-manager
    brightnessctl
    
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default

    # Terminal Utilities
    btop
    pokemon-colorscripts
    micro
    file
    killall
    busybox

    # Dangerous Hacking Tools
    nmap
    burpsuite
    hashcat
    zbar
    imhex
    netcat

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
    android-tools

    # Games
    prismlauncher
    archipelago
    poptracker
    protontricks
    lumafly

    # ...Networking?
    proton-vpn
    tailscale
    dnsmasq # Needed for vm
    qbittorrent

    # A/V?
    evince # Document viewer
    loupe # Image viewer
    mpv # Video player
    ffmpeg
    # freac
    # flac
    # lame
    # Handbrake
    (writeShellApplication {
      name = "handbrake";
      text = ''
        LD_LIBRARY_PATH=/run/opengl-driver/lib:''${LD_LIBRARY_PATH-} ${pkgs.handbrake}/bin/ghb "$@"
      '';
    })
  
    gapless # Maybe just for in-amber-clad
    calibre
    imagemagick

    # Communication
    vesktop
    teams-for-linux

    # Misc
    inputs.iloader.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    hyprshot
    obsidian
    bleachbit
    wine
    winetricks
    # brlaser # printer
  ];

  services.flatpak = {
    enable = true;
    packages = [
      "xyz.rust4diva.Rust4Diva"
      "org.freac.freac"
    ];
  };
}

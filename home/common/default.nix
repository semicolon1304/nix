{lib, pkgs, ...}:
{
    imports = [
        ./zsh.nix
        ./kitty.nix
        ./vscodium.nix
        ./zen.nix
        ./noctalia.nix
    ];
    xdg.userDirs.createDirectories = true;
}
{lib, pkgs, ...}:
{
    imports = [
        ../common
        ./zen.nix
        ./vesktop.nix
    ];
    home = {
        # packages = with pkgs; [
        #     hello
        # ];
        
        username = "zack";
        homeDirectory = "/home/zack";
        
        stateVersion = "26.05";
    };
}
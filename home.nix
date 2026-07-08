{lib, pkgs, ...}:
{
    home = {
        # packages = with pkgs; [
        #     hello
        # ];
        
        username = "zack";
        homeDirectory = "/home/zack";
        
        stateVersion = "26.05";
    };
}
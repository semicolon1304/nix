{
    description = "WHAT THE FUCK IS A FLAKE (to the tune of 'WHAT THE FUCK IS A KILOMETER')";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-26.05";
        zen-browser.url = "github:youwen5/zen-browser-flake";
    };
    
    outputs = {self, nixpkgs, ...}@inputs:  
        let 
            lib = nixpkgs.lib;
        in {
            nixosConfigurations = {
                forward-onto-dawn = lib.nixosSystem {
                    system = "x86_64-linux";
                    specialArgs = {inherit inputs;};    
                    modules = [./configuration.nix];
                };
            };
        };
}
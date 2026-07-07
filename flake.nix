{
    description = "WHAT THE FUCK IS A FLAKE (to the tune of 'WHAT THE FUCK IS A KILOMETER')";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-26.05";
        # nixpkgs-unstable.url = "nixpkgs/nixos-unstable;

    };
    
    outputs = {self, nixpkgs, ...}:
        let 
            lib = nixpkgs.lib;
        in {
            nixosConfigurations = {
                forward-onto-dawn = lib.nixosSystem {
                    system = "x86_64-linux";
                    modules = [./configuration.nix];
                };
            };
        };
}
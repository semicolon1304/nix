{
  description = "WHAT THE FUCK IS A FLAKE (to the tune of 'WHAT THE FUCK IS A KILOMETER')";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:youwen5/zen-browser-flake";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixos-hardware,
    ...
  } @ inputs: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    nixosConfigurations = {
      forward-onto-dawn = lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs system;};
        modules = [
            ./hosts/forward-onto-dawn
            nixos-hardware.nixosModules.framework-16-7040-amd
        ];
      };
    };

    homeConfigurations = {
      zack = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [./home/zack];
      };
    };
  };
}

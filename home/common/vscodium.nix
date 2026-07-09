{ lib, pkgs, inputs, ... }: {
  nixpkgs.overlays = [inputs.nix-vscode-extensions.overlays.default];
  programs.vscodium = {
    enable = true;
    package = pkgs.vscodium;

    profiles.default = {
      extensions = with pkgs.vscode-marketplace; [
        bbenoist.nix
        ms-python.python
        yusifaliyevpro.vscicons
        vscodevim.vim
        kamadorueda.alejandra
        jdinhlife.gruvbox
        arrterian.nix-env-selector
        jnoortheen.nix-ide
      ];
      userSettings = {
        "terminal.integrated.fontFamily" = "MesloLGS NF";
        "files.autoSave" = "afterDelay";
        "workbench.iconTheme" = "icons";
        "workbench.colorTheme" = "Gruvbox Dark Hard";
        "explorer.confirmDragAndDrop" = false;
        "mutableExtensionsDir" = false;
      };
    };
  };
}

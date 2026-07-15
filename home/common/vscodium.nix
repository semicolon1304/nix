{ lib, pkgs, inputs, ... }: {
  nixpkgs.overlays = [ inputs.nix-vscode-extensions.overlays.default ];
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
        johnnymorganz.stylua
      ];
      userSettings = {
        "terminal.integrated.fontFamily" = "MesloLGS NF";
        "files.autoSave" = "afterDelay";
        "workbench.iconTheme" = "icons";
        "workbench.colorTheme" = "Gruvbox Dark Hard";
        "explorer.confirmDragAndDrop" = false;
        "explorer.confirmDelete" = false;
        "mutableExtensionsDir" = false;
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
        "nix.formatterPath" = "nixpkgs-fmt";

        # Optional: Enable auto-formatting on saving Nix files
        "[nix]" = {
          "editor.defaultFormatter" = "jnoortheen.nix-ide";
          "editor.formatOnSave" = true;
        };

        # Advanced: Give nixd context about your flake to enable Home Manager option completion
        "nix.serverSettings" = {
          "nixd" = {
            "formatting" = {
              "command" = [ "nixpkgs-fmt" ];
            };
          };
        };
      };
      keybindings = [
        {
          key = "shift+alt+down";
          command = "editor.action.copyLinesDownAction";
          when = "editorTextFocus && !editorReadonly";
        }
      ];
    };
  };
}

{
  lib,
  pkgs,
  ...
}: {
  programs.vscodium = {
    enable = true;
    package = pkgs.vscodium;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        bbenoist.nix
        ms-python.python
        vscode-icons-team.vscode-icons
        vscodevim.vim
        kamadorueda.alejandra
        jdinhlife.gruvbox
      ];
      userSettings = {
        "terminal.integrated.fontFamily" = "MesloLGS NF";
        "files.autoSave" = "afterDelay";
        "workbench.iconTheme" = "vscode-icons";
        "workbench.colorTheme" = "Gruvbox Dark Hard";
      };
    };
  };
}

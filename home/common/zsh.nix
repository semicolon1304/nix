{
  lib,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = "source ~/.p10k.zsh";
    
    shellAliases = {
      ll = "ls -l";
      la = "ls -a";
      vi = "nvim";
      vim = "nvim";
      nano = "micro";
      ff = "fastfetch";
      neofetch = "fastfetch";
    };

    history.size = 10000;

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
  };
}

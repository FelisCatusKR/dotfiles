{ config, pkgs, ... }:

{
  # TODO please change the username & home directory to your own
  home.username = "felis";
  home.homeDirectory = "/home/felis";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them
    bat
    fastfetch
  ];

  programs.git = {
    enable = true;
    userName = "Hansaem Woo";
    userEmail = "me@felis.kr";
    extraConfig.init.defaultBranch = "main";
  };

  programs.tmux = {
    enable = true;
    shell = "${pkgs.fish}/bin/fish";
    terminal = "tmux-256color";
    historyLimit = 100000;
    clock24 = true;
    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      {
        plugin = dracula;
        extraConfig = ''
          set -g @dracula-plugins "cpu-usage ram-usage weather"
	  set -g @dracula-show-battery false
          set -g @dracula-show-powerline true
	  set -g @dracula-military-time true
          set -g @dracula-refresh-rate 10
	  set -g @dracula-show-fahrenheit false
          set -g @dracula-show-location false
        '';
      }
    ];

    # extraConfig = ''
    #   set -g mouse on
    # '';
  };

  programs.fish = {
    enable = true;
    plugins = [
    ];
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;

  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
  };
}

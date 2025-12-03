{ config, lib, pkgs, nixvim, ... }:

{
  imports = [
    #./nvim.nix
    ./vim.nix
  ];
  
  home.username = "dilly";
  home.homeDirectory = "/home/dilly";
  
  home.packages = with pkgs; [
    neofetch
    ripgrep
    cowsay
    nnn
    fzf
    fd
  ];

  # programs.vim = {
  #   enable = true;
  #   extraConfig = ''
  #     syntax on
  #     set number
  #     "set cursorline
  #     "set cursorcolumn"
  #     set tabstop=4
  #     "set expandtab
  #     set smartindent
  #     set relativenumber
  #     set nowrap
  #     "set visualbell
  #     set noerrorbells
  #     set colorcolumn=80
  #     set scrolloff=8
  #     set sidescrolloff=3
  #     set encoding=utf-8
  #     "set title
  #     "set spell
  #     
  #     "search commands
  #     set incsearch
  #     set ignorecase
  #     set smartcase
  #     set showcmd
  #     set showmode
  #     set showmatch
  #     "set hlsearch
  #     set history=1000
  #     
  #     "Enable auto completion menu after pressing TAB.
  #     set wildmenu
  #     "Make wildmenu behave like similar to Bash completion.
  #     set wildmode=list:longest
  #     " There are certain files that we would never want to edit with Vim. " Wildmenu will ignore files with these extensions.
  #     set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
  #     
  #     if has('mouse')
  #         set mouse=a
  #     endif 
  #   '';
  # };
  
  programs.librewolf = {
    enable = true;
    #settings = {
    #};
    policies = {
      privacy.clearOnShutdown.history = false;
      privacy.clearOnShutdown.cookies = false;
      ExtensionSettings = {
        #"*".installation_mode = "blocked";
        # uBlockOrigin
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
          default_area = "navbar";
        };
        # Bitwarden
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
          default_area = "navbar";
        };
        # HTTPS Everywhere maybe later? discourse.nixos.org/t/declare-firefox-extensions-and-settings/36265
      };
    };
  };

  # programs.neovim = {
  #   enable = true;
  #   # extraConfig = lib.fileContents /home/dilly/.config/nvim/init.lua;
  #   viAlias = true;
  #   vimAlias = true;
  # };
  # programs.nixvim = {
  #   enable = true;
  #   globals.mapleader = " ";

  #   # colorscheme
  #   # colorschemes.onedark = {
  #   #   enable = true;
  #   #   settings.style = "dark";
  #   # };

  #   # plugins
  #   plugins.web-devicons.enable = false;
  #   plugins.lualine.enable = true;
  #   plugins.nix.enable = true;
  #   # plugins.treesitter.enable = true;
  #   # plugins.telescope.enable = true;
  #   # plugins.harpoon = {
  #   #   enable = true;
  #   #   keymaps.addFile = "<leader>a";
  #   # };
  #   plugins.lsp = {
  #     keymaps = {
  #       silent = true;
  #       diagnostic = {
  #         "<leader>k" = "goto_prev";
  #         "<leader>j" = "goto_next";
  #       };

  #       lspBuf = {
  #         gd = "definition";
  #         K = "hover";
  #       };
  #     };
  #   };
  # };

  programs.kitty = lib.mkForce {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
	  shell_integration = true;
	  shell = "fish";
	  color0 =  "#1c2023";
	  color1 =  "#c7ae95";
	  color2 =  "#95c7ae";
	  color3 =  "#aec795";
	  color4 =  "#ae95c7";
	  color5 =  "#c795ae";
	  color6 =  "#95aec7";
	  color7 =  "#c7ccd1";
	  color8 =  "#747c84";
	  color9 =  "#c7ae95";
	  color10 = "#95c7ae";
	  color11 = "#aec795";
	  color12 = "#ae95c7";
	  color13 = "#c795ae";
	  color14 = "#95aec7";
	  color15 = "#f3f4f5";
    };
  };

  programs.git = {
    enable = true;
    settings.user.name = "dilly";
    settings.user.email = "dylanjones6@protonmail.com";
    settings.init.defaultBranch = "main";
  };
  
  home.stateVersion = "25.05";
}

{ config, inputs, lib, pkgs, ... }:


let
  pixel = pkgs.vimUtils.buildVimPlugin {
    name = "pixel.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "bjarneo";
      repo = "pixel.nvim";
      rev = "fd06541f7c790e22ad18f0ee5873b246de5b4a87";
      hash = "sha256-D4o5IkLsW4iq6ceeCHKHCNwxVpEV8fYPbpms+J7ZcJQ=";
    };
  };
in
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      #vim-plug
      lightline-vim
      pixel
    ];
    extraConfig = ''

      syntax on
      set number
      "set cursorline
      "set cursorcolumn"
      set tabstop=4
      "set expandtab
      set smartindent
      set relativenumber
      set nowrap
      "set visualbell
      set noerrorbells
      set colorcolumn=80
      set scrolloff=8
      set sidescrolloff=5
      set encoding=utf-8
      "set title
      "set spell

      ""set background=dark
      ""set termguicolors=false
      colorscheme pixel
      set background=dark
      ""set termguicolors=true
      
      "search commands
      set incsearch
      set ignorecase
      set smartcase
      set showcmd
      set showmode
      set showmatch
      "set hlsearch
      set history=1000
      
      "Enable auto completion menu after pressing TAB.
      set wildmenu
      "Make wildmenu behave like similar to Bash completion.
      set wildmode=list:longest
      " There are certain files that we would never want to edit with Vim. " Wildmenu will ignore files with these extensions.
      set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
      
      if has('mouse')
          set mouse=a
      endif
    '';
  };
}

{ config, inputs, lib, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
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

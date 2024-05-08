{ pkgs, ... }:
{
  environment.variables = { EDITOR = "vim"; };

  environment.systemPackages = with pkgs; [
    ((vim_configurable.override {  }).customize{
      name = "vim";
      # Install plugins for example for syntax highlighting of nix files
      vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
        start = [ vim-nix vim-lastplace vim-airline ];
        opt = [];
      };
      vimrcConfig.customRC = ''
	" enable VIM features first
	set nocompatible
	
	" Idention
	set autoindent
	set filetype=indent
	set shiftround
	set shiftwidth=2
	set smarttab
	set tabstop=2
	
	" Search options
	set hlsearch
	set ignorecase
	set incsearch
	set smartcase
	
	" Text rendering 
	set display+=lastline
	"set encoding=utf-8
	set linebreak
	set scrolloff=2
	set sidescrolloff=5
	syntax enable
	set wrap
	"set list listchars=tab:>-,trail:·
	
	" User Interface
	set hidden
	set laststatus=2
	set ruler
	set wildmenu
	set number
	set relativenumber
	set noerrorbells
	set visualbell
	set mouse=a
	set title
	set background=dark

	" Code Folding
	set foldmethod=indent
	set foldnestmax=3
	set nofoldenable
	      '';
    }
  )];
}

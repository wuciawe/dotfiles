set clipboard=unnamedplus

let g:powerline_pycmd="py3"

set laststatus=2
set t_Co=256
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

colorscheme zenburn
set listchars=eol:¬,trail:~,extends:>,precedes:<,tab:→→,space:·
set list

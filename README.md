# .vim

My vim files.

The `.vimrc` features a lot of comments which explain the different options in use, 
so go check it out.

> Note: Some features require VIM 7.3+ to work.


## Configuration

- Focus on JavaScript development with setup JSHint configuration / syntax checker
- Targets a German keyboard 

    - Umlauts are remapped to { \[ etc.
    - Sharp S is remapped to insert { } with a newline and auto placed cursor inbetween
    - Remapped Shift+3 (paragraph sign) to ESC

- Many shortcuts for movement commands (removing W from window movements)


## Plugins

- vim-powerline (custom fork)
- vim-easymotion
- vim-fugitive
- gundo.vim
- vim-less
- snipmate.vim
- vim-markdown
- ctrlp.vim


## Colorscheme

I'm using modified version of Symfony on a 256 color terminal. 

A tool called `convert.py` can be found in the repository root which converts 
any `256` colors colorscheme to a compatible GUI one. Just in case you like to 
make changes.

Running on Ubuntu with `Bitstream Vera Sans Mono`:

![Screenshot](https://raw.github.com/BonsaiDen/.vim/master/screen.png)


# Bindings

## Tmux
leader = C-a

1. Sessions
<leader>s = new session
<leader>t + C-s = list all sessions (tmux-tea)


2. Windows
<leader>w = new window
<leader>C-q = kill window
<leader>, = rename window

Movement:
<leader>h/l = left/right window


3. Pane
S-Enter = new vertical pane
M-Enter = new horizontal pane

Movement:
M-hjkl = left/down/up/right pane


## Nvim
leader = space

1. Sessions
<leader>s = menu sessions
- s = save session
- f = find session
- l = last session
- d = delete session


2. Buffers
<leader>n = new buffer (blank)
<leader>c = close buffer

Movement:
S-h/l = left/right buffer


3. Pane
| = new vertical pane
\ = new horizontal pane
<leader>q = delete pane

Movement:
C-hjkl = left/down/up/right pane


4. General
Movement:
(insert) M-hjkl = left/down/up/right character
(normal) M-hjkl = ignored (sended to manage `tmux panes`)

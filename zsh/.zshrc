# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH="$HOME/.local/bin:$PATH"
export JAVA_HOME=/usr/lib/jvm/default
export PATH=$JAVA_HOME/bin:$PATH

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
# export JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
# export PATH=$JAVA_HOME/bin:$PATH
# Gurobi 9.5 Local
export GUROBI_HOME="/home/rotrex/gurobi950/linux64/"
export PATH="${GUROBI_HOME}/bin:${PATH}"
export LD_LIBRARY_PATH="${GUROBI_HOME}/lib:${LD_LIBRARY_PATH}"
export QT_QPA_PLATFORM="wayland;xcb"
export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"
# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi
export EDITOR="nvim"
# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# ============ ALIASES ============
alias aclab="cd /home/rotrex/obsidian/General/US/2ºSoftware/2ºCuatri/src/AC"
alias cuatri="cd /home/rotrex/obsidian/General/US/2ºSoftware/2ºCuatri"
alias znvim="nvim /home/$USER/.zshrc"
alias tnvim="nvim /home/$USER/.tmux.conf.local"
alias tsource="tmux source-file /home/$USER/.tmux.conf"
alias anvim="nvim /home/$USER/.config/nvim"
alias zsource="source /home/$USER/.zshrc"
alias nvimplug="nvim /home/$USER/.config/nvim/"
alias ls="/usr/bin/lsd"
alias lsn="/usr/bin/ls"
alias ll="/usr/bin/lsd -l"
alias la="/usr/bin/lsd -a"
alias lla="/usr/bin/lsd -la"
alias cat="/usr/bin/bat"
alias catn="/usr/bin/cat"
#alias rars="java.exe -jar 'C:/Users/rodri/Desktop/obsidian/General/US/2ºSoftware/2ºCuatri/src/AC/practica1/rars1_6.jar' &"
alias rars="java -Dsun.java2d.uiScale=1.5 -jar /home/rotrex/obsidian/General/US/2ºSoftware/2ºCuatri/src/AC/rars1_6.jar &"
#alias glazeconf="cd /mnt/c/Users/rodri/.glzr/glazewm"
#alias glaze='cmd.exe /c start "" "C:\Program Files\glzr.io\GlazeWM\glazewm.exe" && clear'
alias upinstall="sudo pacman -Syu"
alias install="sudo pacman -S"
alias ia="ollama run deepseek-r1:8b"
alias lg="lazygit"
alias lg1="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all"
alias wsource="killall waybar && waybar &"
alias exd-edit="excalidraw-edit"
alias o="xdg-open"
alias q="qutebrowser"
alias t="tmux new-session -A -s home"

# ============ FUNCTIONS ============
function enviarBG() {
  zle -I
  exec {__oldstderr}>&2
  exec 2>/dev/null
  builtin kill -TSTP %%
  exec 2>&$__oldstderr
}

function traerFG() {
  zle -I
  exec {__oldstderr}>&2
  exec 2>/dev/null
  builtin fg
  exec 2>&$__oldstderr
}

function devNvim() {
  nvim /home/rotrex/rodrigo-castilla/
  zle reset-prompt
}

function hereNvim() {
  nvim </dev/tty
  zle reset-prompt
}

# fzf-absolute-path-widget() {
  # 1. Definimos rutas
  #local win_user="rodri"
  
  # 2. Comando Ultra-Rápido:
  # --threads 20: Usamos toda la potencia de tu i7.
  # --u: (Unrestricted) Busca en todo, pero combinado con --exclude es quirúrgico.
  #local cmd="fdfind . /mnt/c/Users/$win_user /home/$USER \
    #--threads 20 \
    #--hidden \
    #--follow \
    #--max-depth 12 \
    #--exclude '.git' \
    #--exclude 'node_modules' \
    #--exclude 'AppData/Local/Microsoft' \
    #--exclude 'AppData/Local/Google' \
    #--exclude 'AppData/Local/Temp' \
    #--exclude 'Downloads' \
    #--exclude 'Windows' 2>/dev/null"

  # 3. FZF con modo 'fuzzy' activado a tope
  #local selected=$(eval "$cmd" | fzf \
    #--header="Búsqueda Total (Modo Bestia 20 Hilos)" \
    #--height=40% \
    #--layout=reverse \
    #--tiebreak=length,end,index) # Esto da prioridad a nombres cortos y rutas exactas

  #if [ -n "$selected" ]; then
    #LBUFFER="${LBUFFER}${selected}"
  #fi
  #zle reset-prompt
# }

# fzf-absolute-path-widget() {
#  local es_path="/mnt/c/Program Files/Everything/es.exe"

#  local selected_win=$("$es_path" | fzf \
#    --header="Everything Engine (Modo CLI puro)" \
#    --height=40% \
#    --layout=reverse \
#    --info=inline)

#  if [ -n "$selected_win" ]; then
    # 1. Quitamos el retorno de carro (CR) de Windows usando Zsh puro, sin 'echo'
#    local clean_win_path="${selected_win%$'\r'}"
    
    # 2. Convertimos la ruta limpia al formato de Linux (/mnt/c/...)
#    local selected_linux=$(wslpath -u "$clean_win_path")

    # 3. ${(q)selected_linux} es un truco de Zsh que le pone comillas o barras 
    # a los espacios automáticamente para que rutas como "Program Files" no fallen.
#    LBUFFER="${LBUFFER}${(q)selected_linux} "
#  fi
#  zle reset-prompt
#}

catcp() {
    if [[ -z "$1" ]]; then
        echo "Uso: catcp <archivo>"
        return 1
    fi
    catn "$1" | xclip -sel clip
}

bind_zoxide ()
{
    LBUFFER="zi "
    zle accept-line
}

# ============ WIDGETS ==============
zle -N enviarBG
zle -N traerFG
zle -N devNvim
zle -N hereNvim
zle -N fzf-absolute-path-widget 
zle -N bind_zoxide

# ============ BINDS =============
bindkey '^[d' devNvim   # Alt+d -> development nvim
bindkey -s '^[n' 'nvim^M' # Alt+n -> nvim current directory
# bindkey '^X^F' fzf-absolute-path-widget
bindkey -r '^Z'
bindkey '^Z' bind_zoxide

# ============ MISC ==============
setopt MONITOR
setopt autocd
CDPATH=.:$HOME
setopt NO_NOTIFY
DISABLE_MAGIC_FUNCTIONS="true"
unset zle_bracketed_paste

# Integración de fzf instalada por apt
# source /usr/share/doc/fzf/examples/key-bindings.zsh
# source /usr/share/doc/fzf/examples/completion.zsh
eval "$(fzf --zsh)"

# --- CONFIGURACIÓN DE FZF PARA LINUX (ARCH) ---

# Esto arregla Ctrl+T: Busca archivos rápido saltándose lo innecesario
export FZF_CTRL_T_COMMAND="fd --type f --hidden --exclude .git --exclude .cache --exclude 'node_modules' --exclude '__pycache__'"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :50 {}'"

# Esto arregla Alt+C: Busca directorios rápido para saltar a ellos
export FZF_ALT_C_COMMAND="fd --type d --hidden --exclude .git --exclude .cache --exclude 'node_modules' . $HOME"
# export FZF_ALT_C_COMMAND="fd --type d --hidden --exclude .git --exclude .cache --exclude 'node_modules'"
export FZF_DEFAULT_COMMAND="fd --type f --hidden --exclude .git"

# Si quieres que Ctrl+T ponga la ruta en tu línea de comandos:
bindkey '^T' fzf-file-widget

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(zoxide init zsh)"

# Despertar a Ollama en segundo plano automáticamente si está dormido
# if ! pgrep -x "ollama" > /dev/null; then
#   nohup ollama serve >/dev/null 2>&1 &
# fi

# ============ CURSOR FIX ============
# Forzar el cursor de doble T (I-beam) parpadeante en la consola
function forzar_cursor_doblet() {
  printf '\e[5 q'
}
precmd_functions+=(forzar_cursor_doblet)

# Crear archivos de Excalidraw vacíos y válidos
exd-touch() {
    echo '{"type":"excalidraw","version":2,"source":"https://excalidraw.com","elements":[],"appState":{}}' > "$1"
}

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

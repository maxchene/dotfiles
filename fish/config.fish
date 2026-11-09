if status is-interactive
    # Commands to run in interactive sessions can go here
end
# TokyoNight Color Palette
set -l foreground c0caf5
set -l selection 33467C
set -l comment 565f89
set -l red f7768e
set -l orange ff9e64
set -l yellow e0af68
set -l green 9ece6a
set -l purple 9d7cd8
set -l cyan 7dcfff
set -l pink bb9af7

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment

# Some config
set -g fish_greeting ''

# Git config
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_showupstream informative
set -g __fish_git_prompt_showdirtystate yes
set -g __fish_git_prompt_char_stateseparator ' '
set -g __fish_git_prompt_char_cleanstate '✔'
set -g __fish_git_prompt_char_dirtystate '✚'
set -g __fish_git_prompt_char_invalidstate '✖'
set -g __fish_git_prompt_char_stagedstate '●'
set -g __fish_git_prompt_char_stashstate '⚑'
set -g __fish_git_prompt_char_untrackedfiles '?'
set -g __fish_git_prompt_char_upstream_ahead ''
set -g __fish_git_prompt_char_upstream_behind ''
set -g __fish_git_prompt_char_upstream_diverged ﱟ
set -g __fish_git_prompt_char_upstream_equal ''
set -g __fish_git_prompt_char_upstream_prefix ''''

#
set -gx XAUTHORITY $HOME/.Xauthority

# Directory abbreviations
abbr -a -g la 'ls -a'
#abbr -a -g ll 'ls -l'
#abbr -a -g lal 'ls -al'
abbr -a -g d dirs
abbr -a -g h 'cd $HOME'

# eza
alias ..="z .."
alias l="eza -l --icons --git -a"
alias ll="eza --color=always --long --git --time-style='+%d/%m/%Y %H:%M'"
alias lal="eza --color=always -a --long --git --time-style='+%d/%m/%Y %H:%M'"
alias lt="eza --tree --level=2 --long --icons --git"
alias ltree="eza --tree --level=2  --icons --git"

#helix
alias hx="helix ."
alias lg="lazygit"
alias lswifi="nmcli device wifi list --rescan yes"
alias qr="qrencode -m 2 -t utf8"
alias s="kitten ssh"

# Locale
export LANG="fr_FR.UTF-8"
export LC_ALL="fr_FR.UTF-8"

# Exports
export VISUAL="vim"
export EDITOR="$VISUAL"

# Term
if not set -q SSH_TTY
    set -gx TERM xterm-kitty
end

# User abbreviations
abbr -a -g ytmp3 'youtube-dl --extract-audio --audio-format mp3' # Convert/Download YT videos as mp3
abbr -a -g cls clear # Clear
abbr -a -g h history # Show history
abbr -a -g upd 'yay -Syu --noconfirm' # Update everything
abbr -a -g please sudo # Polite way to sudo
abbr -a -g fucking sudo # Rude way to sudo
abbr -a -g sayonara 'shutdown now' # Epic way to shutdown
abbr -a -g stahp 'shutdown now' # Panik - stonk man
abbr -a -g shinei 'kill -9' # Kill ala DIO
abbr -a -g kv 'kill -9 (pgrep vlc)' # Kill zombie vlc
abbr -a -g priv 'fish --private' # Fish incognito mode
abbr -a -g sshon 'sudo systemctl start sshd.service' # Start ssh service
abbr -a -g sshoff 'sudo systemctl stop sshd.service' # Stop ssh service
abbr -a -g untar 'tar -zxvf' # Untar
abbr -a -g genpass 'openssl rand -base64 20' # Generate a random, 20-charactered password
abbr -a -g sha 'shasum -a 256' # Test checksum
abbr -a -g cn 'ping -c 5 8.8.8.8' # Ping google, checking network
abbr -a -g ipe 'curl ifconfig.co' # Get external IP address
abbr -a -g ips 'ip link show' # Get network interfaces information
abbr -a -g wloff 'rfkill block wlan' # Block wlan, killing wifi connection
abbr -a -g wlon 'rfkill unblock wlan' # Unblock wlan, start wifi connection
abbr -a -g ff firefox #

# Source plugins
# Useful plugins: archlinux bang-bang cd colorman sudope vcs
if test -d "$HOME/.local/share/omf/pkg/colorman/"
    source ~/.local/share/omf/pkg/colorman/init.fish
end

# Make su launch fish
function su
    command su --shell=/usr/bin/fish $argv
end

# Get terminal emulator
set TERM_EMULATOR kitty

# Local bin
fish_add_path -p ~/.local/bin

# Flutter
fish_add_path -g -p ~/flutter/bin

# run starship prompt
starship init fish | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# pnpm
set -gx PNPM_HOME "/home/max/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
complete -c l -f

# sudo/ssh: graphical password prompt when no tty (e.g. from Claude Code / GUI)
set -gx SUDO_ASKPASS $HOME/.local/bin/askpass
set -gx SSH_ASKPASS $HOME/.local/bin/askpass

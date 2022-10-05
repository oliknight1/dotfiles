eval $(/opt/homebrew/bin/brew shellenv)
if status is-interactive
and not set -q TMUX
    exec tmux
end

function fish_greeting
  fish_logo blue cyan green
end

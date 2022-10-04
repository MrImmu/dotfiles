export TERM=xterm-256color
if ! tmux attach; then
  tmux -f ~/ni796/.tmux.conf
fi

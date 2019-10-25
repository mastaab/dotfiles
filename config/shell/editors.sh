if command -v code &>/dev/null; then # Use visual studio code when available
  q() {
    if command -v code &>/dev/null; then
      if [ $# -eq 0 ]; then
        code -r .
      else
        code -r "$@"
      fi
    elif command -v micro &>/dev/null; then
      micro "$@"
    else
      nano "$@"
    fi
  }
fi

if command -v micro &>/dev/null; then
  EDITOR=$(type micro nano pico | sed 's/ .*$//;q')
else
  EDITOR=$(type nano pico | sed 's/ .*$//;q')
fi

export EDITOR
LESSEDIT="$EDITOR %f" && export LESSEDIT
VISUAL="$EDITOR" && export VISUAL
m() { $EDITOR "$@"; }

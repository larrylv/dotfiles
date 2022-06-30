ref="$(/usr/local/bin/git -C $1 symbolic-ref -q HEAD 2>/dev/null)"
if [ -n "$ref" ]; then
  if [[ $(git -C $1 status --porcelain) != '' ]]; then
    printf "#[fg=default]#[fg=default]#[fg=red,bold]✗ "
  else
    printf "#[fg=default]#[fg=default]#[fg=cyan,bold]✔ "
  fi
fi

# Linux console OMZ theme

PROMPT='$(_host_name)%{$fg[cyan]%}%c $(_return_status)${_arrow} '

local _arrow="»"
# local _arrow="➜"

function _host_name() {
  local _nick="hp"
  # local _nick="vm"
  echo "%(!.%{$fg[red]%}.%{$fg[green]%})$_nick%{$reset_color%} "
}

function _return_status() {
  local _error="x"
  # local _error="⍉"
  echo "%{$fg[red]%}%(?..${_error} )%{$reset_color%}"
}

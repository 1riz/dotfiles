# Custom OMZ theme

prompt_host="%(!.%{$fg_bold[red]%}.%{$fg_bold[yellow]%})hp%{$reset_color%}"
prompt_arrow="%(?:%{$fg_bold[green]%}%1{»%} :%{$fg_bold[red]%}%1{»%} )%{$reset_color%}"

PROMPT="${prompt_host} %2~ ${prompt_arrow}"

unset prompt_host prompt_arrow

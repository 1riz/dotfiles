#!/bin/bash

# Based on https://gitlab.com/wef/dotfiles/-/blob/master/bin/sway-select-window

if [[ "${1}" == "list" ]]; then

  jq_get_windows='
    # descend to workspace or scratchpad
    .nodes[].nodes[]
    # save workspace name as .w
    | {"w": .name} + (
      if (.nodes|length) > 0 then # workspace
        [recurse(.nodes[])]
      else # scratchpad
        []
      end
      + .floating_nodes
      | .[]
      # select nodes with no children (windows)
      | select(.nodes==[])
    )'

  jq_windows_to_tsv='
    [
      (.id | tostring),
      (.app_id),
      ("— " + .name),
      ("[" + .w + "]" | sub("__i3_scratch"; "S"))
    ]
    | @tsv'

  swaymsg -t get_tree | jq -e -r "[ $jq_get_windows ] | .[] | $jq_windows_to_tsv "

else

  WIN_ID=$(< /dev/stdin)
  swaymsg "[con_id=${WIN_ID}]" focus

fi

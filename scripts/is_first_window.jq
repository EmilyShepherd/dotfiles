#!/usr/bin/env -S jq --args -ef

# Pull out all of the windows that match the requested class
[.[] | select(.class == $ARGS.positional[0])] | 

# Create a map of each workspace containing the matching window
# which is at the topmost left of the screen.
reduce .[] as $item (
  {};
  .[$item.workspace.name] =
    if .[$item.workspace.name] == null or .[$item.workspace.name].at > $item.at
      then $item
      else .[$item.workspace.name]
    end
) |

# Check if the current PID is found in any of the workplaces (in the
# topmost left)
any(.pid == ($ARGS.positional[1] | tonumber))

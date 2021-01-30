#!/bin/jq -f

# Get the children of the given container, by name
def children_of(f): select(.name==f) | .nodes[];

# Get the desired position from the arguments, or 0 if not set
def position:
    if $ARGS.named.pos
    then ($ARGS.named.pos | tonumber)
    else 0 end;

[
    [
        # The topmost container is the root, so we want to grab the
        # containers within that, which are the outputs (screens).
        .nodes[] |

        # Get the children of the output that is currently active (ie
        # the screen that is currently in focus).
        # This will return the list of workspaces on that output.
        children_of($active.output) |

        # Get the children of the workspace that is currently active (ie
        # the workspace that is currently in focus).
        # We also flatten this and pull out the containers.
        children_of($active.name) |
        .. |
        select(type=="object") |

        # Get the containers with no layout - these are actual windows
        # rather than the sway/i3 containers
        select(.layout=="none") |

        # Grab the information that we're interested in
        {
            # This is used to do the swap
            id,

            # We calculate the size because we're always interested in
            # the biggest one
            size: (.rect.width * .rect.height),

            # We also pic out the position, because if multiple windows
            # are the same size, we'll pick the left most one
            left: .rect.x
        }
    ]
    |
    # Calculate what the largest size is and then pick out all of the
    # windows of that size
    (max_by(.size) | .size) as $size | .[] | select(.size==$size)
]
|
# Of the largest, get the most left-er-ly window and finaly grab its id
sort_by(.left) | .[position].id

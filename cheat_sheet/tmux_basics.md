Prefix: Ctrl + B

## Panes
* Prefix + " -> Splits window vertically
* Prefix + % -> Splits window horizontally
* Prefix + arrow_keys -> swithcing panes
* Prefix + z -> zoom current pane

### Resizing panes
* Prefix + Ctrl (pressed) + arrow_keys -> Increase/decrease length/breadth of current pane.


## Windows
* Prefix + c -> creates a new window
* Prefix + n -> opens next window
* Prefix + p -> opens previous window
* Prefix + w -> shows number of windows
* Prefix + number -> opens nth number window
* Prefix + , -> reanmes current window
* Prefix + $ -> renames current session
* Prefix + & -> deleting a window

## Session
* tmux new-session -t session_name -> creates a session with name (recommended) 
* tmux new -> creates a session without a name (not recommended)
* tmux ls / Prefix + s -> lists all sessions
* Prefix + d -> detach session
* tmux attach-session -t session_name -> attach session
* Prefix + : + kill-session -> quit a session

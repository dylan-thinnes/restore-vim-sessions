A simple session tracking vim script.

First, source in `track-sessions.vim` to register `SaveSess` and `ClearSess`.

When you're in a vim instance, `SaveSess` constantly saves the session to a
session file in a directory `$HOME/.vim-sessions` (this directory needs to be
created beforehand for the scripts to work).

If vim is closed normally, the session file is deleted using `ClearSess`. On the
other hand, if vim is closed abnormally (killed, or system shutdown), the
session file is not deleted.

Running `restore-sessions` recreates each session available in `$HOME/.vim-sessions`
by launching a kitty terminal with vim which uses each session file. Optionally,
you can pass an argument to `restore-sessions` to specify a session to recreate.
When a session is restored, the session file it was recreated from is deleted
and a new session takes its place.

This way, after a system shutdown or vim being killed, you can recreate any
in-progress vim instances by launching `restore-sessions`.

TODO: Currently, `restore-sessions` will also restore sessions that are still
running. We should identify which session files correspond to instances of vim
that are no longer running, and only restore those.

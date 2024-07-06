# davinci-resolve-timetracker

> Simple time tracker for DaVinci Resolve

## What does this do?

After starting the script it keeps track of your current "tool" (cut, edit, color...),
and when you switch to another tool, writes seconds spent in that tool to the csv file.
Timestamp, name of project, tool and secods are saved.

From there you can do whatever visualisation, sums, aggregations you wish.

## How to use

1. set path in `time_tracker.lua` to file where you want to log your time `"/path/to/my/resolve_log.csv"`
2. copy the file to fusion scripts location, based on you system:
   - Mac OS X:
     - `/Users/<UserName>/Library/Application Support/Blackmagic Design/DaVinci Resolve/Fusion/Scripts/Utils`
       Windows:
     - `%APPDATA%\Roaming\Blackmagic Design\DaVinci Resolve\Support\Fusion\Scripts\Utils`
       Linux:
     - `$HOME/.local/share/DaVinciResolve/Fusion/Scripts/Utils`
3. Run Resolve
4. Run `Workspace > Scripts > time_tracker` (script doesn't start on it's own), but you can assing a keyboard shortcut to it, and

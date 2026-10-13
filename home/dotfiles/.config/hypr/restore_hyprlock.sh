#!/usr/bin/env bash
hyprctl --instance 0 'eval hl.config({ misc = { allow_session_lock_restore = 1, }})';
hyprctl --instance 0 'eval hl.exec_cmd("hyprlock")'

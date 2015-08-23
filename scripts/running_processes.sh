#!/bin/bash

ps aux 2>&1 | \
    grep -v '/System' | \
    grep -v '/usr/libexec' | \
    grep -v '/sbin/' | \
    grep -v 'ps aux' | \
    grep -v 'sysmond\|autofsd\|ssh-agent\|automountd\|SFLSharedPrefsTo\|AppleCameraAssistant\|corestoragehelperd\|Terminal' | \
    grep -v 'login -pf' | \
    grep -v ' -zsh' | \
    grep -v 'ssh.*mux' | \
    grep -v $0

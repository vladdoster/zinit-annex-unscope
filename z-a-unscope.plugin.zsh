# -*- mode: sh; sh-indentation: 4; sh-basic-offset: 4; -*-

# Copyright (c) 2020 Sebastian Gniazdowski
# License MIT

# According to the Zsh Plugin Standard:
# http://zdharma.org/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html

0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

typeset -gA Zinit_Annex_Unscope
Zinit_Annex_Unscope[0]="$0" Zinit_Annex_Unscope[repo-dir]="${0:h}"

autoload -Uz ∧za-unscope-before-load-handler \
    ∧za-unscope-cmd-help-handler \
    ∧za-unscope-cmd \
    .za-unscope-dynamic

# An empty stub to fill the help handler fields
∧za-unscope-help-null-handler() { :; }

@zinit-register-annex "z-a-unscope" \
    hook:before-load-5 \
    ∧za-unscope-before-load-handler \
    ∧za-unscope-help-null-handler \
    "dynamic-unscope''" # New ices

@zinit-register-annex "z-a-unscope" \
    subcommand:unscope \
    ∧za-unscope-cmd \
    ∧za-unscope-cmd-help-handler

# The hash that holds mappings of the unscoped plugin names to the
# scoped ones, and also the nick-names that map to the same, however
# are different in that they're not just stripped GitHub user name
# (i.e.: unscoped), but in general free names.

typeset -gA Zinit_Annex_Unscope_Mappings

Zinit_Annex_Unscope_Mappings=(
    # zdharma/null
    "1.   null"				"zdharma/null 0"

    # z-a-as-monitor
    "2.   as-monitor"			"zinit-zsh/z-a-as-monitor 0"
    "3.   monitor"			"zinit-zsh/z-a-as-monitor 0"
                                         
    # z-a-patch-dl                     
    "4.   patch-dl"			"zinit-zsh/z-a-patch-dl 0"
                                         
    # z-a-rust                         
    "5.   rust"				"zinit-zsh/z-a-rust 0"
                                         
    # z-a-bin-gem-node                 
    "6.   bin-gem-node"			"zinit-zsh/z-a-bin-gem-node 0"
    "7.   bgn"				"zinit-zsh/z-a-bin-gem-node 0"
                                
    # zsh-syntax-highlighting  
    "8.  z-sy-h"		        "zdharma/zsh-syntax-highlighting 0"

    # fast-syntax-highlighting  
    "9.  f-sy-h"		        "zdharma/fast-syntax-highlighting 0"
    "10.  fsh"				"zdharma/fast-syntax-highlighting 0"

    # history-search-multi-word
    "11.  hsmw"				"zdharma/history-search-multi-word 0"

    # Prezto archive
    "12.  archive"			"PZTM::archive 1"
    "13.  arch"				"PZTM::archive 1"

    # Prezto directory
    "14.  directory"			"PZTM::directory 1"
    "15.  dir"				"PZTM::directory 1"

    # Prezto environment
    "16.  environment"			"PZTM::environment 1"
    "17.  env"				"PZTM::environment 1"

    # Prezto utility
    "18.  utility"			"PZTM::utility 1"
    "19.  util"				"PZTM::utility 1"

    # ZUI
    "20.  zui"				"zdharma/zui 0"
    "21.  ZUI"				"zdharma/zui 0"

    # Zconvey
    "20.  zconv"			"zdharma/zconvey 0"

    # Zbrowse
    "21.  zbrowse"			"zdharma/zbrowse 0"

    # zsh-autosuggestions
    "22.  autosuggestions"		"zsh-users/zsh-autosuggestions 0"
    "23.  autosug"			"zsh-users/zsh-autosuggestions 0"
)

# vim:ft=zsh:tw=80:sw=4:sts=4:noet

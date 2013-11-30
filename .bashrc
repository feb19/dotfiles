export PATH=$PATH:/Applications/Adobe\ Flash\ Builder\ 4.6/sdks/4.6.0/bin
export PATH=$PATH:$HOME/Android\ SDK/platform-tools/
export PATH=$PATH:$HOME/extlib/bin:$HOME/.nodebrew/current/bin:/usr/local/bin
export PATH=$PATH:/usr/local/opt/coreutils/libexec/gnubin

export PERL_CPANM_OPT="-l $HOME/extlib"
export PERL5LIB=$HOME/extlib/lib/perl5:$PERL5LIB

source ~/perl5/perlbrew/etc/bashrc

# http://ethanschoonover.com/solarized
alias ls='gls --color=auto'
eval $(gdircolors ~/dircolors-solarized/dircolors.ansi-universal)

export MANPAGER='less -R'
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
        man "$@"
}

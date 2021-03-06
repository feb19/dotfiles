export PATH=$PATH:/usr/local/opt

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH=$PATH:$HOME/.nodebrew/current/bin
export PATH=$PATH:/Applications/Adobe\ Flash\ Builder\ 4.6/sdks/4.6.0/bin
export PATH=$PATH:$HOME/Android\ SDK/platform-tools
export PATH=$PATH:$HOME/extlib/bin:/usr/local/bin
export PATH=$PATH:/usr/local/opt/coreutils/libexec/gnubin

export PERL_CPANM_OPT="-l $HOME/extlib"
export PERL5LIB=$HOME/extlib/lib/perl5:$PERL5LIB

git config --global core.excludesfile ~/.gitignore

# http://ethanschoonover.com/solarized
# linux の場合はこちら
#alias ls='ls --color=auto'
# mac の場合はこちら
alias ls='ls -G'

# eval $(gdircolors ~/dircolors-solarized/dircolors.ansi-universal)

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

# echo 'eval "$(direnv hook bash)"' >> ~/.bashrc
# echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc
# echo 'eval (direnv hook fish)' >> ~/.config/fish/config.fish
# echo 'eval `direnv hook tcsh`' >> ~/.cshrc
# eval "$(direnv hook bash)"

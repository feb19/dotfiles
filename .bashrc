export PERL_CPANM_OPT="-l $HOME/extlib"
export PATH=$PATH:/Applications/Adobe\ Flash\ Builder\ 4.6/sdks/4.6.0/bin:/Users/feb19/Android\ SDK/platform-tools/
export PATH=$HOME/extlib/bin:$HOME/.nodebrew/current/bin:/usr/local/bin:$PATH
export PERL5LIB=$HOME/extlib/lib/perl5:$PERL5LIB
source ~/perl5/perlbrew/etc/bashrc
export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH

# http://ethanschoonover.com/solarized
alias ls='gls --color=auto'
eval $(gdircolors ~/dircolors-solarized/dircolors.ansi-universal)

## Source Order: #1 
echo "# PROFILE: .bashrc" >&2

# Early exit if not running interactively to avoid side-effects!
IGNOREEOF=1

## source ~/.bash_profile ## This is BAD form.  Use `~/.bashrc` for interactive shells

which brew    >/dev/null 2>&1 && eval "$(/opt/homebrew/bin/brew shellenv)"
which cmctl   >/dev/null 2>&1 && source <(cmctl completion bash)
which kubectl >/dev/null 2>&1 && source <(kubectl completion bash)
which twilio  >/dev/null 2>&1 && source <(twilio autocomplete:script bash)
which pyenv   >/dev/null 2>&1 && eval "$(pyenv init -)"
which zoxide  >/dev/null 2>&1 && eval "$(zoxide init bash)"
#source. /opt/vagrant/embedded/gems/2.3.3/gems/vagrant-2.3.3/contrib/bash/completion.sh
#

#for rc in .kuberc .cloudflare/env git_aliases.sh
#source ~jimsander/git_aliases.sh

source /opt/homebrew/opt/chruby/share/chruby/auto.sh
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
#source ~jimsander/.google-cloud.rc

#chruby ruby-3.1.2

source ~/whatnext-ac.sh
complete -F _whatnext wn
complete -C '/opt/homebrew/bin/aws_completer' aws

alias flushdns='sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder'

export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@11/include"

export AWS_PROFILE=jds-east1

## Task Warrior Aliases
ta() { tid=$1; shift; command task $tid annotate \"$*\"; set +x; }

eval $(twilio autocomplete:script bash)

# The next line updates PATH for the Google Cloud SDK.
if [ -f "${HOME}/.gcloud/google-cloud-sdk/path.bash.inc" ]; then 
  source "${HOME}/.gcloud/google-cloud-sdk/path.bash.inc"; 
fi

# The next line enables shell command completion for gcloud.
if [ -f "${HOME}/.gcloud/google-cloud-sdk/completion.bash.inc" ]; then 
  source "${HOME}/.gcloud//google-cloud-sdk/completion.bash.inc"; 
fi

## [[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

if which brew >/dev/null 2>&1; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"* ; do
      [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
    done
  fi
fi

which twilio 2>/dev/null >&2 && \
  alias tlookup="t(){ twilio api:lookups:v1:phone-numbers:fetch --type=carrier --type=caller-name -o=json --phone-number \$1 | jq -r '.[]|\"\(.callerName.caller_name), \(.callerName.caller_type), \(.countryCode), \(.phoneNumber), \(.carrier.name),\(.carrier.type)\"'; }; t "

which helm 2>/dev/null >&2 && \
  source <(helm completion bash) && \
	complete -o default -F __start_helm h

[[ -f "/opt/homebrew/bin/terraform" ]] && \
  complete -C /opt/homebrew/bin/terraform terraform

set -o vi
export AWS_DEFAULT_PROFILE=platformdev

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/jimsander/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
alias dot='git --git-dir=/Users/jimsander/.dotfiles --work-tree=/Users/jimsander'

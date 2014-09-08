alias ..="cd .."
alias ...="cd ../.."
alias c=clear
alias jcb="jps -v | grep -e "-Dkaraf.base=[a-zA-Z0-9\.\/-]*instances/broker" | cut -d ' ' -f1 | xargs jconsole"
alias jcc="jps -v | grep -e "-Dkaraf.base=[a-zA-Z0-9\.\/-]*instances/container" | cut -d ' ' -f1 | xargs jconsole"
alias jcf="jps -v | grep -e "wrapper.service=TRUE" | cut -d ' ' -f1 | xargs jconsole"
alias jps="jps -v"
alias fuse="cd /opt/jboss/fuse"
alias l="ls -la"
alias lfl="less /opt/jboss/fuse/log/fuseesb.log"
alias logs="cd /opt/jboss/fuse/log"
alias nagp="cd /usr/lib/check_mk_agent/plugins"
alias nagl="cd /usr/lib/check_mk_agent/local"
alias nagc="cd /etc/check_mk/"
alias naga="cd /usr/bin/"
alias nag="/usr/bin/check_mk_agent"
alias ncfg="cd /etc/sysconfig/network-scripts"


{% if fabric_ssh_port is defined %}
alias fabric="ssh -p {{ fabric_ssh_port }} admin@localhost"
{% endif %}

export JAVA_HOME=/usr/java
export PATH=$JAVA_HOME/bin:$PATH

force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi

TITLEBAR='\[\e]0;\u@\h\a\]'
if [ "$color_prompt" = yes ]; then
    PS1="${TITLEBAR}\[\033[00;{{ prompt_color_code }}m\]\u@\h\[\033[00m\]:\[\033[00;34m\]\w\[\033[00m\]\$ "
else
    PS1="${TITLEBAR}\u@\h:\W\$ "
fi
unset color_prompt force_color_prompt
export TMOUT={{ timeout }}

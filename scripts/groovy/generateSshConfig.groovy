#!/usr/bin/env groovy

import groovy.util.ConfigSlurper

println "Generating SSH Config..."

def sshConfigFile = new File("${System.getProperty('user.home')}/.ssh/config")

def config = new ConfigSlurper().parse(new File("${args[0]}/ssh-config.groovy").toURI().toURL())

def globalConfig = config.global

def staticConfigLines = """Host *
    AddKeysToAgent yes

# All uswest2/stg connections (except bastion) go through bastion
Host bastion.uswest2.siteminder.com bastion.stg.siteminder.com
    ProxyCommand none

Host *.uswest2
    ProxyCommand ssh ${globalConfig.bastion} nc %h ${globalConfig.port}

Host *.stg
    ProxyCommand ssh ${globalConfig.bastionStg} nc %h ${globalConfig.port}
 
 
# All old dev env connections go through services01.glo
Host *.smuat.siteminder.com *.smtpi.siteminder.com *.dev.siteminder.com *.bbuat.siteminder.com *.bbtpi.siteminder.com *.lhbbtpi.siteminder.com *.lhbbuat.siteminder.com
    ProxyCommand ssh ${globalConfig.glo} nc %h 222
 
# Replicated database port forwarding
Host dbaucm*.uswest2.siteminder.com
    LocalForward 3310 localhost:3306

Host dbukcm*.uswest2.siteminder.com
    LocalForward 3311 localhost:3306

Host dbauror*.uswest2.siteminder.com
    LocalForward 3312 localhost:3306

Host dbukror*.uswest2.siteminder.com
    LocalForward 3313 localhost:3306

# Siteminder defaults
Host *.siteminder.com *.siteminder.com.au *.thebookingbutton.com *.littlehotelier.com *.rdxglobal.com
    Port 222
    Compression yes
    ForwardAgent yes
    ControlMaster auto
    ControlPath ~/.ssh/%r@%h:%p
    ControlPersist 8h
    User ${globalConfig.user}
 
# Global defaults
Host *
    Compression yes
    UseKeychain yes
    AddKeysToAgent yes
    IdentityFile ~/.ssh/id_rsa
"""

sshConfigFile.write staticConfigLines

sshConfigFile << "# Aliases:"
config.aliases.each { alias, aliasConfig ->
    sshConfigFile << """
Host $alias
    HostName ${aliasConfig.host}"""
    if (globalConfig[aliasConfig.proxy]) {
        sshConfigFile << """
    ProxyCommand ssh ${globalConfig.user}@${globalConfig[aliasConfig.proxy]} nc ${aliasConfig.host} ${globalConfig.port}"""
    }
    sshConfigFile << """
    ForwardAgent yes
    Port ${globalConfig.port}
    User ${globalConfig.user}
"""
}

#!/usr/bin/env groovy

import groovy.util.ConfigSlurper

println "Generating GIT Config..."

def gitConfigFile = new File("${System.getProperty('user.home')}/.gitconfig")
gitConfigFile.createNewFile()

def config = new ConfigSlurper().parse(new File("${args[0]}/git-config.groovy").toURI().toURL())

gitConfigFile.write """[user]
  name = ${config.fullname}
  email = ${config.email}
[alias]
  co = checkout
  ci = commit
  st = status -s
  sb = show-branch
  up = !git fetch origin && git rebase origin/master
  lg = log --graph --pretty=format:'%Cred%h%Creset-%C(yellow)%d%Creset %f %Cgreen(%cr)%Creset'
  who = log --format="'%ai %h %aN %s'"
  ba = branch -a
  rpo = remote prune origin
  undo = reset HEAD~1 --soft
  wip = commit -am WIP
  logtag = tag -l -n9 --sort=-v:refname
[apply]
  whitespace = nowarn
[color]
  ui = auto
[branch]
  autosetuprebase = always
  autosetupmerge = true
[showbranch]
  default = --all
[push]
  default = current
[log]
  decorate = true
[url "https://github"]
  insteadOf = git://github
"""

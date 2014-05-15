chalk    = require 'chalk'
daemon   = require './controls/daemon'
resolver = require './controls/resolver'
firewall = require './controls/firewall'
link     = require './controls/link'
exec     = require './controls/exec'
help     = require './controls/help'

module.exports =

  '-v': ->
    help.version()
  
  '--version' : ->
    help.version()

  help: -> 
    help.usage()

  link: (cmd) ->
    exec.create process.cwd(), cmd if cmd
    link.create process.cwd()

  unlink: (path = process.cwd()) ->
    exec.remove path
    link.remove path

  list: ->
    link.list()

  open: (path = process.cwd()) ->
    link.open path

  start: ->
    console.log chalk.green 'Starting katon daemon'
    daemon.create()
    daemon.load()

  stop: ->
    console.log chalk.red 'Stopping katon daemon'
    daemon.unload()
    daemon.remove()

  status: ->
    help.status()

  install: ->
    sh common.render 'scripts/install.sh', config

  uninstall: ->
    sh common.render 'scripts/uninstall.sh', config

  __install: ->
    resolver.create()
    firewall.create()
    firewall.load()

  __uninstall: ->
    resolver.remove()
    firewall.unload()
    firewall.remove()
    firewall.deleteRule()

  run: ([action, option]) ->
    if @[action]
      @[action] option
    else
      @['help']()

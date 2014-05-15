path = require 'path'

HOME = process.env.HOME

module.exports =
  nodePath      : process.execPath

  httpPort      : 80
  dnsPort       : 3333
  proxyPort     : 4000

  resolverPath  : '/etc/resolver'

  ruleNumber    : 999
  firewallPlist : "/Library/LaunchAgents/katon.firewall.plist"

  daemonPlist   : "#{HOME}/Library/LaunchAgents/katon.plist"

  powDir        : "#{HOME}/.pow"
  nvmDir        : "#{HOME}/.nvm"
  katonDir      : "#{HOME}/.katon"

  daemonPath    : path.resolve "#{__dirname}/daemon/index"
  nodemonPath   : path.resolve "#{__dirname}/../node_modules/.bin/nodemon"
  staticPath    : path.resolve "#{__dirname}/../node_modules/.bin/static"

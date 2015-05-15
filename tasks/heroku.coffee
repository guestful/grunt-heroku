###
grunt-heroku
https://github.com/tghw/grunt-heroku

Copyriught (c) 2014 Tyler G. Hicks-Wright
Licensed under MIT license.
###

module.exports = (grunt) ->
  grunt.registerMultiTask 'hdeploy', 'Deploy the specified branch to the specified environment of Heroku.', () ->
    next = @async()
    remote = @data.remote or 'heroku'
    branch = @data.branch or 'master'
    grunt.log.writeln("Pushing branch '#{branch}' to '#{remote}'...")
    grunt.util.spawn
      cmd: 'git'
      grunt: false
      args: ['push', '-f', remote, branch + ':master']
      opts:
        stdio: 'inherit'
    , (error, result, code) ->
      if code == 0
        grunt.log.writeln(result.stdout)
      else
        grunt.log.errorlns(error)
        grunt.log.errorlns(result.stderr)
      next()

  grunt.registerMultiTask 'hrun', 'Run a command on Heroku.', () ->
    next = @async()
    if not @data.cmd?
      grunt.log.error('cmd is required')
      return next()
    args = ['run', @data.cmd].concat(@data.args or [])
    grunt.util.spawn
      cmd: 'heroku'
      grunt: false
      args: args
      opts:
        stdio: 'inherit'
    , (error, result, code) ->
      if code == 0
        grunt.log.writeln(result.stdout)
      else
        grunt.log.errorlns(error)
        grunt.log.errorlns(result.stderr)
      next()

  return

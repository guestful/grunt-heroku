# grunt-heroku

Heroku commands for Grunt

## Getting Started

This plugin requires Grunt `~0.4.0`.

If you haven't used [Grunt](http://gruntjs.com/) before, be sure to check out the [Getting Started](http://gruntjs.com/getting-started) guide, as it explains how to create a [Gruntfile](http://gruntjs.com/sample-gruntfile) as well as install and use Grunt plugins. Once you're familiar with that process, you may install this plugin with this command:

```shell
npm install grunt-git --save-dev
```

Once the plugin has been installed, it may be enabled inside your Gruntfile with this line of JavaScript:

```js
grunt.loadNpmTasks('grunt-heroku');
```

## The `hrun` Task

Run a command on Heroku.

#### Run Options

* `cmd`: The command to run on Heroku
* `args`: The arguments to pass to `cmd` (optional)

```js
grunt.initConfig({
  hrun: {
    your_target: {
      cmd: 'command',
      args: ['arg1', 'arg2']
    }
  }
});
```

## The `hdeploy` Task

Use `git` to deploy your app to Heroku.

#### Deploy Options

* `remote`: The remote to push to. (optional, default: `heroku`)
* `branch`: Which branch to push. (optional, defualt: `master`)

```js
grunt.initConfig({
  hdeploy: {
    staging: {
      remote: 'staging',
      branch: 'master
    },
    production: {}
  }
});
```

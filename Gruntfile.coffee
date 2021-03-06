module.exports = (grunt) ->

  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-karma'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-bump'
  grunt.loadNpmTasks 'grunt-angular-templates'
  grunt.loadNpmTasks 'grunt-contrib-concat'

  grunt.registerTask 'default', ['clean', 'coffee', 'less', 'ngtemplates', 'concat']

  grunt.initConfig

    bump:
        options:
          pushTo: 'origin'

    clean: ['dist']

    coffee:
      src:
        expand: true
        cwd: 'src'
        src: ['**/*.coffee']
        dest: 'tmp'
        ext: '.js'

    less:
      client:
        options:
          yuicompress: true
        files:
          "dist/alert-drawer.css": ["**/alert-drawer.less"]

    karma:
      all:
        configFile: 'karma.conf.coffee'
        autoWatch: false
        singleRun: true
      watch:
        configFile: 'karma.conf.coffee'
        autoWatch: true
        singleRun: false

    ngtemplates:
      app:
        cwd: 'templates'
        src: '**/*.html'
        dest: 'tmp/templates.js'
        options:
          module: 'alertDrawer'

    concat:
      dist:
        src: ['tmp/**.js'],
        dest: 'dist/alert-drawer.js'

module.exports = (grunt) ->

    # Project configuration.
    grunt.initConfig
        pkg: grunt.file.readJSON('package.json'),

        clean: ["build"]

        coffee:
            main:
                files:
                    'build/js/elementize.js': ['coffee/elementize.coffee']

        less:
            main:
                options:
                    paths: ["less"],
                    yuicompress: true
                files:
                    "build/css/elementize.min.css" : "less/elementize.less"

        uglify:
            options:
                banner: '/*! <%= pkg.name %> - v<%= pkg.version %> - <%= grunt.template.today("yyyy-mm-dd") %>\n' +
                        ' * <%= pkg.website %>/\n' +
                        ' * Copyright (c) <%= grunt.template.today("yyyy") %> ' +
                        '<%= pkg.author %>; <%= pkg.license %> */\n'

            main:
                files: [
                    'build/js/elementize.min.js': [
                        'build/js/elementize.js'
                    ],
                ]

        copy:
            main:
                files: [
                    { expand: true, cwd: 'build', src: ['**'], dest: '../' },
                ]


        watch:
            watch:
                files: ['coffee/*.coffee', 'js/*.js', 'less/**'],
                tasks: ['default'],
                options:
                    nospawn: true


    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-less');
    grunt.loadNpmTasks('grunt-contrib-copy');
    grunt.loadNpmTasks('grunt-contrib-coffee');

    grunt.registerTask('default', ['clean', 'coffee', 'less', 'uglify', 'copy'])

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
                    paths: ["less", "<%= bootstrap %>/less/"],
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
                    'build/js/elementize.min.js': ['build/js/elementize.js'],

                    # 'build/js/person-show.min.js': ['build/js/person-show.js'],
                    # 'build/js/fields-list.min.js': ['libs/jquery.tablednd.0.9.rc1.js','build/js/fields-list.js'],
                    # 'build/js/import.min.js': ['libs/FileAPI/lib/FileAPI.core.js', 'libs/FileAPI/lib/FileAPI.XHR.js', 'libs/FileAPI/lib/FileAPI.Form.js', 'libs/FileAPI/lib/FileAPI.Image.js', 'build/js/import.js'],
                    # 'build/js/import-assign.min.js': ['build/js/import-assign.js'],
                ]

        copy:
            main:
                files: [
                    { expand: true, flatten: true, src: ['<%= bootstrap %>/img/**'], dest: 'build/img', filter : 'isFile' },
                    { expand: true, cwd: 'build', src: ['**'], dest: '../public_html' },
                ]

        watch:
            watch:
                files: ['coffee/*.coffee', 'js/*.js', 'less/**'],
                tasks: ['default'],
                options:
                    nospawn: true

        bootstrap: '../external/bootstrap'

        h5bp: '../external/html5-boilerplate'


    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-less');
    grunt.loadNpmTasks('grunt-contrib-copy');
    grunt.loadNpmTasks('grunt-contrib-coffee');

    grunt.registerTask('default', ['clean', 'coffee', 'less', 'uglify', 'copy'])

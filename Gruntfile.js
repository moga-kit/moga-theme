module.exports = function (grunt) {

    'use strict';

    grunt.initConfig({
        /**
         * Get package meta data
         */
        pkg: grunt.file.readJSON('package.json'),
        /**
         * Set project object
         */
        project: {
            theme: 'moga',
            dev: './',
            out: './../../../out/',
            tmp: './../../../tmp/',
            modules: './../../../modules/',
        },
        /**
         * Clean tmp folders
         */
        clean: {
            options: {
                'force':true,
            },
            src: ['<%= project.tmp %>/*'],
        },
        /**
         * Sass (compile & minify)
         */
        sass: {
            dist: {
                options: {
                    update: true,
                    style: 'compressed' /* compressed */
                },
                files: {
                    '<%= project.out %><%= project.theme %>/src/css/styles.min.css': [
                        '<%= project.dev %>/build/scss/style.scss'
                    ],
                    '<%= project.out %><%= project.theme %>/src/css/manufacturer.min.css': [
                        '<%= project.dev %>/build/scss/manufacturer.scss'
                    ],
                    '<%= project.out %><%= project.theme %>/src/css/promoslider.min.css': [
                        '<%= project.dev %>/build/scss/promoslider.scss'
                    ]
                }
            }
        },
        cssmin: {
            options: {
                mergeIntoShorthands: false,
                roundingPrecision: -1
            },
            target: {
                files: {
                    '<%= project.out %><%= project.theme %>/src/css/styles.min.css': ['<%= project.out %><%= project.theme %>/src/css/styles.min.css'],
                    '<%= project.out %><%= project.theme %>/src/css/manufacturer.min.css': ['<%= project.out %><%= project.theme %>/src/css/manufacturer.min.css'],
                    '<%= project.out %><%= project.theme %>/src/css/promoslider.min.css': ['<%= project.out %><%= project.theme %>/src/css/promoslider.min.css']
                }
            }
        },
        concat: {
            js: {
                options: {
                    separator: ';\n',
                    sourcemap: false
                },
                files: {
                    '<%= project.out %><%= project.theme %>/src/js/scripts.min.js': [
                        //'<%= project.dev %>node_modules/jquery/dist/jquery.min.js',
                        //'<%= project.dev %>node_modules/bootstrap/dist/js/bootstrap.bundle.min.js',
                        '<%= project.dev %>build/js/bootstrap.bundle.js',
                        //'<%= project.dev %>node_modules/slick-carousel/slick/slick.js',
                        //'<%= project.dev %>node_modules/lazysizes/lazysizes.min.js',
                        //'<%= project.dev %>build/js/main.js'
                    ],
                    '<%= project.out %><%= project.theme %>/src/js/details.min.js': [
                        //'<%= project.dev %>build/vendor/jquery-ui/js/jquery-ui.js',
                        '<%= project.dev %>build/js/pages/details.js',
                        //'<%= project.dev %>build/js/pages/review.js',
                    ],
                    '<%= project.out %><%= project.theme %>/src/js/compare.min.js': [
                        '<%= project.dev %>build/js/pages/compare.js'
                    ],
                    '<%= project.out %><%= project.theme %>/src/js/start.min.js': [
                        '<%= project.dev %>build/js/pages/start.js'
                    ],
                    '<%= project.out %><%= project.theme %>/src/js/movetonoticelist.min.js': [
                        '<%= project.dev %>build/js/pages/checkout/basket/movetonoticelist.js'
                    ],
                    '<%= project.out %><%= project.theme %>/src/js/agb.min.js': [
                        '<%= project.dev %>build/js/pages/checkout/order/agb.js'
                    ],
                    '<%= project.out %><%= project.theme %>/src/js/listremovebutton.min.js': [
                        '<%= project.dev %>build/js/pages/myaccount/listremovebutton.js'
                    ],
                    '<%= project.out %><%= project.theme %>/src/js/changeaddress.min.js': [
                        '<%= project.dev %>build/js/form/changeaddress.js'
                    ]
                }
            }
        },
        webfont: {
            icons: {
                src: '<%= project.dev %>/build/icons/*.svg',
                dest: '<%= project.out %><%= project.theme %>/src/fonts/',
                destCss: '<%= project.dev %>/build/scss/',
                options: {
                    relativeFontPath: '../fonts/',
                    fontPathVariables: true,
                    stylesheet: 'scss',
                    fontFamilyName: 'icons',
                    hash: false,
                    normalize: false,
                    fontFilename: 'icons',
                    types: 'woff2,woff',
                    template: 'build/tasks/templates/custom_webfont.scss'
                }
            }
        },
        combine_mq: {
            new_filename: {
                options: {
                    beautify: false,
                    expand: false
                },
                src:  '<%= project.out %><%= project.theme %>/src/css/styles.min.css',
                dest: '<%= project.out %><%= project.theme %>/src/css/styles.min.css'
            }
        },
        /**
         * Watch files for changes
         */
        watch: {
            clean: {
                files: [
                    '<%= project.dev %>de/**/*.*','<%= project.dev %>en/**/*.*','<%= project.modules %>**/*.tpl'],
                tasks:
                    ['clean'],
                options:
                    {
                        spawn: false,
                        livereload: true
                    }
            },
            sass: {
                files: [
                    '<%= project.dev %>build/scss/**/*.scss','<%= project.dev %>tpl/**/*.tpl'],
                tasks:
                    ['sass', 'combine_mq', 'cssmin', 'clean'],
                options:
                    {
                        spawn: false,
                        livereload: true
                    }
            },
            js: {
                files: [
                    '<%= project.dev %>build/js/*.js',
                    '<%= project.dev %>build/js/**/*.js',
                    '<%= project.out %><%= project.theme %>/src/js/*.js'
                ],
                tasks:
                    ['concat:js'],
                options:
                    {
                        spawn: false,
                        livereload: true
                    }
            }
        },
        copy: {
            fonts: {
                files: [
                    {
                        expand: true,
                        src: '*',
                        cwd: '<%= project.dev %>/build/vendor/raleway/',
                        dest: '<%= project.out %><%= project.theme %>/src/fonts/'
                    }
                ]
            },
        }
    });

    /**
     * Load Grunt plugins
     */
    require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);

    /**
     * Default task
     * Run `grunt` on the command line
     */
    grunt.registerTask('default', [
        'webfont',
        'copy',
        'sass',
        'combine_mq',
        'cssmin',
        'concat:js',
        'clean',
        'watch'
    ]);
};

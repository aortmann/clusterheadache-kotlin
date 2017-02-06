var app = angular.module('clusterHeadacheApp', ['ngMaterial', 'ngAnimate', 'ngAria', 'ngMessages', 'ngSanitize', 'picardy.fontawesome', 'mdPickers'])
    .config(function($mdThemingProvider) {
        $mdThemingProvider.theme('default')
            .primaryPalette('light-blue')
            .accentPalette('light-blue');
    }).config(function($locationProvider) {
        $locationProvider.html5Mode({
            enabled: true,
            requireBase: false
        });
        $locationProvider.hashPrefix('!');
    });
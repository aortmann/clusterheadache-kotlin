var app = angular.module('clusterHeadacheApp', ['ngMaterial', 'ngAnimate', 'ngAria', 'ngMessages', 'picardy.fontawesome', 'mdPickers'])
    .config(function($mdThemingProvider) {
        $mdThemingProvider.theme('default')
            .primaryPalette('light-blue')
            .accentPalette('light-blue');
    });
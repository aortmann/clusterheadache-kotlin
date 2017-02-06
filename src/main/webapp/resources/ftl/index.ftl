<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/angular_material/1.1.1/angular-material.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.rawgit.com/andrea-vega/mdPickers/master/dist/mdPickers.min.css">

        <link rel="stylesheet" href="/static/css/home.css?v=0">

    </head>
    <body ng-app="clusterHeadacheApp" ng-cloak>

        <#include "main.ftl"/>

        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.1/angular.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.1/angular-animate.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.1/angular-aria.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.1/angular-messages.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.1/angular-sanitize.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/angular_material/1.1.1/angular-material.min.js"></script>
        <script src="http://picardy.github.io/angular-fontawesome/src/angular-fontawesome.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.17.1/moment.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.17.1/locale/es.js"></script>
        <script src="https://cdn.rawgit.com/andrea-vega/mdPickers/master/dist/mdPickers.min.js"></script>

        <script src="/static/angular/app.js?v=0"></script>
        <script src="/static/angular/controller/home.js?v=0"></script>

        <script type="application/javascript">
            moment.locale('es', {
                calendar : {
                    sameElse : '[el] DD/MM/YYYY [a las] LT'
                }
            });
        </script>

        <img src="/static/img/OK_FO3_small.png" style="display:none" />
        <img src="/static/img/ANGRY_FO3_small.png" style="display:none" />
    </body>
</html>
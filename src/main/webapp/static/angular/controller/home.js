app.controller('HomeController', ['$q', '$http', '$location', '$mdDialog', '$sce', function ($q, $http, $location, $mdDialog, $sce) {
    var homeCtrl = this;
    homeCtrl.moment = moment;

    homeCtrl.getCurrentNavItem = function () {
        if ($location.hash() == "") return "add";
        return $location.hash().replace(/(^#\/|\/$)/g, '');
    };
    homeCtrl.currentNavItem = homeCtrl.getCurrentNavItem();

    homeCtrl.reset = function () {
        homeCtrl.addForm = {
            date: new Date(),
            time: new Date()
        };
    };

    homeCtrl.reset();

    homeCtrl.send = function () {
        if(homeCtrl.addForm.date && homeCtrl.addForm.time && homeCtrl.addForm.feel && homeCtrl.addForm.where && homeCtrl.addForm.medication && homeCtrl.addForm.painLevel && homeCtrl.addForm.painLevel > 0) {
            homeCtrl.showAngryDialog($sce.trustAsHtml('&iexcl;Debes completar tus reportes pendientes antes de agregar uno nuevo!'));
        }
        else if(!homeCtrl.historyData[0].duration) {
            homeCtrl.showAngryDialog($sce.trustAsHtml('&iexcl;Debes completar todos los datos!'));
        }
        else {
            homeCtrl.addForm.date = moment(homeCtrl.addForm.date).format("DD/MM/YYYY");
            homeCtrl.addForm.time = moment(homeCtrl.addForm.time).format("HH:mm");
            $http({
                method: 'POST',
                url: '/add',
                dataType: 'json',
                data: [
                    homeCtrl.addForm.date,
                    homeCtrl.addForm.time,
                    homeCtrl.addForm.feel,
                    homeCtrl.addForm.where,
                    homeCtrl.addForm.medication,
                    homeCtrl.addForm.duration || "",
                    homeCtrl.addForm.painLevel],
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json'
                }
            });

            homeCtrl.reset();
            homeCtrl.showOKDialog();
        }
    };

    var whereList = ["Casa", "Oficina", "Viajando"];
    homeCtrl.whereOptions = function (query) {
        return query ? whereList.filter(createFilterFor(query)) : whereList;
    };

    var medicationList = ["Ketorolac", "Nada"];
    homeCtrl.medicationOptions = function (query) {
        return query ? medicationList.filter(createFilterFor(query)) : medicationList;
    };

    homeCtrl.getHistoryData = function () {
        $http.get("/history").then(function (response) {
            homeCtrl.historyData = response.data;
        });
    };

    homeCtrl.getPainLevel = function (painLevel) {
        var pl = Math.round(painLevel / 2.5);
        var color = "#009688";
        switch (pl) {
            case 2:
                color = "#ffd85a";
                break;
            case 3:
                color = "#FF9800";
                break;
            case 4:
                color = "#F44336";
                break;
        }

        return {
            styles: {color: color},
            rounded: pl
        }
    };

    homeCtrl.showMoreInfoDialog = function (history, $event) {
        var parentEl = angular.element(document.body);
        $mdDialog.show({
            parent: parentEl,
            targetEvent: $event,
            templateUrl: '/static/angular/templates/more-info-history-dialog.tmpl',
            locals: {
                history: history
            },
            controller: DialogController,
            clickOutsideToClose: true,
            escapeToClose: true
        });
        function DialogController($scope, $mdDialog, history) {
            $scope.moment = moment;
            $scope.history = history;
            $scope.getHumanizedPainLevel = function (painLevel) {
                switch (painLevel) {
                    case 0:
                    case 1:
                    case 2:
                    case 3:
                        return "Bajo";
                        break;
                    case 4:
                    case 5:
                    case 6:
                    case 7:
                        return "Medio";
                        break;
                    default:
                        return "Alto";
                        break;
                }
            };
            $scope.capitalize = function capitalize(s) {
                return s && s[0].toUpperCase() + s.slice(1);
            };
            $scope.close = function() {
                $mdDialog.hide();
            };
            $scope.deleteHistory = function(history) {
                $http({
                    method: 'POST',
                    url: '/delete',
                    dataType: 'json',
                    data: history.cell,
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    }
                }).then(function() {
                    $scope.close();
                    location.reload();
                });
            }
        }
    };

    homeCtrl.showPendingDialog = function (history, $event) {
        var parentEl = angular.element(document.body);
        $mdDialog.show({
            parent: parentEl,
            targetEvent: $event,
            templateUrl: '/static/angular/templates/pending-history-dialog.tmpl',
            locals: {
                history: history
            },
            controller: DialogController,
            clickOutsideToClose: true,
            escapeToClose: true
        });
        function DialogController($scope, $http, $mdDialog, history) {
            $scope.moment = moment;
            $scope.history = history;
            $scope.time = new Date();
            $scope.save = function(cell, time) {
                $http({
                    method: 'POST',
                    url: '/save',
                    dataType: 'json',
                    data: {
                        cell: cell,
                        time: time
                    },
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    }
                });
	            history.duration = time;
                $scope.close();
            };

            $scope.close = function() {
                $mdDialog.hide();
            };
        }
    };

    homeCtrl.showOKDialog = function ($event) {
        var parentEl = angular.element(document.body);
        $mdDialog.show({
            parent: parentEl,
            targetEvent: $event,
            templateUrl: '/static/angular/templates/ok-dialog.tmpl',
            controller: DialogController,
            clickOutsideToClose: true,
            escapeToClose: true
        });
        function DialogController($scope, $http, $mdDialog) {
            $scope.close = function() {
                $mdDialog.hide();
            };
        }
    };

    homeCtrl.showAngryDialog = function (text, $event) {
        var parentEl = angular.element(document.body);
        $mdDialog.show({
            parent: parentEl,
            targetEvent: $event,
            templateUrl: '/static/angular/templates/angry-dialog.tmpl',
            locals: {
                text: text
            },
            controller: DialogController,
            clickOutsideToClose: true,
            escapeToClose: true
        });
        function DialogController($scope, $mdDialog, text) {
            $scope.text = text;
            $scope.close = function() {
                $mdDialog.hide();
            };
        }
    };

    function createFilterFor(query) {
        var lowercaseQuery = angular.lowercase(query);

        return function filterFn(query) {
            return (angular.lowercase(query).indexOf(lowercaseQuery) === 0);
        };

    }
}]);
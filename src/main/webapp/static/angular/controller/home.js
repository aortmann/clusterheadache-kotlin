app.controller('HomeController', ['$q', '$http', '$location', '$timeout', function ($q, $http, $location, $timeout) {
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
                homeCtrl.addForm.duration,
                homeCtrl.addForm.painLevel],
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        });

        homeCtrl.reset();
    }

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


    function createFilterFor(query) {
        var lowercaseQuery = angular.lowercase(query);

        return function filterFn(query) {
            return (angular.lowercase(query).indexOf(lowercaseQuery) === 0);
        };

    }
}]);
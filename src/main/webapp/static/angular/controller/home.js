app.controller('HomeController', ['$q', '$http', function($q, $http){
    var homeCtrl = this;
    homeCtrl.currentNavItem = 'add';

    homeCtrl.reset = function() {
        homeCtrl.addForm = {
            date: new Date(),
            time: new Date()
        };
    };

    homeCtrl.reset();

    homeCtrl.send = function() {
        homeCtrl.addForm.date = moment(homeCtrl.addForm.date).format("DD/MM/YYYY");
        homeCtrl.addForm.time = moment(homeCtrl.addForm.time).format("HH:mm");
        homeCtrl.addForm.from = "Inicialmente un " + homeCtrl.addForm.from + "\nAl finalizar un " + homeCtrl.addForm.to;
        delete homeCtrl.addForm.to;
        $http({
            method: 'POST',
            url: '/add',
            dataType: 'json',
            data: Object.values(homeCtrl.addForm),
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        });

        homeCtrl.reset();
    }

    var whereList = ["Casa", "Oficina", "Viajando"];
    homeCtrl.whereOptions = function(query) {
        return query ? whereList.filter( createFilterFor(query) ) : whereList;
    };

    function createFilterFor(query) {
        var lowercaseQuery = angular.lowercase(query);

        return function filterFn(query) {
            return (angular.lowercase(query).indexOf(lowercaseQuery) === 0);
        };

    }
}]);
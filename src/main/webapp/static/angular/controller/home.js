app.controller('HomeController', ['$q', '$http', function ($q, $http) {
	var homeCtrl = this;
	homeCtrl.moment = moment;
	homeCtrl.currentNavItem = 'add';

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

	function createFilterFor(query) {
		var lowercaseQuery = angular.lowercase(query);

		return function filterFn(query) {
			return (angular.lowercase(query).indexOf(lowercaseQuery) === 0);
		};

	}

	homeCtrl.getHistoryData = function () {
		$http.get("/history").then(function (response) {
			homeCtrl.historyData = response.data;
		});
	}

	homeCtrl.getPainLevel = function (painLevel) {
		var pl = Math.round(painLevel / 2.5);
		var color = "#009688";
		switch(pl) {
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
			color: {color: color},
			rounded: pl
        }
	}
}]);
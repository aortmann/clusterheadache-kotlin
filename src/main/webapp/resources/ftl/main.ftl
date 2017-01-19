<md-content ng-controller="HomeController as homeCtrl">
	<md-nav-bar md-selected-nav-item="homeCtrl.currentNavItem" nav-bar-aria-label="navigation links">
		<md-nav-item md-nav-href="#add" name="add">
			<fa name="medkit" size="large" aria-hidden="true"></fa>
		</md-nav-item>
		<md-nav-item md-nav-href="#history" name="history">
			<fa name="history" size="large" aria-hidden="true"></fa>
		</md-nav-item>
		<md-nav-item md-nav-href="#statistics" name="statistics">
			<fa name="pie-chart" size="large" aria-hidden="true"></fa>
		</md-nav-item>
	</md-nav-bar>

	<div class="ext-content" ng-if="homeCtrl.getCurrentNavItem() == 'add'">
		<md-card>
			<md-card-content>
				<md-input-container style="margin-top: 18px;margin-bottom: 0px;">
					<mdp-date-picker mdp-placeholder="Fecha" ng-model="homeCtrl.addForm.date"></mdp-date-picker>
					<mdp-time-picker mdp-placeholder="Hora" ng-model="homeCtrl.addForm.time"></mdp-time-picker>
				</md-input-container>

				<md-input-container class="md-block">
					<label>&iquest;Que sent&iacute;s?</label>
					<input ng-model="homeCtrl.addForm.feel">
				</md-input-container>

				<md-autocomplete
						md-selected-item="whereSelected"
						md-search-text="homeCtrl.addForm.where"
						md-items="where in homeCtrl.whereOptions(homeCtrl.addForm.where)"
						md-item-text="where" ,
						md-min-length="0"
						md-floating-label="&iquest;D&oacute;nde est&aacute;s?">
					<span md-highlight-text="searchText">{{where}}</span>
				</md-autocomplete>

				<md-input-container class="md-block">
					<label>&iquest;Tomaste algo?</label>
					<input ng-model="homeCtrl.addForm.medication">
				</md-input-container>

				<md-input-container class="md-block">
					<label>Duraci&oacute;n</label>
					<input ng-model="homeCtrl.addForm.duration">
				</md-input-container>
				<md-card-title-text>
					<span class="md-subhead">Nivel de dolor</span>
				</md-card-title-text>
				<md-slider-container class="md-block">
					<md-slider md-discrete ng-model="homeCtrl.addForm.painLevel" min="1" max="10"></md-slider>
					<md-input-container>
						<input type="number" ng-model="homeCtrl.addForm.painLevel">
					</md-input-container>
				</md-slider-container>
			</md-card-content>

			<md-card-actions layout="row" layout-align="end center">
				<md-button ng-click="homeCtrl.reset()">Reiniciar</md-button>
				<md-button ng-click="homeCtrl.send()">Enviar</md-button>
			</md-card-actions>
		</md-card>
	</div>

	<div class="ext-content" ng-if="homeCtrl.getCurrentNavItem() == 'history'" ng-init="homeCtrl.getHistoryData()">
		<md-card ng-repeat="history in homeCtrl.historyData">
			<md-card-title>
				<md-card-title-text>
					<span class="md-headline date-time-data">{{homeCtrl.moment(history.dateTime).calendar()}}</span>
					<span class="md-subhead">{{history.where}}</span>
				</md-card-title-text>
                <md-card-title-media>
                    <fa ng-attr-name='{{"thermometer-" + homeCtrl.getPainLevel(history.painLevel).rounded}}' alt="Pain level" size="large" aria-hidden="true" ng-style='homeCtrl.getPainLevel(history.painLevel).styles'></fa>
                </md-card-title-media>
			</md-card-title>
			<md-card-content layout="row" layout-align="space-between">
				<!--md-card-actions layout="column">
					<md-button class="md-icon-button" aria-label="Favorite">
						<fa name="pie-chart" size="large" aria-hidden="true"></fa>
					</md-button>
					<md-button class="md-icon-button" aria-label="Settings">
						<fa name="pie-chart" size="large" aria-hidden="true"></fa>
					</md-button>
					<md-button class="md-icon-button" aria-label="Share">
						<fa name="pie-chart" size="large" aria-hidden="true"></fa>
					</md-button>
				</md-card-actions!-->
			</md-card-content>
            <md-card-footer>

            </md-card-footer>
		</md-card>
	</div>

	<div class="ext-content" ng-if="homeCtrl.getCurrentNavItem() == 'statistics'">
		Statistics
	</div>

</md-content>
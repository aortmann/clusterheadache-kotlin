<md-content class="md-padding" ng-controller="HomeController as homeCtrl">
    <md-nav-bar md-selected-nav-item="homeCtrl.currentNavItem" nav-bar-aria-label="navigation links">
        <md-nav-item md-nav-click="goto('add')" name="add">
            <fa name="medkit" size="large" aria-hidden="true"></fa>
        </md-nav-item>
        <md-nav-item md-nav-click="goto('statistics')" name="statistics">
            <fa name="pie-chart" size="large" aria-hidden="true"></fa>
        </md-nav-item>
    </md-nav-bar>

    <div class="ext-content" ng-show="homeCtrl.currentNavItem == 'add'">
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
                    <span class="md-subhead">Dolor</span>
                </md-card-title-text>
                <md-input-container class="md-block">
                    <label>Desde</label>
                    <md-select ng-model="homeCtrl.addForm.from">
                        <md-option ng-repeat="option in [1,2,3,4,5,6,7,8,9,10]" ng-value="option">
                            {{option}}
                        </md-option>
                    </md-select>
                </md-input-container>
                <md-input-container class="md-block">
                    <label>Hasta</label>
                    <md-select ng-model="homeCtrl.addForm.to">
                        <md-option ng-repeat="option in [1,2,3,4,5,6,7,8,9,10]" ng-value="option">
                            {{option}}
                        </md-option>
                    </md-select>
                </md-input-container>
            </md-card-content>

            <md-card-actions layout="row" layout-align="end center">
                <md-button ng-click="homeCtrl.reset()">Reiniciar</md-button>
                <md-button ng-click="homeCtrl.send()">Enviar</md-button>
            </md-card-actions>
        </md-card>
    </div>


    <div class="ext-content" ng-show="homeCtrl.currentNavItem == 'statistics'">
        Statistics
    </div>

</md-content>
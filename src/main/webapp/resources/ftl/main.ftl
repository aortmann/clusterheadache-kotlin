<div ng-controller="HomeController as homeCtrl">
    <md-content class="md-padding">
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
                    <md-input-container>
                        <mdp-date-picker mdp-placeholder="Date" ng-model="homeCtrl.currentDate"></mdp-date-picker>
                        <mdp-time-picker mdp-placeholder="Time" ng-model="homeCtrl.currentDate"></mdp-time-picker>
                    </md-input-container>
                    <md-input-container class="md-block">
                        <label>Feeling</label>
                        <input>
                    </md-input-container>
                    <md-input-container class="md-block">
                        <label>Where</label>
                        <input>
                    </md-input-container>
                    <md-input-container class="md-block">
                        <label>Duration</label>
                        <input>
                    </md-input-container>
                    <md-card-title-text>
                        <span class="md-subhead">From 1 to 10...</span>
                    </md-card-title-text>
                    <md-input-container class="md-block">
                        <label>From</label>
                        <md-select ng-model="fromOption">
                            <md-option ng-repeat="option in [1,2,3,4,5,6,7,8,9,10]" ng-value="option">
                                {{option}}
                            </md-option>
                        </md-select>
                    </md-input-container>
                    <md-input-container class="md-block">
                        <label>To</label>
                        <md-select ng-model="toOption">
                            <md-option ng-repeat="option in [1,2,3,4,5,6,7,8,9,10]" ng-value="option">
                                {{option}}
                            </md-option>
                        </md-select>
                    </md-input-container>
                </md-card-content>
            </md-card>
        </div>




        <div class="ext-content" ng-show="homeCtrl.currentNavItem == 'statistics'">
            Statistics
        </div>

    </md-content>
</div>
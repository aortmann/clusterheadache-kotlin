<md-card ng-repeat="history in ::homeCtrl.historyData">
    <md-card-header>
        <md-card-avatar>
            <fa ng-attr-name='{{"thermometer-" + homeCtrl.getPainLevel(history.painLevel).rounded}}' size="large" aria-hidden="true" ng-style='::homeCtrl.getPainLevel(history.painLevel).styles'></fa>
        </md-card-avatar>
        <md-card-header-text>
            <span class="md-title date-time-data">{{::homeCtrl.moment(history.dateTime).calendar()}}</span>
            <span class="md-subhead">{{::history.where}}<span ng-if="::history.duration"> - {{::homeCtrl.moment.duration(homeCtrl.moment(history.time).diff(history.duration)).humanize()}}</span></span>
        </md-card-header-text>
        <md-card-avatar ng-if="::!history.duration">
            <md-button class="md-icon-button">
                <fa name="exclamation-triangle" size="large" aria-hidden="true" ng-style="::{'color': '#FFEB3B'}"></fa>
            </md-button>
        </md-card-avatar>
    </md-card-header>
    <!--md-card-title>
        <md-card-title-text>
            <span class="md-headline date-time-data">{{homeCtrl.moment(history.dateTime).calendar()}}</span>
            <span class="md-subhead">{{history.where}}</span>
        </md-card-title-text>
        <md-card-title-media>
            <fa ng-attr-name='{{"thermometer-" + homeCtrl.getPainLevel(history.painLevel).rounded}}' alt="Pain level" size="large" aria-hidden="true" ng-style='homeCtrl.getPainLevel(history.painLevel).styles'></fa>
        </md-card-title-media>
    </md-card-title-->
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
        {{::history.description}}
    </md-card-content>
    <md-card-footer>

    </md-card-footer>
</md-card>
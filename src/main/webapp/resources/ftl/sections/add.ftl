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
                md-item-text="where"
                md-min-length="0"
                md-floating-label="&iquest;D&oacute;nde est&aacute;s?">
            <span md-highlight-text="searchText">{{where}}</span>
        </md-autocomplete>

        <md-autocomplete
                md-selected-item="medicationSelected"
                md-search-text="homeCtrl.addForm.medication"
                md-items="medication in homeCtrl.medicationOptions(homeCtrl.addForm.medication)"
                md-item-text="medication"
                md-min-length="0"
                md-floating-label="Medicaci&oacute;n">
            <span md-highlight-text="searchText">{{medication}}</span>
        </md-autocomplete>

        <!--md-input-container class="md-block">
            <label>Duraci&oacute;n</label>
            <input ng-model="homeCtrl.addForm.duration">
        </md-input-container-->
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

<img src="/static/img/OK_FO3_small.png" style="display:none" />
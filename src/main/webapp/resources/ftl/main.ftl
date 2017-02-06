<md-content ng-controller="HomeController as homeCtrl">
	<#include "modules/nav.ftl"/>

	<div class="ext-content" ng-if="homeCtrl.getCurrentNavItem() == 'add'">
		<#include "sections/add.ftl"/>
	</div>

	<div class="ext-content" ng-show="homeCtrl.getCurrentNavItem() == 'history'" ng-init="homeCtrl.getHistoryData()">
		<#include "sections/history.ftl"/>
	</div>

	<div class="ext-content" ng-if="homeCtrl.getCurrentNavItem() == 'statistics'">
		<#include "sections/statistics.ftl"/>
	</div>

</md-content>
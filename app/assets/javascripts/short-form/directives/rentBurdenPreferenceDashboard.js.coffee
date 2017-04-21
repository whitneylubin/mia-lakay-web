angular.module('dahlia.directives')
.directive 'rentBurdenPreferenceDashboard', ->
  scope: true
  templateUrl: 'short-form/directives/rent-burden-preference-dashboard.html'

  link: (scope, elem, attrs) ->
    scope.title = attrs.title
    scope.description = attrs.translatedDescription
    scope.preference = attrs.preference
    scope.pref_data_event = attrs.dataevent

App.ApplicationView = Em.View.extend({
  templateName: 'app/templates/application'
});
App.ChartsView = Em.View.extend({
  templateName: 'app/templates/charts'
});App.ChartView = Em.View.extend({
  templateName: 'app/templates/chart'
});App.EditChartView = Ember.View.extend({
  templateName: 'app/templates/edit_chart',
  tagName: 'form',
  classNames: 'form-horizontal',

  didInsertElement: function() {
    this._super();
    this.$('input:first').focus();
  },

  submit: function(event) {
    event.preventDefault();
    this.get('controller').updateRecord();
  }
});App.ShowChartInListView = Em.View.extend({
  templateName: 'app/templates/show_chart_in_list',
  tagName: 'li',
  classNameBindings: 'isActive:active',

  isActive: function() {
    var id = this.get('content.id'),
        currentPath = App.router.get('currentState.path');

    if (id) {
      return App.get('router.chartController.content.id') === id &&
             currentPath.indexOf('charts.chart') > -1;
    } else {
      return currentPath.indexOf('charts.newChart') > -1;
    }
  }.property('App.router.currentState', 'App.router.chartController.content')
});
App.ShowChartView = Em.View.extend({
  templateName: 'app/templates/show_chart',
  classNames: 'chart-details'
});

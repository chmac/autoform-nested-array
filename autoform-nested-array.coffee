if Meteor.isClient
  Template.form.helpers
    name: ->
      Names.findOne()

App.LeadEditController = Ember.ObjectController.extend
  actions:
    saveChanges: ->
      @get("model").save().then =>
        @transistionToRoute "lead"

    cancel: ->
      @get("model").rollback()
      @transistionToRoute "lead"


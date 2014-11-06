###Ember Rails setup
    # -n Names app; --javascript-engine Sets JS or CoffeeScript
    rails g ember:bootstrap -n App --javascript-engine coffee
    
    # Install specific versions
    rails g ember:install --tag=v1.5.0 --ember
    rails g ember:install --tag=v1.0.0-beta.7 --ember-data
    
    # config/environments/test.rb
    config.ember.variant = :development

    # config/environments/development.rb
    config.ember.variant = :development

    # config/environments/production.rb
    config.ember.variant = :production

    # application.js.coffee
    #= require jquery_ujs

    # add js/templates/application.js.emblem (or application.hbs)

###Ember Objects
someObject = Ember.Object.create()  "new/initialize"
someObject.get("someProperty")

App.NewClass = Ember.Object.extend()  "subclass"
App.NewClass.reopen( new properties etc )
App.NewClass.reopenClass(add class properties)  "App.NewClass.property()"

All objects call "init()" on creation; call @_super() if overriding

###Computed properties and observers
App.Obj = Ember.Object.extend
  normalProp: "hey"
  compProp: ( -> alert @get("normalProp") ).property("normalProp")
  someObserver: ( -> do something when normalProp changes ).observes("normalProp")

//computed alias; these functions do the same thing; Em is alias for Ember
  prop: ( -> @get("controller.prop") ).property("controller.prop")
  prop: Em.computed.alias "controller.prop"

###Routing
@route "some"
  Pathflow -> 
    App.SomeRoute      (routes/some.js) 
    App.SomeController (controllers/some.js) 
    App.SomeView       (views/some.js)
    some_template.js.emblem (templates/)

If any of those objects don't exist, Ember creates them automatically

###Routes (controller setup should be done in route object)
Ember.Route
hooks: 
  beforeModel(transition)
  model(params, transition)  => promise => DS.RecordArray
  afterModel(model, transition)
  activate
  setupController(controller, model)
  deactivate

###Controllers (functions, properties, observers)
Ember.ObjectController (when fetching one model)
Ember.ArrayController  (when fetching many models)
Ember.Controller       (when fetching no models)
action handlers for templates in actions {}

###Views (wraps template in div (default) and sets id)
hooks:
  willInsertElement()       //before view is inserted into DOM
  didInsertElement()
  willDestroyElement()      //before view is removed from DOM
@get("controller.property") //gets view's controller property
tagName: "article"          //sets the wrapper type (p, ul, header...)
classNames: ["names", ...]  //adds classes to wrapper 
classNameBindings:

###Mixins
/mixins/extraction.js.coffee
App.Extraction = Ember.Mixin.create
  extractedFunction: -> ...
App.SomeController = Ember.ObjectController.extend App.Extraction,
  ...


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

###Routing
@route "something"
  Pathflow -> 
    SomethingRoute      (routes/something.js) (App.SomethingRoute = Ember.Route.extend)
    SomethingController (controllers/something.js)
    SomethingView       (views/something.js)
    something.js.emblem (templates/)

If any of those objects don't exist, Ember creates them automatically

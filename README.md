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
Exs:
  Em.computed.equal "some.prop", "cat" // same as: if @get("some.prop") is "cat"

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
action handlers for templates in actions object

###Views (wraps template in div (default) and sets id)
TypeView looks for template name type.hbs
hooks:
  willInsertElement()       //before view is inserted into DOM
  didInsertElement()
  willDestroyElement()      //before view is removed from DOM
@get("controller.property") //gets view's controller property
@get("element")             //gets the current element 
@$(".someSelector")         //gets selected element and wraps it in jQuery

Properties:
tagName: "article"          //sets the wrapper type (p, ul, header...)
classNames: ["names", ...]  //adds classes to wrapper 
templateName: "someTemplate"  // looks for someTemplate.hbs

Bindings:
classNameBindings: ["className"]
classNameProp: function return value  // if true => class="classNameProp"
                                      // if not boolean => class="returnValue"
  Shortcut boolean syntax:
  classNameBindings: ["isCat:meow:woof"]
  isCat: Em.computed.equal "some.prop", "cat"  // if true => class="meow" else "woof"

attributeBindings: ["someAttr"] OR ["propName:attrName"]
someAttr: return value   // => someAttr=value
propName: return value   // => attrName=value

Event Handlers: listeners are applied to the entire view (see docs for all events)
click: -> someAction   // fires some action on click

###Templates (handlebars examples)
Name: {{nameProp}}       // controller property
Name: {{view.nameProp}}  // view property
Handlebars does not allow && or || in if conditionals

Loops: this refers to each element; this is implicit in emblem
hbs                       emblem
{{#each users}}           each users
  {{this.userProp}}         userProp
{{/each}}

{{#each user in users}}   each user in users   
  {{user.userProp}}         user.userProp
{{/each}}
(each element in controller) //ArrayController

Helpers: (all in emblem syntax)
Renders a specified template inside the current template
render "user"   // instantiates UserController > UserView > user.js.emblem
view "user"     // starts at UserView; skips controller
partial "user"  // renders just user.js.emblem; skips view and controller
link-to "user" userModel  // transistions to a new route

Actions:
h1 click="tickle"   // calls tickle method in controller.actions object on click

###Mixins
/mixins/extraction.js.coffee
App.Extraction = Ember.Mixin.create
  extractedFunction: -> ...
App.SomeController = Ember.ObjectController.extend App.Extraction,
  ...

###Ember Data (types: string, number, boolean, date)
App.SomeModel = DS.Model.extend
  firstName: DS.attr("data type")

DS.Model: save(), rollback(), destroyRecord()
Creating a DS.Model instance: 
  @store.createRecord("someModel", attr1: "hey", ...)

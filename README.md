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


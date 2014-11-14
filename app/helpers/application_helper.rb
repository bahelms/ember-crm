module ApplicationHelper
  def load_ember_app(load_app = false)
    javascript_include_tag "ember_app"
  end
end

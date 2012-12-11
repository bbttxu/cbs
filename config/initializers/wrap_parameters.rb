# Be sure to restart your server when you modify this file.
#
# This file contains settings for ActionController::ParamsWrapper which
# is enabled by default.

# Enable parameter wrapping for JSON. You can disable this by setting :format to an empty array.
ActiveSupport.on_load(:action_controller) do
  # FIXME don't need in ruby 1.9
  # http://stackoverflow.com/questions/10826183/syntax-error-when-trying-to-start-rails-server
  wrap_parameters  :format => [:json]
end

# Disable root element in JSON by default.
ActiveSupport.on_load(:active_record) do
  self.include_root_in_json = false
end

Mobilicious
==========

A very simple rails gem - adds the might_be_mobile method to ActionController::Base.

Call it from any of your controllers (though usually just from application controller),
and it will make the controller method `is_mobile?` available, and declare it a helper
(so it can be used from views).

More features are incoming as I learn how to interact with the rails template path resolvers.

Example
=======

```ruby
class ApplicationController < ActionController::Base
  might_be_mobile
end
```

The most common usage of `is_mobile?` is to add an extra stylesheet for mobile users:

```haml
# layouts/application.haml.html

%html
  %head
    %meta{ :charset => 'utf-8' }
    = stylesheet_link_tag('screen.css', :media => 'screen, projection')
    = stylesheet_link_tag('mobile.css', :media => 'screen, projection') if is_mobile?

```


Copyright (c) 2011 Eric Mueller, released under the MIT license

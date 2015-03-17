Deface::Override.new( name: ‘assasinate_the_spree_logo’,
              virtual_path: ‘spree/shared/_header’,
                replace_contents: ‘#logo’,
                text: “<%= image_tag ‘logohd.png’ %>”)
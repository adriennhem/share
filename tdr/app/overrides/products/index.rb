Deface::Override.new(:virtual_path  => "spree/products/index",
                     :insert_top => "[data-hook='homepage_products']",
                     :text          => "<p>Registration is the future!</p>",
                     :name          => "registration_good")


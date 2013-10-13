require 'test_helper'

class MenuTest < ActiveSupport::TestCase

  fixtures :menus

  def new_menu(image_url)
    Menu.new( restaurant_name: "Lorem ipsum",
              description: "Japanese",
              image_url: image_url)
  end

  test "menu attributes must not be empty" do
    menu = Menu.new
    assert menu.invalid?
    assert menu.errors[:restaurant_name].any?
    assert menu.errors[:description].any?
    assert menu.errors[:image_url].any?
  end

  test "image_url must end in jpg, gif, or png" do
    valid = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif }
    invalid = %w{ fred.doc fred.gif/more fred.gif.more }

    valid.each do |name|
      assert new_menu(name).valid?, "#{name} must be valid"
    end

    invalid.each do |name|
      assert new_menu(name).invalid?, "#{name} shouldn't be valid"
    end
  end

  test "restaurant_name must be unique" do
    menu = Menu.new(  restaurant_name:  menus(:micks).restaurant_name,
                      description:      "Japanese",
                      image_url:        "lorem.jpg")
    assert menu.invalid?
    assert_equal ["has already been taken"], menu.errors[:restaurant_name]
  end
end

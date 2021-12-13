require "application_system_test_case"

class AddBeveragesTest < ApplicationSystemTestCase
  setup do
    @user3 = users(:user3)
    @chair1 = chairs(:chair1)
  end

  test "Add beverage test" do
    #login with user3
    visit login_url
    fill_in "Username", with: @user3.username
    fill_in "Password", with: 'testtest'
    click_button "Login"

    #Add to inventory
    click_button "Add beverage", match: :first
    assert_text "Add beverage to inventory successfully."

    #go to inventory page
    click_on "Inventory"
    assert_text "Total amount 15 bahts."
  end

  test "Remove beverage test" do 
    #login with user3
    visit login_url
    fill_in "Username", with: @user3.username
    fill_in "Password", with: 'testtest'
    click_button "Login"

    #Add to inventory
    click_button "Add beverage", match: :first
    assert_text "Add beverage to inventory successfully."

    #go to inventory and remove ticket
    click_on "Inventory"
    click_button "Remove beverage", match: :first
    assert_text "Remove beverage from inventory successfully."
  end
end 
require "application_system_test_case"

class BookingsTest < ApplicationSystemTestCase
  setup do
    @user3 = users(:user3)
    @chair1 = chairs(:chair1)
  end

  test "Booking test" do
    #login with user3
    visit login_url
    fill_in "Username", with: @user3.username
    fill_in "Password", with: 'testtest'
    click_button "Login"

    #Add to inventory
    select "test1", :from => "Chair", match: :first
    click_button "Add to inventory", match: :first
    assert_text "Add to inventory successfully."

    #go to inventory page
    click_on "Inventory"
    assert_text "Total amount 200 bahts."
  end

  test "Remove ticket test" do 
    #login with user3
    visit login_url
    fill_in "Username", with: @user3.username
    fill_in "Password", with: 'testtest'
    click_button "Login"

    #Add to inventory
    select "test1", :from => "Chair", match: :first
    click_button "Add to inventory", match: :first
    assert_text "Add to inventory successfully."

    #go to inventory and remove ticket
    click_on "Inventory"
    click_button "Remove", match: :first
    assert_text "Remove from inventory successfully."
  end

  test "Check out test" do
    #login with user3
    visit login_url
    fill_in "Username", with: @user3.username
    fill_in "Password", with: 'testtest'
    click_button "Login"

    #Add to inventory
    select "test1", :from => "Chair", match: :first
    click_button "Add to inventory", match: :first
    assert_text "Add to inventory successfully."

    #go to inventory
    click_on "Inventory"

    #check out
    click_on "Check out"
    assert_text "Done"
  end
end 
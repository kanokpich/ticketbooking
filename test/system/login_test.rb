require "application_system_test_case"

class LoginsTest < ApplicationSystemTestCase
  setup do
    @user1 = users(:user1)
    @user2 = users(:user2)
  end

  test "user1 login success" do
    visit login_url
    fill_in "Username", with: @user1.username
    fill_in "Password", with: '123'
    click_button "Login"
    assert_text "Login successfully"
  end

  test "user2 login success" do
    visit login_url
    fill_in "Username", with: @user2.username
    fill_in "Password", with: 'test'
    click_button "Login"
    assert_text "Login successfully"
  end

  test "user1 login with wrong password" do
    visit login_url
    fill_in "Username", with: @user1.username
    fill_in "Password", with: 'asdasdasdasdas'
    click_button "Login"
    assert_text "Invalid Email or Password. please try again"
  end

  test "user1 login but not enter password" do
    visit login_url
    fill_in "Username", with: @user1.username
    click_button "Login"
    assert_text "Invalid Email or Password. please try again"
  end

  test "user1 login but not enter email" do
    visit login_url
    fill_in "Password", with: '123'
    click_button "Login"
    assert_text "Invalid Email or Password. please try again"
  end

  test "user1 login but not enter anything" do
    visit login_url
    click_button "Login"
    assert_text "Invalid Email or Password. please try again"
  end

end
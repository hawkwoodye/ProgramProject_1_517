require "spec_helper"

describe "Logging In" do
  it "logs the user in and goes to the todo lists" do
    User.create(name: "Mike", email: "jason@teamtreehouse.com", password: "1234", password_confirmation: "1234")
    visit "/"
    click_link "Log In"
    fill_in "Email Address", with: "mike@test.com"
    fill_in "Password", with: "1234"
    click_button "Log In"
    
    expect(page).to have_content("Todo Lists")
    expect(page).to have_content("Thanks for logging in!")
  end

  it "diplays the email address in the event of a failed login" do
    visit new_user_session_path
    fill_in "Email Address", with: "mike@test.com"
    fill_in "Password", with: "incorrect"
    click_button "Log In"

    expect(page).to have_content("Please check your email and password")
    expect(page).to have_field("Email Address", with: "mike@test.com")
  end
end
When /^I try to login using WordPress App/ do
  $wait.until { $driver.find_element(:id, "Log In").displayed? }
  $driver.find_element(:id, "Log In").click
end
 
When("I type in {string} in the email field") do |search_keyword|
  $wait.until { $driver.find_element(:id, "Email address").displayed? }
  search_box = $driver.find_element(:id, "Email address")
  search_box.send_key(search_keyword)

  $wait.until { $driver.find_element(:id, "Next").displayed? }
  $driver.find_element(:id, "Next").click
end
 
Then /^I should get a registration error$/ do
  sleep 5
  text_elements = $driver.find_elements(:xpath, "//XCUIElementTypeStaticText")
  text_elements.size.should > 0

  error_element = text_elements.select { |element| element.text.match(/not registered/) }.first
  error_element.text.should include("not registered on WordPress.com")
end




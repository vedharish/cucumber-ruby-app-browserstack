When /^I start test on the Local Sample App/ do
  $wait.until { $driver.find_element(:id, "TestBrowserStackLocal").displayed? }
  $driver.find_element(:id, "TestBrowserStackLocal").click
end

Then("I should see {string}") do |match_string|
  sleep 5
  $wait.until do
    ret_value = true
    elem = $driver.find_element(:id, "ResultBrowserStackLocal")
    ret_value = false if elem.nil?
    value = elem.attribute("value") if !ret_value
    !value.nil? && value.size > 0
  end
  result_text = $driver.find_elements(:id, "ResultBrowserStackLocal").text.downcase

  result_text.should include("The active connection is wifi.")
  result_text.should include("Up and running")
end

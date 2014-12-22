require 'calabash-android/calabash_steps'

When(/^I load new password$/) do
  file = File.open("/tmp/password")
  contents = ""
  file.each {|line|
    contents << line
  }
  puts contents
  $new_password = contents
end

When(/^I puts new password$/) do
  puts $new_password
end

Then /^I enter ([^\"]*) into input field number (\d+)$/ do |text, index|
  if ( text == "New Password" )
    text = $new_password
  end
  puts text
  enter_text("android.widget.EditText index:#{index.to_i-1}", text)
end
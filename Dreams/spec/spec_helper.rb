# This file was generated by the `rails generate rspec:install` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# The generated `.rspec` file contains `--require spec_helper` which will cause this
# file to always be loaded, without a need to explicitly require it in any files.
#
# Given that it is always loaded, you are encouraged to keep this file as
# light-weight as possible. Requiring heavyweight dependencies from this file
# will add to the boot time of your test suite on EVERY test run, even for an
# individual file that may not need all of that loaded. Instead, consider making
# a separate helper file that requires the additional dependencies and performs
# the additional setup, and require it from the spec files that actually need it.
#
# The `.rspec` file also contains a few flags that are not defaults but that
# users commonly want.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`
    # and `failure_message` of custom matchers include text for helper methods
    # defined using `chain`, e.g.:
    # be_bigger_than(2).and_smaller_than(4).description
    #   # => "be bigger than 2 and smaller than 4"
    # ...rather than:
    #   # => "be bigger than 2"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end


end

def sign_up(username)
  visit "/users/new"
  fill_in "username", with: username
  fill_in "password", with: 'password'
  click_button 'Create User'
end

def sign_up_as_claire
  sign_up("claire")
end

def sign_up_as_kareem
  sign_up("kareem")
end

def sign_in(username)
  visit '/session/new'
  fill_in "username", with: username
  fill_in "password", with: 'password'
  click_button 'Sign In'
end

def make_goal(title = nil, description = nil, is_private = false, completed = false)
  title ||= "my title"
  description ||= "my description"

  visit "/goals/new"
  fill_in 'Title', with: title
  fill_in 'Description', with: description
  choose("goal_completed_#{completed}")
  choose("goal_private_#{is_private}")
  click_button 'Create Goal!'
end

def edit_goal(title = nil, description = nil)
  title ||= "New Title"
  description ||= "New description"

  visit "/goals/1/edit"
    fill_in 'Title', with: title
    fill_in 'Description', with: description
  click_button 'Edit Goal!'
end


def make_comment(body = nil)
  body ||= "Great comment"

  visit "/users/1"
    fill_in 'Comment', with: body
  click_button 'Add Comment'
end

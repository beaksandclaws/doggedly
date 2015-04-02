require 'factory_girl'
require 'devise'
require 'support/controller_macros'

RSpec.configure do |config|

  config.include ControllerMacros, type: :controller
  config.include ControllerMacros, type: :view

  config.after(:each) do
    if Rails.env.test?
      FileUtils.rm_rf("#{Rails.root}/spec/support/uploads")
    end
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # print top 5 slowest examples/example groups
  config.profile_examples = 5

  # allow more verbose output when running individual spec file
  if config.files_to_run.one?
    # Use the documentation formatter for detailed output
    config.default_formatter = 'doc'
  end

end

require 'simplecov'
SimpleCov.start

# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")

  def test_data
    # Shelters
    @shelter1 = Shelter.create!(name: 'Helping Paws Animal Shelter', city: 'Denver', rank: 3, foster_program: true)
    @shelter2 = Shelter.create!(name: 'Muddy Claws Animal Shelter', city: 'Minneapolis', rank: 1, foster_program: false)
    @shelter3 = Shelter.create!(name: 'Floppy Ears Animal Shelter', city: 'Fort Collins', rank: 4, foster_program: true)
    @shelter4 = Shelter.create!(name: 'Sleepy Cat Animal Shelter', city: 'Naperville', rank: 2, foster_program: false)

    # Pets
    @pet1 = @shelter1.pets.create!(name: 'Leo', breed: 'Pomeranian', age: '1', adoptable: true)
    @pet2 = @shelter1.pets.create!(name: 'Collins', breed: 'Tabby', age: '12', adoptable: true)
    @pet3 = @shelter1.pets.create!(name: 'Ferdinand', breed: 'Pitbull', age: '4', adoptable: true)
    @pet4 = @shelter2.pets.create!(name: 'Hobbes', breed: 'Mixed', age: '3', adoptable: true)
    @pet5 = @shelter2.pets.create!(name: 'Gowan', breed: 'Fox', age: '3', adoptable: true)
    @pet6 = @shelter2.pets.create!(name: 'Nigel', breed: 'Goldendoodle', age: '2', adoptable: true)
    @pet8 = @shelter3.pets.create!(name: 'Winston', breed: 'Border Collie mix', age: '5', adoptable: true)
    @pet9 = @shelter3.pets.create!(name: 'Gowan', breed: 'Fox', age: '3', adoptable: true)
    @pet10 = @shelter3.pets.create!(name: 'Thor', breed: 'Cattle Dog', age: '10', adoptable: true)
    @pet11 = @shelter3.pets.create!(name: 'Luna', breed: 'Tabby', age: '3', adoptable: true)
    @pet12 = @shelter4.pets.create!(name: 'Freyja', breed: 'Calico', age: '2', adoptable: true)

    # Applications
    @app1 = Application.create!(name: 'Grace Joh',
                                street_address: '1949 Bark St',
                                city: 'Minneapolis',
                                state: 'MN',
                                zipcode: '55414',
                                home_description: 'I am super nice to animals.',
                                status: 'In Progress')
    @app2 = Application.create!(name: 'Logan Cole',
                                street_address: '1459 Catnap St',
                                city: 'Dallas',
                                state: 'TX',
                                zipcode: '75072',
                                home_description: 'I love all cats!',
                                status: 'In Progress')
    @app3 = Application.create!(name: 'Alec Kapicak',
                                street_address: '312 Meow Ln',
                                city: 'Chicago',
                                state: 'IL',
                                zipcode: '55414',
                                home_description: 'Seriously, I really really want this animal.',
                                status: 'In Progress')
    @app4 = Application.create!(name: 'Crow Rising',
                                street_address: '7463 Quack Dr',
                                city: 'Las Vegas',
                                state: 'NV',
                                zipcode: '55414',
                                home_description: 'ITS SO FLUFFY IM GOING TO DIE!',
                                status: 'In Progress')
    @app5 = Application.create!(name: 'Sean Cowans',
                                street_address: '9293 puppy chow Ct',
                                city: 'Denver',
                                state: 'CO',
                                zipcode: '55414',
                                home_description: 'My dog needs a sibling',
                                status: 'In Progress')

    # Application Pets
    @app_pet1 = ApplicationPet.create!(application: @app1, pet: @pet1)
    @app_pet2 = ApplicationPet.create!(application: @app1, pet: @pet2)
    @app_pet3 = ApplicationPet.create!(application: @app2, pet: @pet3)
    @app_pet4 = ApplicationPet.create!(application: @app3, pet: @pet10)
    @app_pet5 = ApplicationPet.create!(application: @app3, pet: @pet11)
    @app_pet6 = ApplicationPet.create!(application: @app3, pet: @pet12)
    @app_pet7 = ApplicationPet.create!(application: @app4, pet: @pet3)
    @app_pet8 = ApplicationPet.create!(application: @app4, pet: @pet5)
  end
end

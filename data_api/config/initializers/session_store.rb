# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_data_api_session',
  :secret      => 'f499aafa8811d3a82beaf2b57e24d7b68538380304c9e575e024dd1f4f79c246545496c0d0361f3b6a023bb3b9471cd68565d44d871f4056f9d880ca021a1890'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

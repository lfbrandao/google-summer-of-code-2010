# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_main_app_session',
  :secret      => '375bb3d345c72ccecdbc0941ed7d0a02a827da066a792b11bb3b7d31cca7128982f30b7f588905fc39f5dad308c72c02bd477441f34d7f30228406c4e8b6e7c6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

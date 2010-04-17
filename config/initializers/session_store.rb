# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_omgitsfood_session',
  :secret      => 'd432d7115933c92cc61d773af02e13a26c6785d06b3c8c320ff331d378dd3a1a6ec77300895498734abceefd099a3af8ee94e7bc8cac189b4cc9abf56877e549'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

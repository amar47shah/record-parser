$LOAD_PATH.unshift(File.expand_path('../lib', __FILE__))
require 'api'

default_store = File.open('data/records.txt')
API::Store.file = default_store
run API::Base
at_exit { default_store.close }

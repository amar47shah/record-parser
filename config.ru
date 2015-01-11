$LOAD_PATH.unshift(File.expand_path('../lib', __FILE__))
require 'api'

default_file = File.open('data/records.txt')
API::Store.file = default_file
run API::Base
at_exit { default_file.close }

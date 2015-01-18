$LOAD_PATH.unshift(File.expand_path('../lib', __FILE__))
require 'api'

file = File.open('data/records.txt', 'a+')
at_exit { file.close }

API::Store.file = file
run API::Base

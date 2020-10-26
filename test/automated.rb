require_relative "../load_path"

require "test_bench"
require "pry-byebug"

::TestBench.activate
::TestBench::Run.("test/automated")

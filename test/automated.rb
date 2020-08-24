require_relative "../load_path"

require "test_bench"

::TestBench.activate
::TestBench::Run.("test/automated")

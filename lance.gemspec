require_relative 'lib/lance/version'

Gem::Specification.new do |spec|
  spec.name          = "lance"
  spec.version       = Lance::VERSION
  spec.authors       = ["Francesco Belladonna"]
  spec.email         = ["francesco@fc5.me"]

  spec.summary       = %q{Lance, a ruby logger with tagging and structured data support}
  spec.description   = %q{Lance, a ruby logger with tagging and structured data support}
  spec.homepage      = "https://github.com/Fire-Dragon-DoL/lance"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.5.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org/"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "pry-byebug", ">= 3"
  spec.add_development_dependency "test_bench", ">= 1"
  spec.add_development_dependency "rake", ">= 12"
end

module Lance
  path = File.expand_path("../../VERSION", __dir__)
  VERSION = File.read(path).strip
end

def reload!
  Object.send(:remove_const, :ProjectNamespace)
  path = File.expand_path("../", __FILE__)
  Dir.glob("#{path}/**/*.rb") { |f| load f }
end
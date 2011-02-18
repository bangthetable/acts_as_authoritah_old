# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{acts_as_authoritah}
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["BangTheTable","Unnikrishnan KP"]
  s.date = %q{2010-08-10}
  s.description = %q{role based access rights for a user specified via spreadsheet}
  s.email = %q{devteam@bangthetable.com, unni.tallman@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "acts_as_authoritah.gemspec",
     "lib/acts_as_authoritah.rb",
     "lib/loader.rb",
     "lib/handler.rb",
     "lib/access_rights.rb",
     "lib/custom_exceptions.rb",
     "test/acts_as_authoritah_test.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{https://github.com/bangthetable/acts_as_authoritah/}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{role based access rights for a user specified via spreadsheet}
  s.test_files = [
    "test/acts_as_authoritah_test.rb",
     "test/test_helper.rb"
  ]

  #s.add_dependency(%q<spreadsheet>, [">= 0"])
      
end

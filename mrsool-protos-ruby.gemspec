# -*- encoding: utf-8 -*-
# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = 'mrsool-protos'
  spec.version = '1.0.0'
  spec.authors = ['Mrsool Team']
  spec.email = ['dev@mrsool.com']
  spec.description = 'Ruby protobuf definitions for Mrsool services'
  spec.summary = 'Generated Ruby protobuf files for Mrsool backend services'
  spec.homepage = 'https://github.com/mrsool/mrsool-protos'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.7.0'

  # Include all generated Ruby protobuf files
  spec.files = Dir['gen/ruby/**/*.rb']
  spec.require_paths = ['gen/ruby']

  # Dependencies
  spec.add_dependency 'grpc', '~> 1.50'
  spec.add_dependency 'google-protobuf', '~> 3.21'

  # Development dependencies
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.12'

  # Metadata
  spec.metadata = {
    'bug_tracker_uri' => 'https://github.com/mrsool/mrsool-protos/issues',
    'homepage_uri' => 'https://github.com/mrsool/mrsool-protos',
    'source_code_uri' => 'https://github.com/mrsool/mrsool-protos'
  }
end

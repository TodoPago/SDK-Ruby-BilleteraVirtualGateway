Gem::Specification.new do |s|
  s.name = 'BVGConector'
  s.version = '1.0.0'
  s.date = '2017-03-07'
  s.summary="test conector"
  s.description = "Conector para la plataforma de pagos"
  s.authors = ["Softtek"]
  s.files = ["lib/bvg_conector.rb"]
  s.add_runtime_dependency "rest-client", ["= 1.8.0"]
  s.add_runtime_dependency "json"
end

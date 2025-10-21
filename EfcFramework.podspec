Pod::Spec.new do |s|
  s.name             = "EfcFramework"
  s.version          = "1.0.0"
  s.summary          = "Framework binario de utilidades creado por Eduardo Fulgencio"
  s.description      = <<-DESC
    EfcFramework contiene funciones y utilidades comunes compiladas en un framework binario (.xcframework).
  DESC
  s.homepage         = "https://github.com/efulgencio/EfcFramework"
  s.license          = { :type => "MIT" }
  s.author           = { "Eduardo Fulgencio" => "eduardofulgenciocomendeiro@gmail.com" }

  s.platform         = :ios, "15.0"
  s.swift_version    = "5.9"

  # Origen del repositorio
  s.source = { :git => "https://github.com/efulgencio/EfcFramework.git", :tag => s.version.to_s }

  # Framework binario incluido
  s.vendored_frameworks = "EfcFramework.xcframework"

  # Compatibilidad arquitecturas
  s.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386'
  }

  # Evitar conflictos de sandbox y firmas
  s.preserve_paths = "EfcFramework.xcframework"
  s.static_framework = true
  
end


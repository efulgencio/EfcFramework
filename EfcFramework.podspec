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

  # Indica el origen del repositorio o la ruta local
  s.source = { :git => "https://github.com/efulgencio/EfcFramework.git", :tag => s.version.to_s }

    # Ruta al framework binario dentro del repo
    s.vendored_frameworks = "EfcFramework.xcframework"

  # Dependencias del sistema, si las hay
  # s.framework        = "Foundation"
    # ⚙️ Opcional pero recomendable: compatibilidad con bitcode y simulador/dispositivo
  s.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386'
  }

  # ✅ Evita la re-firma automática o conflictos de sandbox
  s.preserve_paths = "EfcFramework.xcframework"
  s.static_framework = true

  # 🧩 Copia manual para evitar el error "Sandbox: rsync deny"
  s.script_phase = {
    :name => 'Manual Copy EfcFramework',
    :script => <<-SCRIPT
      echo "➡️ Copiando manualmente EfcFramework.framework..."
      cp -R "${PODS_ROOT}/EfcFramework/EfcFramework.xcframework/ios-arm64-simulator/EfcFramework.framework" "${TARGET_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}/"
      echo "✅ Copia completada"
    SCRIPT
    ,
    :execution_position => :before_compile
  }

end

//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <flutter_any_logo/flutter_any_logo_plugin.h>
#include <rive_common/rive_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) flutter_any_logo_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FlutterAnyLogoPlugin");
  flutter_any_logo_plugin_register_with_registrar(flutter_any_logo_registrar);
  g_autoptr(FlPluginRegistrar) rive_common_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "RivePlugin");
  rive_plugin_register_with_registrar(rive_common_registrar);
}

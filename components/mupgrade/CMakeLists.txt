
set(COMPONENT_SRCS "mupgrade_check.c"
                    "mupgrade_node.c"
                    "mupgrade_root.c")

set(COMPONENT_INCLUDEDIRS "include")

idf_component_register(SRCS "${COMPONENT_SRCS}"
                    INCLUDE_DIRS "${COMPONENT_INCLUDEDIRS}"
                    REQUIRES mcommon mwifi esp_http_server app_update spi_flash app_update)
# Optional components: mespnow json mdns


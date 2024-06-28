# Changelog

# ESP-MDF Changelog

## v2.1.0 (28.06.2024)

### Features

- **mcommon:** Added Kconfig option `MDF_LOG_LEVEL_IDF_RUNTIME`, which makes MDF log level adjustable at runtime (using `esp_log_level_set("*", log_level)` so it is also the same as global system setting). Older options work as they did before - set static log level for MDF at build time, possibly making output binary smaller. [4c19fdd](https://github.com/mmrein/esp-mdf/commit/4c19fdd1e0d20198f0d6f645596c8f695bcbb5b5)
- Updated examples: function_demo/mwifi/no_router, root_on_ethernet [a89577b](https://github.com/mmrein/esp-mdf/commit/a89577bb98e67b3758bee6976e2d1fe99292739f)


## v2.0.0 (24.04.2024)

### Possibly breaking changes

- Add option to select WPA2 or WPA3 as mwifi auth mode, add auth_mode to mwifi_config_t struct. Minimum auth mode is now WPA2. WPA3 requires ESP-IDF v5.1+. [6e5399e](https://github.com/mmrein/esp-mdf/commit/6e5399e60c5deeb4beaa77c8815c4dbb2426aab6). **Note:** WPA3 still not possible as underlying ESP-WIFI-MESH does not actually support it, see https://github.com/espressif/esp-idf/issues/14095.
- Remove [problematic mupgrade firmware checks](https://github.com/espressif/esp-mdf/issues/303). It is recommended to use IDF builtin firmware checks and version fallback mechanisms instead. ([25e953a](https://github.com/mmrein/esp-mdf/commit/25e953a802438d5493fd8e1047a1e026df3f44d9) and [f4e8aea](https://github.com/mmrein/esp-mdf/commit/f4e8aea5ccbc11ed4e912b6b0127b7396e167536))
- Fix rssi threshoud vs threshold typos in mwifi, moved thresholds config to mwifi_init_config_t [b6c57a4](https://github.com/mmrein/esp-mdf/commit/b6c57a4205a3c75d7c52e9f9028eb8eac4718918)
- Removed Aliyun examples and components to simplify maintainability [2b5b61e](https://github.com/mmrein/esp-mdf/commit/2b5b61e958ed310eea908376e754fd363445882a)

### Other changes

- Supported IDF versions: v4.4.x, v5.0.x, v5.1.x, v5.2.x
- Supported targets: ESP32, ESP32-S2, ESP32-C3, ESP32-S3 (mainly [this commit](https://github.com/mmrein/esp-mdf/commit/6d92fc8a754ea3a773f0e8d1b56f63431118a4c0))
- Added `IDF_V4` and `IDF_V5` macros defines in [mdf_comon.h](components/mcommon/include/mdf_common.h) for conditional compile dependent on major IDF version [8cacc2c](https://github.com/mmrein/esp-mdf/commit/8cacc2ce472df887db12457dacfed5f6844ee5e6)
- Get [mdns](https://github.com/mmrein/esp-mdf/commit/00d85421b3a1a30ad01e4cf8c1b506fa0cab66b9) and [coap](https://github.com/mmrein/esp-mdf/commit/7fa32d02635b24b112ae5d6e2705c5f0296e6503) components from Espressif Component Registy if IDF v5+ is used, otherwise uses IDF v4.4 builtin version.
- Added option to disable miniz component includes in mwifi and mconfig (for testing purposes only if compression is not used, miniz should be kept included especially when mconfig is used) [387d82d](https://github.com/mmrein/esp-mdf/commit/387d82da9ee8653fa45b12c6e24372ed1dd684bc)
-  Added option to disable static config structure allocatio in mwifi (option is active by default) [5aa5e96](https://github.com/mmrein/esp-mdf/commit/5aa5e9698680bc57fa4ac41c472ba2159a74e816). In ussual use cases no project changes should be needed.
- Change default wifi channel to 11 instead of 13 in some examples [b31cd70](https://github.com/mmrein/esp-mdf/commit/b31cd709ac16a5cdbcb1d7ede0b8b8d5f164c90b)
- Moved miniz component from third_party subdir. Should not be breaking in most cases. [34dae8b](https://github.com/mmrein/esp-mdf/commit/34dae8b2fc3a6652e16a320efe65d58134d07ae5)
- Various component and include adjustments for IDF v5+ compatibility

### Bugfixes:

- Fix `ENV{MDF_PATH}` in CMakeLists.txt in examples [1fcb1af](https://github.com/mmrein/esp-mdf/commit/1fcb1af5162535e276f28be3757201d26518fc93)
- Fix setting EXTRA_COMPONENT_DIRS Variables as per [4.4 to 5.0 migration guide](https://docs.espressif.com/projects/esp-idf/en/v5.2.1/esp32/migration-guides/release-5.x/5.0/gcc.html#espressif-toolchain-changes) ([9f7222e](https://github.com/mmrein/esp-mdf/commit/9f7222ec483e1471a3b7e3dfe672aeccd5fc67b7))
- Replaced `int32_t` and `uint32_t` pront statements with `PRI-32` macros as per [4.4 to 5.0 migration guide](https://docs.espressif.com/projects/esp-idf/en/v5.2.1/esp32/migration-guides/release-5.x/5.0/gcc.html#espressif-toolchain-changes) for IDF v5+ compatibility
- Replaced `portTICK_RATE_MS` with `portTICK_PERIOD_MS` [55f9594](https://github.com/mmrein/esp-mdf/commit/55f9594dc834b2c4f834379109f4dcc9967f1f75) and [438c4e2](https://github.com/mmrein/esp-mdf/commit/438c4e22d5c6e5e419871ef3d262c99e05170ef3)
- Replaced `xTimerHandle` with `TimerHandle_t` [03b6e5c](https://github.com/mmrein/esp-mdf/commit/03b6e5cdbc2d40bd6ea6effc4fa37ea8a4e52746) and [438c4e2](https://github.com/mmrein/esp-mdf/commit/438c4e22d5c6e5e419871ef3d262c99e05170ef3)
- Replaced `xQueueHandle` with `QueueHandle_t` [41b5a14](https://github.com/mmrein/esp-mdf/commit/41b5a1494ca3e9f87414a2e2258f644951ba05d9)
- Update mconfig_security.c for mbedtls v3 (IDF v5), keeping compatibility with mbedtls v2 (IDF v4) [b52e594](https://github.com/mmrein/esp-mdf/commit/b52e594f0915ff2b4bf79f4085b29fb1508fd236)

### Tools

- Added `tools/build_all_examples.sh` and `tools/cleanup_all_examples.sh` for manual local builds

## v1.5.2-beta (23.04.2024)

- Some documentation update from upstream [dcc70f5](https://github.com/mmrein/esp-mdf/commit/dcc70f5cbac8f10d8b11b59fb13c4dc2ba3b3e29)

## v1.5.1-beta (20.03.2023)

- Update README [bf93056](https://github.com/mmrein/esp-mdf/pull/1/commits/bf9305645b739d01f73d2b501f389a56bc84f1d2)

- Change default Encryption to WPA2 instead of WPA in mwifi [acea5ff](https://github.com/mmrein/esp-mdf/pull/1/commits/acea5ff9e8665140ea664b1c9cebd7e374208f6e)
 
- Create mupgrade_version_fallback_task as pinned to selected MDF core which might prevent possible lockup [c1fed40](https://github.com/mmrein/esp-mdf/pull/1/commits/c1fed407f0043b953bedd4a666f21d539489a630)


## v1.5-rc (26.10.2021)

Marks state of official ESP-MDF (there was one [newer commit](https://github.com/mmrein/esp-mdf/commit/dcc70f5cbac8f10d8b11b59fb13c4dc2ba3b3e29), but it did not add anything towards MDF functionality, just docu update).

build-web:
BUILD_ENV ?= dev
ENV_FILE = .env.$(BUILD_ENV)
FVM_VERSION := $(shell jq -r '.flutter' .fvmrc)
FVM_FLUTTER := .fvm/flutter_sdk/bin/flutter

# Parse .env file to --dart-define args
define parse_env
$(shell cat $(ENV_FILE) | grep -v '^#' | xargs -I{} echo --dart-define={})
endef

# Optional: check if file exists
define check_env
	@if [ ! -f $(1) ]; then \
		echo "❌ ENV file $(1) not found"; \
		exit 1; \
	fi
endef

# Base command 
define build_web
  echo "FVM_VERSION: $(FVM_VERSION)" && \
	fvm use $(FVM_VERSION) --force && \
	${FVM_FLUTTER} config --enable-web && \
	${FVM_FLUTTER} build web \
		--release \
		--base-href="/" \
		$(call parse_env,$(1))
endef

define run_web
	fvm use $(FVM_VERSION) --force  && \
	${FVM_FLUTTER} run -d chrome \
		--web-hostname localhost \
		--web-port 8091 \
		--web-browser-flag "--disable-web-security" \
		--web-browser-flag "--ignore-certificate-errors" \
		$(call parse_env,$(1))

endef

build-web:
	$(call check_env,$(ENV_FILE))
	$(call build_web,$(ENV_FILE))

run-web:
	$(call check_env,$(ENV_FILE))
	$(call run_web,$(ENV_FILE))

locale:
	fvm dart run easy_localization:generate -S "lib/assets/translations" -O "lib/assets/translations/generated" -o "locale_keys.g.dart" -f keys
run-test:
	fvm flutter test --platform chrome

PREFIX ?= /usr
BINDIR ?= $(PREFIX)/bin
TARGET := $(BINDIR)/xprintidle
SRC    := ./xprintidle-wayland-shim
DEP    := swayidle

INSTALL_CMD := install -o root -g root -m 755 "$(SRC)" "$(TARGET)"

print:
	@echo "source:      $(SRC)"
	@echo "install to:  $(TARGET)"
	@echo "dependency:  $(DEP)"

check:
	@test -n "$(SRC)"    || { echo "error: SRC not set"; exit 1; }
	@test -n "$(TARGET)" || { echo "error: TARGET not set"; exit 1; }
	@test -n "$(DEP)"    || { echo "error: DEP not set"; exit 1; }
	@test -f "$(SRC)"    || { echo "error: $(SRC) not found"; exit 1; }
	@command -v $(DEP) >/dev/null 2>&1 || { \
		echo "error: required dependency '$(DEP)' not found in PATH"; \
		exit 1; \
	}

require-root:
	@id -u | grep -qx 0 || { \
		echo "error: must be root (or run via sudo)"; \
		exit 1; \
	}

install: check require-root
	@if [ -e "$(TARGET)" ]; then \
		echo "error: $(TARGET) already exists! It might be part of an old X11 install."; \
		echo "       Remove it with your package manager or with 'make uninstall'."; \
		echo "       Alternatively, you can use 'make replace' to re-install this shim by force."; \
		exit 1; \
	fi
	@$(INSTALL_CMD)

replace: check require-root
	@$(INSTALL_CMD)

uninstall: require-root
	rm -f "$(TARGET)"

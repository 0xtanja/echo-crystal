.PHONY: build
build: echo

echo:
	crystal build -p -t --verbose --error-trace -o $@ src/echo.cr

.PHONY: clean
clean:
	rm -f echo || true

.PHONY: run
run:
	crystal run src/echo.cr

build:
	@zig build-exe app.zig

clean:
	@rm -f app app.o

sign:
	@codesign -f -s "codesigningcert" app

verify:
	@codesign --verify --deep --strict --verbose=2  app | true

env:
	@echo "Zig version: $$(zig version)"
	@echo ""
	@echo "OS:"
	@sw_vers
	@echo ""
	@echo "CPU:"
	@sysctl -n machdep.cpu.brand_string
	@uname -m

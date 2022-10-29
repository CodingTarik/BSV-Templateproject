build_dir=build
output_dir=output
module=Testbench
file=$(module).bsv
flags=""
start:
	@mkdir -p $(build_dir)
	@mkdir -p $(output_dir)
	@echo "Compiling module mk$(module) in file $(file) to build directory ./$(build_dir)"
	bsc -bdir $(build_dir) -simdir $(build_dir) -vdir $(build_dir) -show-schedule -D $(flags) -u -sim -g mk$(module) $(file)
	@echo "Linking module mk$(module) to output directory ./$(output_dir)"
	bsc -bdir $(build_dir) -simdir $(build_dir) -vdir $(build_dir) -u -sim -e mk$(module) -o ./$(output_dir)/RUN_DEVICE

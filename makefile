build_dir=build
output_dir=output
start:
	mkdir -p $(build_dir)
	mkdir -p $(output_dir)
	echo "Compiling"
	bsc -bdir $(build_dir) -simdir $(build_dir) -vdir $(build_dir) -show-schedule -u -sim -g mkTestbench Testbench.bsv
	echo "Linking"
	bsc -bdir $(build_dir) -simdir $(build_dir) -vdir $(build_dir) -u -sim -e mkTestbench -o ./$(output_dir)/RUN_DEVICE
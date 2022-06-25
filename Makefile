


all: out/* out/DIAG/*

# All dependencies of disassemble.py
out/disassemble.stamp: disassemble.py wecb.py cpu6.py cpu6_addr.py cpu6_regs.py generic.py
	@touch $@

out/DIAG/f1.asm: out/disassemble.stamp disassemble_f1.py diag_common.py
	python3 disassemble_f1.py > out/DIAG/f1.asm

out/DIAG/f2.asm: out/disassemble.stamp disassemble_f2.py diag_common.py
	python3 disassemble_f2.py > out/DIAG/f2.asm

out/DIAG/f3.asm: out/disassemble.stamp disassemble_f3.py diag_common.py
	python3 disassemble_f3.py > out/DIAG/f3.asm

out/DIAG/f4.asm: out/disassemble.stamp disassemble_f4.py diag_common.py
	python3 disassemble_f4.py > out/DIAG/f4.asm

out/bootstrap.asm: out/disassemble.stamp disassemble_bootstrap.py
	python3 disassemble_bootstrap.py > out/bootstrap.asm

out/autoload.asm: out/disassemble.stamp disassemble_autoload.py
	python3 disassemble_autoload.py > out/autoload.asm

out/WIPL.asm: out/disassemble.stamp WIPL/WIPL.bin WIPL/WIPL.annotations WIPL/WIPL.comments
	python3 disassemble.py -i WIPL/WIPL.bin -s 0x100 -a WIPL/WIPL.annotations -a WIPL/WIPL.comments > out/WIPL.asm

out/load.asm: out/disassemble.stamp LOAD/load6.bin LOAD/load6.annotations LOAD/load6.comments LOAD/script6.py
	python3 disassemble.py -i LOAD/load6.bin -t wecb -a LOAD/load6.annotations -a LOAD/load6.comments \
	--script LOAD/script6.py > out/load7.asm

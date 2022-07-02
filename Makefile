DEPDIR = .deps

OUTPUTS = \
	out/WIPL.asm \
	out/load6.asm \
	out/load7.asm \
	out/bootstrap.asm \
	out/autoload.asm \
	out/DIAG/f1.asm \
	out/DIAG/f2.asm \
	out/DIAG/f3.asm \
	out/DIAG/f4.asm

all: $(OUTPUTS)

DISASSEMBLE = python3 ono -o $@ --depfile $(DEPDIR)/$(@:%=%.d) -i $<

out/DIAG/f1.asm: roms/Diag_F1_Rev_1.0.BIN
	$(DISASSEMBLE) -s 0x8000 \
		-a roms/Diag_F1_Rev_1.0.comments --script disassemble_f1.py

out/DIAG/f2.asm: roms/Diag_F2_Rev_1.0.BIN
	$(DISASSEMBLE) -s 0x8800 \
		--script disassemble_f2.py

out/DIAG/f3.asm: roms/Diag_F3_Rev_1.0.BIN
	$(DISASSEMBLE) -s 0x9000 \
		-a roms/Diag_F3_Rev_1.0.comments --script disassemble_f3.py

out/DIAG/f4.asm: roms/Diag_F4_1133CMD.BIN
	$(DISASSEMBLE) -s 0x9800 \
		-a roms/Diag_F4_1133CMD.comments --script disassemble_f4.py

out/bootstrap.asm: roms/bootstrap_unscrambled.bin
	$(DISASSEMBLE) -s 0xfc00 --script disassemble_bootstrap.py

out/autoload.asm: roms/DSK-MM1702A
	$(DISASSEMBLE) -s 0xef00

out/WIPL.asm: WIPL/WIPL.bin
	$(DISASSEMBLE) -s 0x100 -a WIPL/WIPL.annotations -a WIPL/WIPL.comments


out/load6.asm: LOAD/load6.bin
	$(DISASSEMBLE) -t wecb -a LOAD/load6.annotations -a LOAD/load6.comments \
		--script LOAD/script6.py

out/load7.asm: LOAD/load7.bin
	$(DISASSEMBLE) -t wecb -a LOAD/load7.annotations -a LOAD/load7.comments \
		--script LOAD/script7.py

DEPFILES := $(OUTPUTS:%=$(DEPDIR)/%.d)
$(OUTPUTS): % : $(DEPDIR)/%.d # Force outputs to depend on the depfiles
$(DEPFILES):

include $(wildcard $(DEPFILES))

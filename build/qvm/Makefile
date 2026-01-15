include config.mk

srcs = $(foreach file,$1,$(if $(patsubst %.asm,,$(file)),$2/$(file).asm,$(file)))
qa_asm = $(call srcs,$(QA_SRC),vm/game)

all: dirs $(PK3)

dirs:
	mkdir -p vm/game

.PHONY: all dirs

$(PK3): vm/qagame.qvm
	$(7Z) $@ vm/*.qvm vm/*.jts

cc = cd vm/$1 && $(Q3LCC) $2 -o $(notdir $@).tmp $(abspath $3) && mv $(notdir $@).tmp $(notdir $@)
qa_cc = $(call cc,game,$(QA_CFLAGS),$<)

vm/qagame.qvm: $(qa_asm)
	$(Q3ASM) -o $@ $(qa_asm)

vm/game/%.asm: $(QADIR)/%.c
	$(qa_cc)

clean:
	$(RM) -rf *.pk3 vm/

PK3 = zz-server-be.pk3

basedir = $(CURDIR)/../../code

QADIR = $(abspath $(basedir)/game)

TOOLSDIR = $(CURDIR)/tools
Q3ASM = $(TOOLSDIR)/q3asm -vq3 -r -m -v
Q3LCC = $(TOOLSDIR)/q3lcc -DQ3_VM -S -Wf-g -I$(QADIR)
7Z = 7z u -tzip -mx=9 -mpass=8 -mfb=255 --

QA_CFLAGS = -DQAGAME

include srcs.mk

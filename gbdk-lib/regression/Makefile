LCC?=lcc -Wa-l -Wl-m -Wl-j
MKROM?=$(LCC)
CC=$(LCC) -c $(CFLAGS)
CA=$(LCC) -c
PNGOPT?=optipng
PNGCMP?=magick compare
ifeq ($(OS),Windows_NT)
EMU?=bgb.exe
else
EMU?=wine bgb.exe
endif

.PHONY:
test: test_bkg

.PHONY:
%: %.png
	$(PNGCMP) $< $@_result.png $@_diff.png

%.png: %.gb
	$(EMU) -set "DebugSrcBrk=1" -hf -stateonexit -screenonexit $@ -rom $<

%_result.png: %.png
	cp $^ $@
	$(PNGOPT) $@

.PHONY:
debug_%: %.gb
	$(EMU) -set "DebugSrcBrk=1" $@ -rom $^

%.gb: %.rel
	$(MKROM) -o $@ $^

%.rel: %.c
	$(CC) -o $@ $^

%.rel: %.s
	$(CA) -o $@ $^

.PHONY:
clean:
	find . -type f -regex '.*.\(asm\|lst\|map\|sym\|sna\)' -delete
	find . -type f \( -name "*.png" ! -iname "*_result.png" \) -delete

# disable built in rules
.SUFFIXES:
LCC?=lcc -Wa-l -Wl-m -Wl-j
MKROM?=$(LCC)
CC=$(LCC) -c $(CFLAGS)
CA=$(LCC) -c
PNGOPT?=optipng
MGK?=magick
ifeq ($(OS),Windows_NT)
EMU?=bgb.exe
else
EMU?=wine bgb.exe
endif

.PHONY:
test: test_bkg test_win

.PHONY:
%: %.bmp
	$(MGK) compare -metric mae $< $@_result.png $@_diff.png
	@printf "\nTest '%s' successful!\n" $@

%.bmp: %.gb
	$(EMU) -set "DebugSrcBrk=1" -hf -stateonexit -screenonexit $@ -rom $<

%_result.png: %.bmp
	$(PNGOPT) $^ -force -out $@

.PHONY:
debug_%: %.gb
	$(EMU) -set "DebugSrcBrk=1" $@ -rom $^

%.gb: %.rel
	$(MKROM) -o $@ $<

%.rel: %.c FORCE
	$(CC) -o $@ $<

%.rel: %.s FORCE
	$(CA) -o $@ $<

.PHONY:
clean:
	find . -type f -regex '.*.\(asm\|lst\|map\|sym\|sna\|bmp\|ini\|gb\)' -delete
	find . -type f \( -name "*.png" ! -iname "*_result.png" \) -delete

# disable built in rules
.SUFFIXES:

# always rebuild those rules
FORCE:
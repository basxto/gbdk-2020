This tool uses lcc from the [build][] directory, [bgb][] and [image magick][magick].
If you want to create a result image you need [optipng][].

Run tests with:
```
$ make test
```

If you want to use different paths:
```
$ make test MGK=/path/to/magick EMU=/path/to/bgb.exe PNGOPT=/path/to/optipng LCC="/path/to/lcc -Wa-l -Wl-m -Wl-j"
```

If you just want the test results:
```
make 2>&1 | grep "Test.*\(successful\|failed\)"
```

Windows
=======

TODO

Linux
=====

You need to have [magick][magick] installed and added to your PATH variable.
`bgb.exe` must be placed in this directory.


[bgb]: http://bgb.bircd.org/#downloads
[magick]: https://imagemagick.org/www/script/download.php
[optipng]: https://sourceforge.net/projects/optipng/files/OptiPNG/
[build]: ../../build/gbdk/
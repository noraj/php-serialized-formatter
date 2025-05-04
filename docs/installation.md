# Installation methods

## Production

### rubygems.org (universal)

```bash
gem install php-serialized-formatter
```

Gem: [php-serialized-formatter](https://rubygems.org/gems/php-serialized-formatter)

### BlackArch

From the repository:

```bash
pacman -S php-serialized-formatter
```

PKGBUILD: [php-serialized-formatter](https://github.com/BlackArch/blackarch/blob/master/packages/php-serialized-formatter/PKGBUILD)

### **ArchLinux**

Manually:

```bash
git clone https://aur.archlinux.org/php-serialized-formatter.git
cd php-serialized-formatter
makepkg -sic
```

With an AUR helper ([Pacman wrappers](https://wiki.archlinux.org/index.php/AUR_helpers#Pacman_wrappers)), e.g. yay:

```bash
yay -S php-serialized-formatter
```

AUR: [php-serialized-formatter](https://aur.archlinux.org/packages/php-serialized-formatter/)

## Development

It's better to use [ASDM-VM](https://asdf-vm.com/) to have latests version of ruby and to avoid trashing your system ruby.

### rubygems.org

```bash
gem install --development php-serialized-formatter
```

### **git**

Just replace `x.x.x` with the gem version you see after `gem build`.

```bash
git clone https://github.com/noraj/php-serialized-formatter.git php-serialized-formatter
cd php-serialized-formatter
gem install bundler
bundler install
gem build psf.gemspec
gem install php-serialized-formatter-x.x.x.gem
```

Note: if an automatic install is needed you can get the version with `$ gem build php-serialized-formatter.gemspec | grep Version | cut -d' ' -f4`.

### **No install**

Run the library in irb without installing the gem.

From local file:

```bash
irb -Ilib -rpsf
```

Same for the CLI tool:

```bash
ruby -Ilib -rpsf bin/psf
```

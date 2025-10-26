# caelestia-shell-personal
# Personal fork with modifications

pkgname='caelestia-shell-personal'
pkgver=r1460.05cc508
pkgrel=1
pkgdesc='The desktop shell for the Caelestia dotfiles (personal fork)'
arch=('x86_64')
url='https://github.com/dvorakman/shell'
license=('GPL-3.0-only')
depends=('caelestia-cli-personal' 'quickshell-git' 'ddcutil' 'brightnessctl' 'app2unit' 'libcava' 'networkmanager'
         'lm_sensors' 'fish' 'aubio' 'libpipewire' 'glibc' 'gcc-libs' 'ttf-material-symbols-variable' 'power-profiles-daemon'
         'ttf-rubik-vf' 'ttf-cascadia-code-nerd' 'swappy' 'libqalculate' 'bash' 'qt6-base' 'qt6-declarative')
makedepends=('git' 'cmake' 'ninja')
provides=('caelestia-shell')
conflicts=('caelestia-shell' 'caelestia-shell-git')
source=("git+file://$HOME/.config/quickshell/caelestia")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/caelestia"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/caelestia"

    cmake -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/ \
        -DDISTRIBUTOR="Personal fork"
    cmake --build build
}

package() {
    cd "$srcdir/caelestia"

    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

from distutils.core import setup
import sys, os

VERSION = '0.1'

LOCALE_DIR= '/usr/share/locale'

locales = []
if os.path.exists('po/locale'):
    for lang in os.listdir('po/locale'):
        locales.append(os.path.join(lang, 'LC_MESSAGES'))

if sys.platform == 'win32':

    # win32com.shell fix from http://www.py2exe.org/index.cgi/win32com.shell
    # ModuleFinder can't handle runtime changes to __path__, but win32com uses them
    try:
        # py2exe 0.6.4 introduced a replacement modulefinder.
        # This means we have to add package paths there, not to the built-in
        # one.  If this new modulefinder gets integrated into Python, then
        # we might be able to revert this some day.
        # if this doesn't work, try import modulefinder
        try:
            import py2exe.mf as modulefinder
        except ImportError:
            import modulefinder
        import win32com
        for p in win32com.__path__[1:]:
            modulefinder.AddPackagePath("win32com", p)
        for extra in ["win32com.shell"]: #,"win32com.mapi"
            __import__(extra)
            m = sys.modules[extra]
            for p in m.__path__[1:]:
                modulefinder.AddPackagePath(extra, p)
    except ImportError:
        # no build path setup, no worries.
        pass

    import py2exe
    LOCALE_DIR = 'locale'

    setup(
        name = 'ekaaty-liveusb-creator',
        version = VERSION,
        packages = ['liveusb', 'liveusb/urlgrabber'],
        scripts = ['liveusb-creator'], 
        license = 'GNU General Public License (GPL)',
        url = '',
        description = 'Ferramenta para criar discos LiveUSB',
        long_description = 'The ekaaty liveusb-creator is a cross-platform tool for easily installing live operating systems on to USB flash drives based on original fedora liveusb-creator',
        platforms = ['Windows'], 
        maintainer = 'Alexandre Teles',
        maintainer_email = 'ateles.1@gmail.com',
        windows = [
            {
                "script" : "liveusb-creator",
                "icon_resources" : [(0, "data/liveusb-creator.ico")],
            }
        ],
        options={
            "py2exe" : {
                #"includes" : ["sip", "PyQt4._qt"],
                "includes" : ["sip"],
                'bundle_files': 1,
            }
        }, 
        zipfile=None,
        data_files = [
            "LICENSE.txt",
            ("tools", [
                "tools/dd.exe",
                "tools/syslinux.exe",
                "tools/7z.exe",
                "tools/7z.dll",
                #"tools/7zCon.sfx",
                "tools/7-Zip-License.txt",
            ],)
          ] + [(os.path.join(LOCALE_DIR, locale),
                [os.path.join('po', 'locale', locale, 'liveusb-creator.mo')])
                for locale in locales]
    )
else:
    setup(
        name = 'ekaaty-liveusb-creator',
        version = VERSION,
        packages = ['liveusb'],
        scripts = ['liveusb-creator'],
        license = 'GNU General Public License (GPL)',
        url = '',
        description = 'Ferramenta para criar discos LiveUSB',
        long_description = 'The liveusb-creator is a cross-platform tool for easily installing live operating systems on to USB flash drives based on original fedora liveusb-creator',
        platforms = ['Linux'],
        maintainer = 'Alexandre Teles',
        maintainer_email = 'ateles.1@gmail.com',
        data_files = [("/usr/share/applications",["data/liveusb-creator.desktop"]), 
                      ('/usr/share/pixmaps',["data/ekaatyusb.png"]),
                      ] + [(os.path.join(LOCALE_DIR, locale),
                            [os.path.join('po', 'locale', locale, 'liveusb-creator.mo')])
                            for locale in locales]
        )


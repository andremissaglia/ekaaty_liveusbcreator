from distutils.core import setup

def main():
    setup(
        name='gettext_windows',
        version='1.0',
        py_modules=['gettext_windows'],
        author='Alexander Belchenko',
        author_email='bialix@ukr.net',
        url='https://launchpad.net/gettext-py-windows',
        description='Helper for standard gettext.py on Windows',
        long_description="""Helper for standard gettext.py on Windows.

Module obtains user language code on Windows to use with standard
Python gettext.py library.""",
        keywords='gettext Windows',
        license='MIT',
        )

if __name__ == '__main__':
    main()

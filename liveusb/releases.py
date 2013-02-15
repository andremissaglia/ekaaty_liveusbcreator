import re
from urlgrabber import urlread
from urlgrabber.grabber import URLGrabError

FEDORA_RELEASES = ''
ARCHES = ('i386', 'i686', 'x86_64')

# A backup list of releases, just in case we can't fetch them.
fedora_releases = [
    {'name': 'Ekaaty 5 i686 Desktop',
     'sha256': '',
     'url': 'http://download.ekaaty.org/linux/ekaaty/pataxos/i386/iso/pataxos-5u1-i386-dvd.iso'},
    {'name': 'Ekaaty 5 x86_64 Desktop',
     'sha256': '',
     'url': 'http://download.ekaaty.org/linux/ekaaty/pataxos/x86_64/iso/pataxos-5u1-x86_64-dvd.iso'},
    {'name': 'Ekaaty 5 i686 Academic',
     'sha256': '',
     'url': 'http://download.ekaaty.org/linux/ekaaty/pataxos/i386/iso/pataxos-5u1-i386-academic.iso'},
    {'name': 'Ekaaty 5 x86_64 Academic',
     'sha256': '',
     'url': 'http://download.ekaaty.org/linux/ekaaty/pataxos/x86_64/iso/pataxos-5u1-x86_64-academic.iso'},
]

other_releases = [
    ##
    ## Custom spins
    ##
    ##{
    ##    'name': 'Sugar on a Stick v6 Pineapple',
    ##    'url': 'https://alt.fedoraproject.org/pub/alt/spins/linux/releases/16/Spins/i686/Fedora-16-i686-Live-SoaS.iso',
    ##    'sha256': '5aa938737cc4ebeb1d269c4d8b2bf56e41bacd1967c3997b8969b42b88b63bfa',
    ##},
]

releases = fedora_releases + other_releases


def get_fedora_releases():
    global releases
    fedora_releases = []
    try:
        html = urlread(FEDORA_RELEASES)
        for release in re.findall(r'<a href="(\d+)/">', html)[-2:][::-1]:
            for arch in ARCHES:
                arch_url = FEDORA_RELEASES + '%s/Live/%s/' % (release, arch)
                try:
                    files = urlread(arch_url)
                except URLGrabError:
                    continue
                for link in re.findall(r'<a href="(.*)">', files):
                    if link.endswith('-CHECKSUM'):
                        checksum = urlread(arch_url + link)
                        for line in checksum.split('\n'):
                            try:
                                sha256, filename = line.split()
                                if filename[0] != '*':
                                    continue
                                filename = filename[1:]
                                chunks = filename[:-4].split('-')
                                chunks.remove('Live')
                                name = ' '.join(chunks)
                                fedora_releases.append(dict(
                                    name=name,
                                    url=arch_url + filename,
                                    sha256=sha256,
                                ))
                            except ValueError:
                                pass
        releases = fedora_releases + other_releases
    except:
        # Can't fetch releases from the internet.
        releases += other_releases
    return releases
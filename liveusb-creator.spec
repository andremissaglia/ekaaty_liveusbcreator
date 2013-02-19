%{!?python_sitelib: %define python_sitelib %(%{__python} -c "from distutils.sysconfig import get_python_lib; print get_python_lib()")}

Name:           liveusb-creator
Version:        3.11.8
Release:        1%{?dist}
Summary:        A liveusb creator

Group:          Applications/System
License:        GPLv2
URL:            https://fedorahosted.org/liveusb-creator
Source0:        https://fedorahosted.org/releases/l/i/liveusb-creator/%{name}-%{version}.tar.bz2
BuildRoot:      %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)

BuildArch:      noarch
ExcludeArch:    ppc
ExcludeArch:    ppc64

BuildRequires:  python-devel, python-setuptools, PyQt4-devel, desktop-file-utils gettext
Requires:       syslinux, PyQt4, usermode, isomd5sum
Requires:       python-urlgrabber
Requires:       pyparted >= 2.0

%description
A liveusb creator from Live Fedora images

%prep
%setup -q

%build
%{__python} setup.py build
make mo
make mo

%install
rm -rf %{buildroot}
%{__python} setup.py install -O1 --skip-build --root %{buildroot}
%{__rm} -r liveusb/urlgrabber

# Adjust for console-helper magic
mkdir -p %{buildroot}%{_sbindir}
mv %{buildroot}%{_bindir}/%{name} %{buildroot}%{_sbindir}/%{name}
ln -s ../bin/consolehelper %{buildroot}%{_bindir}/%{name}
mkdir -p %{buildroot}%{_sysconfdir}/pam.d
cp %{name}.pam %{buildroot}%{_sysconfdir}/pam.d/%{name}
mkdir -p %{buildroot}%{_sysconfdir}/security/console.apps
cp %{name}.console %{buildroot}%{_sysconfdir}/security/console.apps/%{name}

desktop-file-install --vendor="fedora"                    \
--dir=%{buildroot}%{_datadir}/applications           \
%{buildroot}/%{_datadir}/applications/liveusb-creator.desktop
rm -rf %{buildroot}/%{_datadir}/applications/liveusb-creator.desktop

%find_lang %{name}

%clean
rm -rf %{buildroot}

%files -f %{name}.lang
%defattr(-,root,root,-)
%doc README.txt LICENSE.txt
%{python_sitelib}/*
%{_bindir}/%{name}
%{_sbindir}/%{name}
%{_datadir}/applications/fedora-liveusb-creator.desktop
%{_datadir}/pixmaps/ekaatyusb.png
#%{_datadir}/locale/*/LC_MESSAGES/liveusb-creator.mo
%config(noreplace) %{_sysconfdir}/pam.d/%{name}
%config(noreplace) %{_sysconfdir}/security/console.apps/%{name}

%changelog
* Tue Aug 12 2008 Kushal Das <kushal@fedoraproject.org> 2.7-1
- Initial release

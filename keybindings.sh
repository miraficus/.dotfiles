#!/usr/bin/env bash
cat ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml | \
grep '\<property' | \
grep -v 'type="empty"' | \
grep -v '</property>' | \
grep -v 'name="override"' | \
grep -v 'name="providers"' | \
sed -e 's/^[ t/]*//' \
	-e 's/<property name=//' \
	-e 's/ type="string"//' \
	-e 's/ value=/\t\tCommand:/' \
	-e 's/&lt;/</g' \
	-e 's/&gt;/>/g' \
	-e 's/&apos;/`/g' \
	-e 's/Primary/Ctrl/' | \
yad --text-info --geometry=1200x800
# OmniOS Packer Templates

Creates a vagrant base box for OmniOS.

## How to Build

Run using `packer build templates/<release>.json` from the omnios-packer
directory (necessary so that the relative paths for post-install scripts will
be valid).

## Templates

The `templates/` subdirectory contains individual JSON templates for every
OmniOS release. When building a base box for a new OmniOS release, you should
copy the latest template to a new file, named for the release you are adding.

Do not simply change an existing template in-place, as doing so will make it
more cumbersome to rebuild a previous release's basebox in the event we need
to do so for any reason (critical fixes to a previously published basebox).

### Notes

 * A single ZFS pool (rpool) is created for the entire disk
 * The omniti-ms publisher is added by default
 * The VM is set to have 1024MB of RAM and a 40GB drive

## Internal OmniTI Baseboxes

In addition to the templates for baseboxes intended for public consumption,
this repository contains templates for largely internal-only use baseboxes.
These exist as separate templates because some of our internal projects have
additional configuration requirements that aren't appropriate or useful for
public users of OmniOS (e.g. data pools, slightly higher default memory
allocations, etc.).

These templates may not be updated for every release of OmniOS, as they are
typically only built on an as-needed basis.

They are located in the appropriate `templates/<project>/` subdirectories.

### Notes

In addition to the configurations used by the default/public templates, the
project specific templates generally provide the following extras:

 * Additional virtual disk attached to VM
 * A second ZFS pool (data) created using entire disk
 * VM memory increased to 2048MB
 * The omniti-perl publisher is added by default

## Post-install Scripts

The `scripts/` subdirectory contains additional scripts which are used by
some of the templates for post-install configuration. They are not tied to
specific OmniOS releases and are each used by several templates, as they
contain common configuration functionality.


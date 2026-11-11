kind: junction
# fsdk-containers owns the one shared printing base (printing/base.bst): the
# patched FSDK CUPS, cups-filters, libcupsfilters, libppd, ghostscript,
# mutool, avahi-printing, PAPPL and pappl-retrofit. Reach FSDK only through
# fsdk-containers.bst:freedesktop-sdk.bst:...; see fsdk-containers
# docs/skills/printing-base.md.
sources:
- kind: git_repo
  url: github:projectbluefin/fsdk-containers.git
  track: main
  ref: e9881fb392e0e82517393e6b20fa942a005f066f
# Cross-junction includes expand in the subproject's variable scope. Expose
# the shared recipe there until its upstream include is cross-junction safe.
- kind: patch_queue
  path: patches/fsdk-containers

config:
  options:
    arch: '%{arch}'

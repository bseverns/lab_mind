# Source Notes

This standalone lab-brain addendum borrows architectural discipline from the existing classHub operator docs, especially the private model-host boundary:

- keep model hosts private
- do not route normal browser traffic through the private network
- keep the control plane separate from the data/model path
- treat GPU/model hosts as replaceable compute
- keep Headscale as a control-plane concern, not the application itself

The lab-brain stack is its own system. classHub is reference material, not the destination repo for these files.

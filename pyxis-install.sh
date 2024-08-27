#!/bin/bash
# Ref: https://github.com/NVIDIA/pyxis
git clone https://github.com/NVIDIA/pyxis.git
cd pyxis
make install
# Add pyxis plug-in path to 'plugstack.conf’, which is in the same directory as ‘slurm.conf’ by default.
# Ref: https://slurm.schedmd.com/spank.html
cat < END > /etc/slurm/plugstack.conf
required /usr/local/lib/slurm/spank_pyxis.so
END
systemctl restart slurmd
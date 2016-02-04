INSTALL INSTRUCTIONS:

Download and install `stack` from (http://docs.haskellstack.org/en/stable/README.html)

Download precompiled binaries & source code of Sqlite3 from (https://www.sqlite.org/download.html) and copy to `C:\sqlite3`

Run `stack setup` anywhere

Run `stack build` in the source directory

To execute: `stack exec`


-------------------------

The Hexagonal coordinate system is described here
https://github.com/mhwombat/grid/wiki/Hexagonal-tiles
We switch x and y. 

The vertex coordinate system has the same set of axes, (0,0) maps to the Northwest corner of the (0,0) hexagon, and (0,1) to the north. (1,1) maps to the north corner of the (1,0) hexagon. 

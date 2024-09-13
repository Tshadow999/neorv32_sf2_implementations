### Cloning and inizialing repository
1. Clone repository and initialize [submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules):
```git submodule init && git submoduel update```

2. Make the sh files exetubale by running this command: 
```chmod +x ./generate_bit_stream.sh; chmod +x ./program.sh```

3. genertaing the bitstream:
```./generate_bit_stream.sh```

4. program the device:
```./program.sh```

When having trouble with write permissions to the Libero Vault, change the vault location in the Libero IDE via `Project -> Vault/Repositoreis Settings -> Vault location`. Choose a location in your home directory. 

### More on the NEORV32 submodule
The submodule clones the base repository by stnolting, and is fixed to v1.9.2. May you want to use a different repository or version, cd into the neorv32 folder and preform required git oprations. For example, add your own version of NEORV32 with `git remote add` (see [git-remote](https://git-scm.com/docs/git-remote)). Or change to a different version in the base repository with `git checkout`.

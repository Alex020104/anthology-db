# Anthology Release Map

## Launcher

- Root: `F:\Editor_Stalker\Anthology-Work-Git\projects\AnthologyLauncher`
- Repo: `Alex020104/AnthologyLauncher`
- Runtime version source: `anthology_launcher.py`, `LAUNCHER_VERSION`
- Update manifest: `launcher_version.json`
- Release asset: latest GitHub Release, `AnomalyLauncher.exe`
- Local game exe is not copied by default.

## MO2 Modpack

- Root: `D:\ANTHOLOGY\SYS_A.N.T.H.O.L.O.G.Y_mo2_CBT\mods`
- Repo: `Alex020104/anthology-mo2-modpack`
- Manifest: `version.json`
- Download mode: GitHub branch zip from `main`
- Do not deploy these changes to loose game `gamedata`.
- Deleted tracked files are removed by the launcher from the client's modpack
  using `.launcher_update_state.json`.
- Preserve local/manual R.A.K folders:
  `*R.A.K Weapon Pack Adaptation Global A.N.T.H.O.L.O.G.Y*/**`
- Test files named `anthology_release_*` must not remain in the repo.

## Anthology Game Files

- Root: `F:\Editor_Stalker\Anthology-Work-Git\projects\anthology-game-files`
- Repo: `Alex020104/anthology-game-files`
- Scope: tracked game-file payload packages and separate launcher game packages.
- Delivery: `version.json` plus GitHub Release assets through the `game-package` command.

## Anthology Work Git

- Root: `F:\Editor_Stalker\Anthology-Work-Git`
- Repo: `Alex020104/anthology-db`
- Manifest: `db_version.json`
- Asset sources:
  - `D:\ANTHOLOGY\Anomaly-1.5.3-Anthology 2.1\db\configs`
  - `D:\ANTHOLOGY\Anomaly-1.5.3-Anthology 2.1\db\mods`
  - `D:\ANTHOLOGY\Anomaly-1.5.3-Anthology 2.1\db\shaders_anthology.xdb0`
- Manifest paths stay logical: `db/configs/...`, `db/mods/...`,
  `db/shaders_anthology.xdb0`
- `db/mods/00_modded_exes_gamedata.db0` is engine-owned and must not be added
  back to the DB manifest.
- Download mode: GitHub Release assets under tag equal to manifest version.
- Launcher reads the manifest through GitHub contents API first to avoid stale
  raw CDN cache.
- DB update is mirror mode: extra local DB archives are deleted.
- Do not keep copied DB archives in this repo.
- GitHub Release assets cannot be zero bytes.

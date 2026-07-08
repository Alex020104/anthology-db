# Release local config

Shared release scripts must not contain maintainer-specific disk paths.

Each maintainer keeps their own local-only file:

```powershell
Copy-Item .\release.local.example.json .\release.local.json
notepad .\release.local.json
```

`release.local.json` is ignored by Git. Do not commit it.

Required local paths:

- `modpack_dir` — local clone/working tree of `sysliveprime-ctrl/anthology-mo2-modpack`, usually the MO2 `mods` folder.
- `live_game_dir` — local game folder that contains `db`, `bin`, and the live Anthology files used for DB/engine releases.

Optional local paths:

- `launcher_dir`
- `source_dir`
- `engine_dir`
- `engine_build_script`

You can also override any path with an environment variable:

- `ANTHOLOGY_MODPACK_DIR`
- `ANTHOLOGY_LIVE_GAME_DIR`
- `ANTHOLOGY_LAUNCHER_DIR`
- `ANTHOLOGY_SOURCE_DIR`
- `ANTHOLOGY_ENGINE_DIR`
- `ANTHOLOGY_ENGINE_BUILD_SCRIPT`

The public `update_rules.json` should store logical/relative DB paths such as
`db/configs` and `db/mods`, not absolute paths like `X:\...`.

## Game mechanics payload

Game mechanics payloads are separate from DB and MO2.

- `paths.game_payload_dir` points to the local clone of the payload repo, for example `Alex020104/anthology-game-files`.
- `repos.game_payload_repo` points to the GitHub repo owner/name, for example `Alex020104/anthology-game-files`.
- `ANTHOLOGY_GAME_PAYLOAD_DIR` and `ANTHOLOGY_GAME_PAYLOAD_REPO` can override these values.

The `game-package` command reads selected files/folders from `game_payload_dir`, uploads a release asset to `game_payload_repo`, and updates that repo's `version.json`.

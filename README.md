<div align="center">

# 🔧 TagTinker Auto Builder

**A lightweight Lua script that automates cloning, preparing, and building a Flipper Zero application with [uFBT](https://github.com/flipperdevices/flipperzero-ufbt).**

![Lua](https://img.shields.io/badge/Lua-5.x-blue?logo=lua)
![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20Linux-lightgrey)
![Made by](https://img.shields.io/badge/made%20by-retr0-orange)
![Version](https://img.shields.io/badge/version-v1-brightgreen)

</div>

---

## ✨ What it does

Point it at a repo, run it, and it handles the rest:

- 🖥️ **Detects your OS** — Windows or Linux, automatically
- 🧰 **Checks & installs dependencies** — `git` and `ufbt`
- 📥 **Clones the target repository**
- 📂 **Moves files** into the working directory
- ✅ **Verifies required files** — the app source and `application.fam` manifest
- 🛠️ **Builds the app** via `python -m ufbt`

---

## 📋 Requirements

| Tool | Notes |
|---|---|
| [Lua](https://www.lua.org/) | 5.x interpreter |
| [Git](https://git-scm.com/) | must be available in `PATH` |
| Python 3 + `pip` | used to install/run `ufbt` |
| Internet connection | for cloning & installing `ufbt` |
| PowerShell *(Windows only)* | used to move files after cloning |

---

## 🚀 Usage

1. Clone or download this script.
2. Open it and set `repo_url` to the repository you want to build:

   ```lua
   repo_url = "https://github.com/your-url"
   ```

3. Run it with Lua:

   ```bash
   lua build.lua
   ```

The script will detect your OS, install missing dependencies, clone the repo, arrange the files, and kick off the build automatically.

---

## ⚙️ How it works

```
CheckOS()
   └─ detects Windows or Linux

Download_Req()
   └─ checks/installs git & ufbt
   └─ clones the repository

Check_Name()
   └─ extracts repo name from repo_url
   └─ moves cloned files into the working directory

Build_App()
   └─ verifies application.fam & target file exist
   └─ runs `python -m ufbt` to build the app
```

---

## 📝 Notes

- `is_linux` must be correctly set by `CheckOS()`, otherwise the script stops via `assert`.
- The repository name is parsed automatically from `repo_url`.
- The script expects an `application.fam` manifest in the root of the cloned repository (standard for Flipper Zero apps).

---

<div align="center">
Made with 🖤 by <b>Nerart</b>
</div>

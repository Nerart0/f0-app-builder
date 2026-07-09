-- script made by Nerart. / v1;
is_linux = nil -- check if your os is linux or windows.
repo_url = "https://github.com/i12bp8/TagTinker" -- replace your repositorium link here.

local function CheckOS()
    if package.config:sub(1,1) == "\\" then
        is_linux = false
        print("Windows")
        handle = io.popen("cd")
        workspace = handle:read("*a")
        handle:close()
    else
        is_linux = true
        print("Linux")
        handle = io.popen("pwd")
        workspace = handle:read("*a")
        handle:close()
    end

    assert(type(is_linux) == "boolean", "For some reason, the variable responsible for capturing information about the operating system was not recognized.")
end

local function Build_App()
    if is_linux == true then
        -- check if neccessery files are avaiable.
        local file_target = io.open(repo_name, "r")
        local manifest_target = io.open("application.fam", "r")
        assert(file_target, "No target file to build was found.")
        assert(manifest_target, "Program manifest was not found.")

        -- compile & build.
        local status_build = os.execute("python -m ufbt")
    else
        -- check if neccessery files are avaiable.
        local file_target = io.open(repo_name, "r")
        local manifest_target = io.open("application.fam", "r")
        assert(file_target, "No target file to build was found.")
        assert(manifest_target, "Program manifest was not found.")

        -- compile & build.
        local status_build = os.execute("python -m ufbt")
    end
end

local function Check_Name()
    if is_linux == true then
        -- get name
        repo_name = repo_url:match("([^/\"]+)\"?$")
        os.execute("mv " .. repo_name .. "/* .")
        pcall(Build_App, warn("The application build function did not start correctly."))
    else
        -- get name
        repo_name = repo_url:match("([^/\"]+)\"?$")
        os.execute('powershell -Command "Get-ChildItem -Path \'' .. repo_name .. '\' | Move-Item -Destination \'.\'"')
        pcall(Build_App, warn("The application build function did not start correctly."))
    end
end

local function Download_Req()
    -- [[check requirements, clone repoository, install tool uFBT]]
    if is_linux == true then
        local success_git = os.execute("git --version")
        assert(success_git, "Git is not installed.")

        os.execute("python3 -m pip install --upgrade ufbt")
        local success_ufbt = os.execute("ufbt --version")
        assert(success_ufbt, "The installation of ufbt via pip failed.")

        --install repo & getting into them.
        os.execute("git clone " .. repo_url)
        pcall(Check_Name, warn("The name-checking function did not run correctly."))
    else
        local success_git = os.execute("git --version")
        assert(success_git, "Git is not installed.")

        os.execute("python -m pip install --upgrade ufbt")

        -- install repo & getting into them.
        os.execute("git clone " .. repo_url)
        pcall(Check_Name, warn("The name-checking function did not run correctly."))
    end
end

pcall(CheckOS)
pcall(Download_Req)

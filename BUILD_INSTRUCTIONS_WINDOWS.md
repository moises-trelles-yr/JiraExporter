# Building Portable Jira Exporter on Windows

## Complete Step-by-Step Guide

### Prerequisites

Before you start, you need:
- Windows 10 or Windows 11
- Internet connection
- **You DO need admin rights on the BUILD machine** (but users won't need admin rights to RUN the app)

---

## Step 1: Install Python (if not already installed)

### Check if Python is already installed:
1. Press `Windows Key + R`
2. Type `cmd` and press Enter
3. Type: `python --version`
4. If you see a version number (e.g., `Python 3.11.5`), **skip to Step 2**

### Install Python:
1. Go to: https://www.python.org/downloads/
2. Click **"Download Python 3.x.x"** (latest version)
3. Run the installer
4. ⚠️ **IMPORTANT**: Check the box **"Add Python to PATH"** at the bottom
5. Click **"Install Now"**
6. Wait for installation to complete
7. Click **"Close"**

### Verify Python installation:
1. Open a **NEW** Command Prompt (close the old one first)
2. Type: `python --version`
3. You should see: `Python 3.x.x`

---

## Step 2: Transfer Your Project to Windows

### If coming from Mac/Linux:
1. Copy the entire `GetJiraTickets` folder to your Windows machine using:
   - USB drive
   - Email/Cloud (OneDrive, Google Drive, Dropbox)
   - Network share
   - GitHub

2. Place it somewhere easy to access, like:
   - `C:\Users\YourName\Documents\GetJiraTickets`
   - `C:\Projects\GetJiraTickets`

---

## Step 3: Open Command Prompt in Project Folder

### Method A: Using File Explorer (Easiest)
1. Open File Explorer
2. Navigate to your project folder (e.g., `C:\Users\YourName\Documents\GetJiraTickets`)
3. Click in the address bar at the top
4. Type `cmd` and press Enter
5. A Command Prompt will open in that folder

### Method B: Using Command Prompt
1. Press `Windows Key + R`
2. Type `cmd` and press Enter
3. Type: `cd C:\Users\YourName\Documents\GetJiraTickets` (use your actual path)
4. Press Enter

### Verify you're in the right folder:
Type: `dir`

You should see files like:
- `jira_exporter_portable.py`
- `build_portable.bat`
- `config.json`
- `requirements.txt`

---

## Step 4: Install Required Python Packages

In the Command Prompt window, type:

```cmd
pip install -r requirements.txt
```

Press Enter and wait. You'll see output like:
```
Collecting requests
Downloading requests-2.31.0-py3-none-any.whl (62 kB)
Collecting pandas
...
Installing collected packages: ...
Successfully installed pandas-2.1.0 requests-2.31.0 openpyxl-3.1.2 ...
```

This may take 2-5 minutes depending on your internet speed.

### If you get an error:
- **"pip is not recognized"**: Python wasn't added to PATH. Reinstall Python with "Add to PATH" checked.
- **Permission denied**: Run Command Prompt as Administrator (right-click → Run as administrator)

---

## Step 5: Build the Portable Application

Simply type:

```cmd
build_portable.bat
```

Press Enter.

### What you'll see:

The script will:
1. Clean previous builds
2. Run PyInstaller (takes 1-3 minutes)
3. Create the portable package

Output will look like:
```
Building portable Jira Exporter...

Cleaning previous builds...
Running PyInstaller...
[... lots of output ...]
Building EXE from EXE-00.toc completed successfully.

Build complete!

==========================================
Portable package created in: portable_release\

Contents:
  - JiraExporter.exe  (the application)
  - config.json       (edit this to configure)
  - jira_export.xlsx  (template, if exists)

You can copy the entire portable_release folder
to any Windows machine (no admin required)
==========================================

Press any key to continue . . .
```

---

## Step 6: Find Your Portable Package

1. In File Explorer, navigate to your project folder
2. You'll see a new folder: **`portable_release`**
3. Inside you'll find:
   ```
   portable_release\
   ├── JiraExporter.exe          (50-100 MB)
   ├── config.json
   ├── README.txt
   └── jira_export_20251125.xlsx (if it exists)
   ```

**This is your distributable package!**

---

## Step 7: Test the Portable Application

### Before distributing, test it:

1. **Edit config.json** in the `portable_release` folder:
   - Right-click `config.json` → Open with → Notepad
   - Verify your Jira credentials are correct
   - Save and close

2. **Run the application**:
   - Double-click `JiraExporter.exe`
   - A console window will appear
   - You should see: "Starting Jira Data Extraction..."
   - Wait for it to complete

3. **Check the output**:
   - Look for the Excel file in the same folder
   - Open it and verify the data looks correct

4. **If it works**: You're ready to distribute! 🎉

---

## Step 8: Distribute to Users

### Create a ZIP file:
1. Right-click the `portable_release` folder
2. Select **"Send to"** → **"Compressed (zipped) folder"**
3. Rename to `JiraExporter_v1.0.zip`

### Distribute via:
- Email
- SharePoint
- Network drive
- USB stick

### User instructions (include with the ZIP):
```
1. Extract the ZIP file to any folder (Desktop, Documents, etc.)
2. Open config.json in Notepad
3. Enter your Jira email and API token
4. Save and close
5. Double-click JiraExporter.exe
6. Wait for "Process Completed Successfully!"
```

---

## Common Build Issues & Solutions

### Issue 1: "pip is not recognized as an internal or external command"

**Solution:**
- Python wasn't added to PATH during installation
- Reinstall Python, make sure to check "Add Python to PATH"
- OR manually add Python to PATH:
  1. Search for "Environment Variables" in Windows
  2. Add: `C:\Users\YourName\AppData\Local\Programs\Python\Python3xx`

### Issue 2: "pyinstaller: command not found"

**Solution:**
```cmd
pip install pyinstaller
```

### Issue 3: Build succeeds but exe doesn't run

**Solution:**
1. Run the exe from Command Prompt to see errors:
   ```cmd
   cd portable_release
   JiraExporter.exe
   ```
2. Check the error message
3. Common causes:
   - Missing dependencies → rebuild with all packages installed
   - Antivirus blocking → add exception

### Issue 4: "Access denied" during build

**Solution:**
- Run Command Prompt as Administrator
- OR build in a folder where you have full permissions (like Documents)

### Issue 5: Exe is flagged as virus

**Solution:**
- This is normal for PyInstaller executables
- Windows Defender may flag it
- Add exception in Windows Security
- For distribution: users need to click "Run anyway" on first run

### Issue 6: Build folder or dist folder access denied

**Solution:**
```cmd
rmdir /s /q build
rmdir /s /q dist
```
Then run `build_portable.bat` again

---

## Alternative: Manual Build (if batch file doesn't work)

If `build_portable.bat` fails, run commands manually:

```cmd
rem Clean old builds
rmdir /s /q build
rmdir /s /q dist
del /q *.spec

rem Build the exe
pyinstaller --onefile --name "JiraExporter" --add-data "config.json;." jira_exporter_portable.py

rem Create release folder
mkdir portable_release
copy dist\JiraExporter.exe portable_release\
copy config.json portable_release\
copy README_PORTABLE.txt portable_release\README.txt
```

---

## Quick Reference: Commands You'll Use

| Task | Command |
|------|---------|
| Navigate to folder | `cd C:\path\to\folder` |
| List files | `dir` |
| Install packages | `pip install -r requirements.txt` |
| Build portable app | `build_portable.bat` |
| Run exe to test | `cd portable_release` then `JiraExporter.exe` |
| Clean build | `rmdir /s /q build dist` |

---

## Video Tutorial Suggestions

If you'd prefer visual instructions, search YouTube for:
- "How to install Python on Windows 11"
- "How to use Command Prompt Windows"
- "PyInstaller tutorial Windows"

---

## Need Help?

1. **Check the error message carefully** - it usually tells you what's wrong
2. **Google the exact error** - someone else has likely had the same issue
3. **Verify all prerequisites** - Python installed, in correct folder, etc.
4. **Try rebuilding from scratch** - delete build/dist folders and try again

---

## Success Checklist

Before distributing, verify:

- ✅ `JiraExporter.exe` is created and is 50-100 MB
- ✅ `config.json` is included in portable_release folder
- ✅ README.txt is included for users
- ✅ You tested the exe and it successfully fetches Jira data
- ✅ The Excel file is created with correct data
- ✅ You removed any sensitive credentials from the example config.json

---

## You're Done! 🎉

Your portable application is ready to distribute!

Users can now run your Jira Exporter on **any Windows machine without admin rights and without Python installed**.


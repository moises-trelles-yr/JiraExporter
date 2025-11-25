# How to Create a Portable Windows Application (No Admin Required)

## Overview

This guide shows you how to create a **portable Windows executable** from your Python Jira Exporter that:
- ✅ Runs on any Windows 10/11 machine
- ✅ Requires NO admin rights
- ✅ Requires NO Python installation
- ✅ Can be distributed as a simple folder/ZIP file
- ✅ Users can edit configuration without rebuilding

## What You'll Get

A folder called `portable_release` containing:
```
portable_release/
├── JiraExporter.exe          (50-100MB - includes Python + all libraries)
├── config.json                (configuration file - users can edit this!)
├── README.txt                 (user instructions)
└── jira_export_20251125.xlsx  (optional template)
```

Users can copy this entire folder to any Windows machine and run it immediately!

---

## Step-by-Step Instructions

### On Your Mac (Current Machine)

Since you're on a Mac, you have two options:

#### Option A: Use a Windows Machine to Build (Recommended)

1. **Transfer your project** to a Windows machine:
   - Copy the entire project folder to a Windows PC
   - Or use remote desktop / virtual machine

2. **On the Windows machine**, open Command Prompt and run:
   ```cmd
   cd path\to\GetJiraTickets
   pip install -r requirements.txt
   build_portable.bat
   ```

3. **Collect the portable package**:
   - Find the `portable_release` folder
   - ZIP it up: `JiraExporter_v1.0.zip`
   - Distribute to users!

#### Option B: Use GitHub Actions for Automated Building (Advanced)

I can help you set up automated Windows builds using GitHub Actions if you have a GitHub repository.

---

### On a Windows Machine (Direct Build)

If you're building directly on Windows:

#### 1. Install Python (if not already installed)
- Download from: https://www.python.org/downloads/
- During installation: CHECK "Add Python to PATH"

#### 2. Open Command Prompt and navigate to your project:
```cmd
cd C:\path\to\GetJiraTickets
```

#### 3. Install dependencies:
```cmd
pip install -r requirements.txt
```

#### 4. Build the portable application:
```cmd
build_portable.bat
```

#### 5. Find your portable package:
```
portable_release\
├── JiraExporter.exe
├── config.json
├── README.txt
└── jira_export_20251125.xlsx
```

---

## Distributing to Users

### Method 1: ZIP File Distribution

1. **Create a ZIP file**:
   - Right-click `portable_release` folder
   - Send to → Compressed (zipped) folder
   - Rename to `JiraExporter_v1.0.zip`

2. **Send to users** via:
   - Email
   - SharePoint
   - Network drive
   - USB stick

3. **User instructions**:
   ```
   1. Extract the ZIP file to any folder
   2. Open config.json and enter your credentials
   3. Double-click JiraExporter.exe
   ```

### Method 2: Network Drive

1. Place the `portable_release` folder on a shared network drive
2. Users can run directly from there or copy to their local machine

---

## User Configuration (No Rebuild Required!)

Users can edit `config.json` to customize settings:

```json
{
  "jira": {
    "url": "https://your-jira.atlassian.net",
    "email": "user@company.com",
    "api_token": "their-api-token-here",
    "jql_query": "filter=12408"
  },
  "excel": {
    "filename": "jira_export.xlsx",
    "sheet_name": "Features"
  }
}
```

**No need to rebuild** - just edit, save, and run!

---

## Testing the Portable Application

Before distributing:

1. **Test on a clean Windows machine**:
   - VM without Python installed
   - Different Windows version (10/11)
   - User account without admin rights

2. **Test scenarios**:
   - Run from different folders (Desktop, Documents, Network drive)
   - Edit config.json and verify changes work
   - Run multiple times to check for consistency

3. **Check file paths**:
   - Relative paths should work (config.json, Excel files)
   - Absolute paths may cause issues

---

## Advanced: Creating a Windows Installer (Optional)

If you want a professional installer instead of a ZIP file:

### Option 1: Inno Setup (Free)
- Download: https://jrsoftware.org/isinfo.php
- Creates `.exe` installer
- Can add Start Menu shortcuts
- Uninstaller included

### Option 2: NSIS (Free)
- Download: https://nsis.sourceforge.io/
- More customization options
- Requires scripting

I can help you create an installer script if needed!

---

## Troubleshooting Build Issues

### "PyInstaller command not found"
```cmd
pip install pyinstaller
```

### Build succeeds but exe crashes
- Check dependencies are all installed
- Try building with console enabled (already done in our script)
- Check the build warnings

### Exe is too large (>200MB)
- This is normal - includes entire Python runtime
- Can be reduced by excluding unused modules (advanced)

### Antivirus blocks the exe
- This is common with PyInstaller
- Ask users to add exception
- Consider code signing (requires certificate)

---

## Security Considerations

⚠️ **IMPORTANT**: The `config.json` file contains sensitive credentials!

### For Development Team:
- Don't hardcode credentials in the exe
- Use config.json for all sensitive data
- Include `.gitignore` to prevent credential leaks

### For Distribution:
- Provide `config.json` template with placeholder values
- Instruct users to enter their own credentials
- Warn users not to share their configured version

### Sample config template:
```json
{
  "jira": {
    "url": "https://your-company.atlassian.net",
    "email": "YOUR_EMAIL_HERE",
    "api_token": "GET_FROM_ATLASSIAN_SECURITY_PAGE",
    "jql_query": "filter=XXXXX"
  }
}
```

---

## Next Steps

1. ✅ Build the portable application using `build_portable.bat`
2. ✅ Test on a Windows machine without admin rights
3. ✅ Create config.json template with placeholders
4. ✅ Package as ZIP file
5. ✅ Distribute to users with README.txt

---

## File Reference

Created files for portable distribution:

| File | Purpose |
|------|---------|
| `jira_exporter_portable.py` | Modified script that reads from config.json |
| `config.json` | Configuration file (users edit this) |
| `build_portable.bat` | Windows build script |
| `README_PORTABLE.txt` | User instructions |
| `PORTABLE_README.md` | This technical guide |

---

## Questions?

Common questions:

**Q: Can I update the application after distribution?**
A: Yes! Just rebuild and send users the new JiraExporter.exe. Their config.json won't be affected.

**Q: What if I need to change the field mappings?**
A: You'll need to rebuild. Consider moving field mappings to config.json for easier updates.

**Q: Can users run this on Windows Server?**
A: Yes, works on Windows Server 2016+ as well.

**Q: Do users need internet access?**
A: Yes, to connect to Jira and SharePoint.

**Q: Can I distribute this within my company?**
A: Yes, as long as you comply with your company's software distribution policies.

---

## Support

For technical issues:
1. Check the console output for error messages
2. Verify config.json format is valid JSON
3. Test with minimal configuration first
4. Check Windows Event Viewer for application crashes

---

**Good luck with your portable application!** 🚀
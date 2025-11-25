# Jira Exporter - Portable Windows Application

This guide explains how to create and use a portable version of the Jira Exporter that runs on Windows **without admin rights**.

## Building the Portable Application

### On Your Development Machine (with Python):

1. **Install PyInstaller** (if not already installed):
   ```bash
   pip install pyinstaller
   ```

2. **Run the build script**:
   ```bash
   build_portable.bat
   ```

3. **Find your executable**:
   - Location: `dist\JiraExporter.exe`
   - Size: ~50-100 MB (includes Python + all dependencies)

## Deploying to Windows Machines (No Admin Required)

### What to Copy:

Copy these files to the target Windows machine:
```
JiraExporter.exe          (the main executable)
jira_export.xlsx          (your template Excel file - optional)
```

### How to Use:

1. **Place files in any folder** (e.g., `C:\Users\YourName\Documents\JiraExporter\`)

2. **Edit configuration** (first time only):
   - Right-click `JiraExporter.exe` and select "Open with Notepad" (won't work)
   - Instead, edit the configuration values BEFORE building, in `jira_exporter.py`

3. **Run the application**:
   - Double-click `JiraExporter.exe`
   - Or run from command prompt: `JiraExporter.exe`

### Configuration

Before building, edit these values in `jira_exporter.py`:

```python
# Jira Configuration
JIRA_URL = "https://groupe-rocher.atlassian.net"
JIRA_API_EMAIL = "your.email@company.com"
JIRA_API_TOKEN = "your-api-token"
JQL_QUERY = "filter=12408"

# Excel Configuration
EXCEL_FILENAME = "jira_export.xlsx"
EXCEL_SHEET_NAME = "Features"
```

## Alternative: Configuration File Approach

If you want users to edit configuration without rebuilding:

1. Create a `config.json` file
2. Place it next to `JiraExporter.exe`
3. The application will read settings from this file

See below for how to implement this.

## Troubleshooting

### "Windows protected your PC" message:
1. Click "More info"
2. Click "Run anyway"
3. This is normal for unsigned executables

### Application won't start:
- Make sure you're on Windows 10/11 64-bit
- Check antivirus hasn't quarantined the file

### Missing dependencies error:
- Rebuild with the `build_portable.bat` script
- Make sure all packages are installed first

## Security Notes

- The executable contains your API tokens if hard-coded
- Consider using environment variables or config files
- Don't share the .exe file with sensitive credentials

## Distribution

### Create a ZIP package:
```
JiraExporter/
├── JiraExporter.exe
├── README.txt (simplified instructions)
└── config_template.json (if using config file approach)
```

Compress to: `JiraExporter_v1.0.zip`

Users can extract this anywhere and run without installation.
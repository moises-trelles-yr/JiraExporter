# Jira Exporter - Portable Windows Application

A portable Python application that exports Jira tickets to Excel and optionally uploads to SharePoint. **No installation or admin rights required** for end users!

## 🎯 Features

- ✅ Export Jira tickets to Excel using JQL queries
- ✅ Update existing Excel files while preserving formatting and formulas
- ✅ Optional SharePoint upload integration
- ✅ Portable Windows executable (no Python installation needed)
- ✅ User-configurable via `config.json` (no code changes required)
- ✅ Supports Jira API v3 with pagination

## 📦 Quick Start

### For End Users (Using Pre-built Executable)

1. **Download** the latest release ZIP file
2. **Extract** to any folder
3. **Edit** `config.json` with your Jira credentials:
   ```json
   {
     "jira": {
       "url": "https://your-company.atlassian.net",
       "email": "your.email@company.com",
       "api_token": "your-api-token",
       "jql_query": "filter=12408"
     }
   }
   ```
4. **Run** `JiraExporter.exe`
5. **Find** the Excel file in the same folder

See `README_PORTABLE.txt` for detailed user instructions.

### For Developers (Running from Source)

```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/GetJiraTickets.git
cd GetJiraTickets

# Install dependencies
pip install -r requirements.txt

# Copy config template and edit with your credentials
cp config.template.json config.json
# Edit config.json with your actual credentials

# Run the application
python jira_exporter_portable.py
```

## 🔨 Building the Portable Executable

### On Windows:

```cmd
# Install dependencies
pip install -r requirements.txt

# Build portable application
build_portable.bat
```

The portable executable will be created in the `portable_release` folder.

**Detailed build instructions:** See `BUILD_INSTRUCTIONS_WINDOWS.md`

## 📖 Documentation

| Document | Description |
|----------|-------------|
| **START_HERE.txt** | Navigation guide to all documentation |
| **BUILD_INSTRUCTIONS_WINDOWS.md** | Complete step-by-step build guide |
| **QUICK_BUILD_GUIDE.txt** | Quick command reference |
| **BUILD_CHECKLIST.txt** | Printable build checklist |
| **README_PORTABLE.txt** | User instructions (for end users) |
| **HOW_TO_CREATE_PORTABLE_APP.md** | Technical deep dive |

## 🔧 Configuration

Edit `config.json` to configure the application:

### Jira Settings
- `url`: Your Jira instance URL
- `email`: Your Jira email
- `api_token`: Get from [Atlassian API Tokens](https://id.atlassian.com/manage-profile/security/api-tokens)
- `jql_query`: Your JQL filter query

### Excel Settings
- `filename`: Output Excel file name
- `sheet_name`: Sheet name to update (default: "Features")


## 🔐 Security

⚠️ **IMPORTANT**: Never commit `config.json` with real credentials to version control!

- Use `config.template.json` as a template
- Copy to `config.json` and add your credentials
- `config.json` is in `.gitignore` to prevent accidental commits

## 📋 Requirements

### For Running the Executable:
- Windows 10/11 (64-bit)
- Internet connection
- **No Python required**
- **No admin rights required**

### For Development:
- Python 3.8+
- See `requirements.txt` for package dependencies

## 🚀 Use Cases

- Automated Jira reporting
- Regular data exports for analysis
- Excel-based Jira dashboards
- SharePoint integration for team visibility
- Offline Jira data access

## 🔄 Updating Field Mappings

Edit the `TARGET_FIELDS_MAPPING` dictionary in `jira_exporter_portable.py`:

```python
TARGET_FIELDS_MAPPING = {
    "key": "key",
    "Summary": "summary",
    "Status": "customfield_10355",
    # Add your custom fields here
}
```

Get custom field IDs from Jira:
1. Go to Jira → Issue
2. Click "..." → View in JSON
3. Find your field IDs (e.g., `customfield_10355`)

## 🐛 Troubleshooting

### "Windows protected your PC" warning
- Click "More info" → "Run anyway"
- This is normal for unsigned executables

### "Error fetching data from Jira"
- Check your credentials in `config.json`
- Verify API token is correct
- Ensure JQL query is valid

### Excel file not updating
- Check file is not open in Excel
- Verify sheet name matches configuration
- Check file permissions

See `BUILD_INSTRUCTIONS_WINDOWS.md` for more troubleshooting tips.

## 📄 License

[Add your license here - e.g., MIT, Apache 2.0, or Proprietary]

## 🤝 Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📧 Support

For issues and questions:
- Open an issue on GitHub
- Contact: [Your contact information]

## 🙏 Acknowledgments

- Built with [PyInstaller](https://www.pyinstaller.org/)
- Uses [Office365-REST-Python-Client](https://github.com/vgrem/Office365-REST-Python-Client)
- Jira API integration

## 📊 Project Status

**Status**: Active Development

**Version**: 1.0.0

**Last Updated**: November 2024

---

**Made with ❤️ for easier Jira reporting**
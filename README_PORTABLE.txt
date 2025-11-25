================================================================================
                    JIRA EXPORTER - Portable Application
                           NO INSTALLATION REQUIRED
================================================================================

QUICK START:
-----------
1. Edit "config.json" with your Jira and SharePoint credentials
2. Double-click "JiraExporter.exe" to run
3. Check the output Excel file in the same folder

REQUIREMENTS:
------------
- Windows 10/11 (64-bit)
- Internet connection
- NO admin rights needed
- NO Python installation needed

FIRST TIME SETUP:
----------------
1. Open "config.json" in Notepad or any text editor

2. Update the Jira settings:
   - "url": Your Jira instance URL
   - "email": Your Jira email
   - "api_token": Get from https://id.atlassian.com/manage-profile/security/api-tokens
   - "jql_query": Your JQL filter query

3. Update the Excel settings:
   - "filename": Output Excel file name
   - "sheet_name": Sheet name to update (default: "Features")

4. (Optional) Update SharePoint settings if you want to auto-upload:
   - "site_url": Your SharePoint site
   - "doc_library": Document library name
   - "client_id": Azure AD App Client ID (requires admin setup)
   - "client_secret": Azure AD App Client Secret

RUNNING THE APPLICATION:
------------------------
- Double-click "JiraExporter.exe"
- OR run from command prompt: JiraExporter.exe
- The application will show a console window with progress
- Wait for "Process Completed Successfully!" message
- Press Enter to close

OUTPUT:
-------
- Excel file will be created/updated in the same folder
- Check the filename specified in config.json

TROUBLESHOOTING:
---------------
Q: "Windows protected your PC" message appears
A: Click "More info" → "Run anyway" (this is normal for unsigned apps)

Q: Application immediately closes
A: Run from Command Prompt to see error messages:
   1. Open Command Prompt (cmd)
   2. Navigate to this folder: cd "C:\path\to\folder"
   3. Run: JiraExporter.exe

Q: "Error fetching data from Jira"
A: Check your credentials in config.json
   - Verify Jira URL
   - Verify API token is correct
   - Verify JQL query is valid

Q: "File not found" error
A: Make sure config.json is in the same folder as JiraExporter.exe

Q: SharePoint upload fails
A: Contact your IT administrator to set up Azure AD app registration
   Leave client_id and client_secret empty to skip SharePoint upload

SECURITY NOTES:
--------------
- config.json contains sensitive credentials
- Do NOT share this folder with others
- Keep your API tokens secure
- Delete config.json when sharing the executable

UPDATING CONFIGURATION:
----------------------
- Simply edit config.json in any text editor
- Save the file
- Run JiraExporter.exe again
- No need to rebuild the application

SUPPORT:
--------
Contact your system administrator or the application developer for assistance.

================================================================================
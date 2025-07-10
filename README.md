# 🛠️ Intlayer MCP Legal Placeholder Generator


- [Intlayer](https://github.com/aymericzip/intlayer) - Modern internationalization (multi-language support, [official GitHub repo](https://github.com/aymericzip/intlayer))

This script is a workaround for a known issue when running `npx intlayer mcp`, where the CLI fails due to missing legal markdown files in locale directories.

## ❗ Problem

When starting the MCP server, it expects certain legal files (like `privacy_notice.md`, `terms_of_service.md`, etc.) to exist under each supported locale folder.

If these files are missing, the CLI may crash or fail to serve documentation.

## ✅ Solution

This PowerShell script:

- Iterates over a wide range of supported locales
- Creates missing directories under the MCP legal path
- Adds placeholder `.md` files if they don't exist

## 📂 Target Path

By default, the script targets:

C:\Users<your-user>\AppData\Local\nvm\v20.18.1\nodemodules@intlayer\mcp\nodemodules@intlayer\docs\legal

> You can change `$basePath` in the script to match your environment.
>
> ## 📄 Files Created For each locale:
>
> - `privacy_notice.md`
> - `terms_of_service.md`
> - `cookie_policy.md`
> - `legal_disclaimer.md`

> Each file contains a simple placeholder like:

Dummy privacy_notice.md
This is a placeholder for fr-CA.

## ▶️ How to Use 

1. Open PowerShell
2. Run the script
3. Start MCP again:

bash npx intlayer mcp

## 💡 Why This Exists Until the CLI handles missing legal files gracefully or provides a `--init` option, this script ensures MCP can run without crashing. 

## 📬 Suggestion to Intlayer This logic could be integrated into the CLI as:
bash npx intlayer mcp --init

Or handled automatically on first run. 

## Made with ❤️ by [@melihcanndemir](https://github.com/melihcanndemir)

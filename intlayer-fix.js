// intlayer-fix.js
import fs from "fs";
import path from "path";
import { fileURLToPath } from "url";
import os from "os";

// __dirname tanımı (ESM için)
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const homeDir = os.homedir();
const nodeVersion = process.version.startsWith("v") ? process.version : `v${process.version}`;
const nvmDir = process.platform === "win32"
  ? `${homeDir}\\AppData\\Local\\nvm\\${nodeVersion}`
  : `${homeDir}/.nvm/versions/node/${nodeVersion}`;
const basePath = process.platform === "win32"
  ? `${nvmDir}\\node_modules\\@intlayer\\mcp\\node_modules\\@intlayer\\docs\\legal`
  : `${nvmDir}/lib/node_modules/@intlayer/mcp/node_modules/@intlayer/docs/legal`;

const languages = [
  "en", "en-GB", "en-US", "en-AU", "en-CA", "en-NZ",
  "fr", "fr-CA", "fr-BE", "fr-CH",
  "de", "de-AT", "de-CH", "de-LU",
  "es", "es-MX", "es-ES", "es-AR", "es-CO",
  "pt", "pt-BR", "pt-PT",
  "zh", "zh-CN", "zh-TW", "zh-HK",
  "ar", "ru", "tr", "it", "ja", "ko", "pl", "nl", "sv", "fi", "no", "da", "cs", "el", "he", "id", "ms", "th", "vi", "uk", "ro", "hu", "sk", "bg", "hr", "lt", "lv", "et", "sl", "sr", "ca", "eu", "gl", "mt", "is", "ga", "sq", "bs", "mk", "af", "sw", "zu", "xh", "st", "tn", "ts", "ss", "ve", "nr", "hi"
];

const legalFiles = [
  "privacy_notice.md",
  "terms_of_service.md",
  "cookie_policy.md",
  "legal_disclaimer.md"
];

languages.forEach(lang => {
  const dir = path.join(basePath, lang);
  if (!fs.existsSync(dir)) {
    fs.mkdirSync(dir, { recursive: true });
  }
  legalFiles.forEach(fileName => {
    const file = path.join(dir, fileName);
    if (!fs.existsSync(file)) {
      fs.writeFileSync(file, `# Dummy ${fileName}\nThis is a placeholder for ${lang}.`, "utf8");
      console.log(`Created: ${file}`);
    } else {
      console.log(`Already exists: ${file}`);
    }
  });
}); 
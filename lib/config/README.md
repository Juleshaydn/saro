# API Configuration

## 🔐 Setup Instructions

This directory contains API keys and configuration that should **NEVER** be committed to version control.

### **First Time Setup**

1. Copy the example file:
   ```bash
   cp api_config.example.dart api_config.dart
   ```

2. Edit `api_config.dart` and add your actual API keys:
   ```dart
   class ApiConfig {
     static const String openAiApiKey = 'sk-proj-YOUR_ACTUAL_KEY_HERE';
   }
   ```

3. **Never commit `api_config.dart`** - it's already in `.gitignore`

### **File Structure**

```
lib/config/
├── api_config.dart         ← Your actual keys (NEVER commit!)
├── api_config.example.dart ← Template (safe to commit)
└── README.md              ← This file
```

### **Security Notes**

- ✅ `api_config.dart` is in `.gitignore`
- ✅ `api_config.example.dart` has placeholder text only
- ⚠️ Never share your actual API keys
- 🔒 Regenerate keys if accidentally exposed

### **For Team Members**

When cloning this repo:
1. Run: `cp lib/config/api_config.example.dart lib/config/api_config.dart`
2. Get API keys from your team lead
3. Add them to `api_config.dart`
4. Start developing!

### **Current API Keys Needed**

- **OpenAI API Key** - For DALL-E 3 image generation
  - Get it from: https://platform.openai.com/api-keys
  - Cost: ~$0.04 per image generation

---

**Remember**: API keys are like passwords - keep them secret! 🔐


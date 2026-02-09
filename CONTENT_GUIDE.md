# Content Editing Guide
## For KommMit Prien Website

This guide explains how to update website content **without touching any design or code**. If you can edit a Spotify playlist, you can edit this site!

---

## Quick Start: What You Need to Know

- **All content** lives in simple text files in the `_data/` folder
- **Edit like a spreadsheet**: Each item has fields like title, description, date
- **No HTML or CSS needed**: Just edit the text between the quotes
- **Changes go live** after saving and deploying (someone technical will help with that part)

---

## Editing Content Files

### Location: `_data/` folder

All content files are in YAML format (`.yml`). Think of them like structured spreadsheets.

### 📅 Events (`_data/events.yml`)

Add, remove, or edit upcoming events.

**Example:**
```yaml
- title: "Workshop: Klimaschutz"          # Event name
  date: "8. April 2026"                   # Date (as text)
  time: "10:00 Uhr"                       # Time
  location: "Rathaus Prien"               # Where it happens
  description: "Short description here."   # Brief summary
  image: "event-klima.jpg"                # Image filename (ask admin to add images)
  accent: red                             # Color: "red" or "teal"
```

**To add a new event:**
1. Copy an existing event block (including the `-` at the start)
2. Paste it at the bottom
3. Update all the fields
4. Make sure `accent:` is either `red` or `teal`

---

### 🎯 Topics (`_data/topics.yml`)

The four main topic cards on the homepage.

**Example:**
```yaml
- icon: car                              # Icon name (see icon list below)
  title: Verkehr & Mobilität             # Topic title
  description: Nachhaltige Verkehrskonzepte und ÖPNV-Ausbau.  # Brief description
```

**Available icons:**
- `car` - Vehicle/Transport
- `building-2` - Buildings/Development
- `heart-handshake` - Community/People
- `users` - Groups/Participation
- `calendar` - Events/Schedule
- `map-pin` - Location/Place

[Full icon list](https://lucide.dev/icons/)

---

### ℹ️ About Section (`_data/features.yml`)

The three feature cards in the "About" section.

**Example:**
```yaml
- icon: megaphone                        # Icon name
  title: Transparenz                     # Feature title
  description: Einblicke in die Kommunalpolitik für alle Bürgerinnen und Bürger.
  color: teal                            # Color: "red" or "teal"
```

---

### 🔗 Navigation (`_data/navigation.yml`)

Main menu links.

**Example:**
```yaml
- name: Veranstaltungen                  # Link text
  url: "#veranstaltungen"                # Where it goes (# for same page)
```

---

## Design Tokens (Advanced: Ask First!)

Want to change colors or fonts across the entire site? **Ask a developer** to edit `/assets/css/main.css`.

### Design Variables (at the top of main.css):
```css
:root {
  --color-primary: #253941;      /* Main dark blue */
  --color-accent: #ff0400;       /* Red for buttons */
  --color-accent-teal: #0F766E;  /* Teal accent */
  --color-text: #666666;         /* Body text gray */
}
```

**Changing one of these changes it everywhere** - that's the power of the new system!

---

## What NOT to Edit

❌ **Don't edit these** (unless you know what you're doing):
- Files in `_includes/` - These are templates
- Files in `_layouts/` - These control page structure
- `/assets/css/main.css` - The design system (ask first!)
- Any file ending in `.html` - These mix content with structure

✅ **Safe to edit:**
- Anything in `_data/` folder
- Markdown files (`.md`) like `about.md`
- This guide!

---

## Quick Reference: File Structure

```
kommitprien/
├── _data/                   ← EDIT THESE
│   ├── events.yml          (Veranstaltungen)
│   ├── topics.yml          (Themen)
│   ├── features.yml        (About section)
│   └── navigation.yml      (Menu links)
├── _includes/              ← Don't edit (templates)
├── _layouts/               ← Don't edit (structure)
├── assets/
│   ├── css/main.css       ← Ask developer (design system)
│   └── images/            ← Add event images here
├── design/                ← Logo assets (reference only)
└── CONTENT_GUIDE.md       ← This file!
```

---

## Tips for Content Editors

1. **Copy & paste** existing items as templates
2. **Keep descriptions short** - 1-2 sentences max
3. **Dates as text** - Write them however you want ("8. April" or "April 8th")
4. **Images** - Put new images in `/assets/images/` and reference the filename
5. **Icons** - Stick to the list above or browse [lucide.dev](https://lucide.dev/icons/)
6. **Colors** - Only use `red` or `teal` for accent colors

---

## Getting Help

- **Something broken?** Ask your developer to check `main.css` design tokens
- **Need a new section?** That requires template changes (not just content editing)
- **Want new colors?** Update the CSS variables at the top of `main.css`

---

## Summary: The Spotify UI Approach

Just like Spotify lets you edit playlists without knowing how the app works:
- **You edit**: Content in `_data/*.yml` files
- **System handles**: All design, layout, and styling automatically
- **One place for colors**: CSS variables in `main.css`

**Questions?** Read this guide again or ask your friendly neighborhood developer! 🚀

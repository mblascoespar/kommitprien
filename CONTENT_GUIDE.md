# Content Editing Guide
## For KommMit Prien Website

This guide explains how to update website content **without touching any design or code**. If you can write a blog post or edit a Spotify playlist, you can edit this site!

---

## Quick Start: What You Need to Know

- **Events** = Individual Markdown files (like blog posts) in `_events/` folder
- **Page text** = YAML front matter at the top of `index.html`
- **Topics/Features** = Simple YAML files in `_data/` folder
- **Write in Markdown** = Bold, italic, lists, links all supported!
- **No HTML or CSS needed** = Just edit plain text files

---

## Editing Content

### 📅 Events (Individual Markdown Files)

**Location:** `_events/` folder

Each event is a **separate Markdown file** - just like a blog post!

#### Creating a New Event:

1. **Copy an existing event file** (e.g., `2026-02-15-ortsentwicklung-verkehr.md`)
2. **Rename it** with the new date and title: `2026-04-20-new-event-title.md`
3. **Edit the front matter** (top section between `---`)
4. **Write the description** in Markdown below the front matter

#### Example Event File:

**File:** `_events/2026-04-08-workshop-klimaschutz.md`

```markdown
---
title: "Workshop: Klimaschutz"
date: 2026-04-08
time: "10:00 Uhr"
location: "Rathaus Prien"
accent: red
image: "event-klima.jpg"
---

Erarbeitung konkreter Klimaschutzmaßnahmen für Prien.

You can add **more details** here using Markdown:
- Bold and *italic* text
- Bullet lists
- [Links](https://example.com)
- Multiple paragraphs
```

#### Field Reference:
- `title` - Event name (displayed as headline)
- `date` - YYYY-MM-DD format (used for sorting)
- `time` - Display time (e.g., "19:00 Uhr")
- `location` - Where it happens
- `accent` - Color: `red` or `teal`
- `image` - Image filename in `/assets/images/`

**Content below the `---`** is the event description (Markdown supported!)

---

### 📄 Page Text (Hero, Section Titles)

**Location:** `index.html` (front matter at the top)

All the main headlines, descriptions, and button text live at the **top of `index.html`** between the `---` markers.

#### Example:

```yaml
---
layout: default
title: KommMit Prien - Bürgerinitiative am Chiemsee

hero:
  headline_primary: "Politik mitgestalten."
  headline_secondary: "Gemeinsam anpacken."
  description: "KommMit Prien ist die Brücke zwischen Gemeinderat..."
  cta_primary: "Veranstaltungen"
  cta_secondary: "Mehr erfahren"

sections:
  events:
    title: "Veranstaltungen"
    description: "Treffen Sie uns bei unseren öffentlichen..."

  topics:
    title: "Unsere Themen"
    description: "Diese Bereiche liegen uns besonders..."
---
```

**To change hero text or section titles:**
1. Open `index.html`
2. Edit the values in the front matter (between the `---`)
3. Save and commit

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
- The **body** of `index.html` (below the front matter)

✅ **Safe to edit:**
- Individual event files in `_events/` folder
- Front matter at top of `index.html`
- YAML files in `_data/` folder (topics, features, navigation)
- This guide!

---

## Quick Reference: File Structure

```
kommitprien/
├── _events/                ← EDIT THESE (one .md file per event)
│   ├── 2026-02-15-ortsentwicklung-verkehr.md
│   ├── 2026-03-13-buergerversammlung-wohnraum.md
│   └── 2026-04-08-workshop-klimaschutz.md
├── _data/                  ← EDIT THESE (simple lists)
│   ├── topics.yml         (Homepage topic cards)
│   ├── features.yml       (About section)
│   └── navigation.yml     (Menu links)
├── index.html              ← EDIT FRONT MATTER (top section only)
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

1. **Copy & paste** existing event files as templates
2. **Use Markdown** - Bold (`**text**`), italic (`*text*`), lists (`- item`), links (`[text](url)`)
3. **Event dates** - Use YYYY-MM-DD format in filename and front matter (for sorting)
4. **Images** - Put new images in `/assets/images/` and reference the filename
5. **Icons** - Stick to the list above or browse [lucide.dev](https://lucide.dev/icons/)
6. **Colors** - Only use `red` or `teal` for accent colors

### Markdown Basics:

```markdown
**Bold text**
*Italic text*
[Link text](https://example.com)

- Bullet point 1
- Bullet point 2

1. Numbered list
2. Another item
```

---

## Getting Help

- **Something broken?** Ask your developer to check `main.css` design tokens
- **Need a new section?** That requires template changes (not just content editing)
- **Want new colors?** Update the CSS variables at the top of `main.css`

---

## Summary: The Blog-Like Approach

Just like writing a blog post or editing a Spotify playlist:
- **You edit**: Markdown files in `_events/` and front matter in `index.html`
- **Write naturally**: Markdown formatting (bold, lists, links)
- **One file per event**: Easy to find, edit, and version control
- **System handles**: All design, layout, and styling automatically

**Questions?** Read this guide again or ask your friendly neighborhood developer! 🚀

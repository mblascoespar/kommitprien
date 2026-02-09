# KommMit Prien

A modern, easy-to-edit website for the KommMit Prien citizen initiative (Bürgerinitiative) in Prien am Chiemsee.

**Tech Stack:** Jekyll + GitHub Pages + Tailwind CSS
**Key Feature:** Content editing with Spotify-level simplicity (no coding required)

---

## 📝 Content Editing (No Coding Required)

This website is designed so non-technical users can easily edit content.

**👉 [Read the Content Guide →](CONTENT_GUIDE.md)**

### Quick Start: Add Your First Event

1. **Copy** an existing event file from `_events/` folder
2. **Rename** it with the new date: `2026-05-20-event-name.md`
3. **Edit** the front matter (title, date, time, location)
4. **Commit** and push - site updates automatically!

[Detailed instructions in CONTENT_GUIDE.md](CONTENT_GUIDE.md)

---

## 🛠️ Development Setup

### Local Development

1. Install dependencies:
   ```bash
   bundle install
   ```

2. Run the development server:
   ```bash
   bundle exec jekyll serve
   ```

3. View your site at `http://localhost:4000/`

**👉 [Read the Design System Guide →](DESIGN_SYSTEM.md)**

### Customizing Design

All colors, fonts, and styles are defined in `/assets/css/main.css` using CSS custom properties.

[Complete design system documentation →](DESIGN_SYSTEM.md)

---

## 📁 Project Structure

```
kommitprien/
├── _events/                    # ✅ Events (one .md file per event)
│   ├── 2026-02-15-ortsentwicklung-verkehr.md
│   ├── 2026-03-13-buergerversammlung-wohnraum.md
│   └── 2026-04-08-workshop-klimaschutz.md
├── _data/                      # ✅ Static data (topics, features, navigation)
│   ├── topics.yml             # Homepage topic cards
│   ├── features.yml           # About section features
│   └── navigation.yml         # Menu links
├── _includes/                  # Templates (for developers)
│   ├── hero.html
│   ├── events.html
│   └── ...
├── _layouts/                   # Page layouts (for developers)
│   └── default.html
├── assets/
│   ├── css/
│   │   └── main.css           # 🎨 Design system (colors, fonts, styles)
│   └── images/                # Event images and logos
├── design/                     # Source design files (reference only)
├── index.html                  # ✅ Homepage (edit front matter for page text)
├── _config.yml                 # Jekyll configuration
├── CONTENT_GUIDE.md            # 📖 For content editors
├── DESIGN_SYSTEM.md            # 📖 For developers
└── README.md                   # This file
```

**For content editors:**
- Edit files in `_events/` and `_data/`
- Edit front matter in `index.html`

**For developers:**
- Modify templates in `_includes/` and `_layouts/`
- Customize design in `assets/css/main.css`

---

## 🚀 Deployment

This site automatically deploys to GitHub Pages when you push to the `main` branch.

**GitHub Actions workflow:** `.github/workflows/jekyll.yml`

### Enable GitHub Pages (First-Time Setup)

1. Go to repository **Settings** → **Pages**
2. Under **Source**, select **GitHub Actions**
3. Push changes to trigger deployment

Your site will be available at: `https://[username].github.io/kommitprien/`

---

## 📚 Documentation

- **[CONTENT_GUIDE.md](CONTENT_GUIDE.md)** - Complete guide for content editors
- **[DESIGN_SYSTEM.md](DESIGN_SYSTEM.md)** - Design tokens and utility classes

---

## 🔗 Resources

- [Jekyll Documentation](https://jekyllrb.com/docs/)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [Tailwind CSS](https://tailwindcss.com)
- [Lucide Icons](https://lucide.dev/icons/)

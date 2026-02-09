# Jekyll-Native Content Migration
**Date:** February 9, 2026

## What Changed

Migrated from hardcoded HTML + YAML data files to **Jekyll-native content management** using Collections and Front Matter.

---

## Key Changes

### 1. Events: Data File → Jekyll Collection

**Before:** `_data/events.yml` (all events in one YAML file)
```yaml
- title: "Workshop: Klimaschutz"
  date: "8. April 2026"
  description: "Brief description"
```

**After:** `_events/2026-04-08-workshop-klimaschutz.md` (one file per event)
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

**Additional details** can be added here using Markdown formatting!
```

**Benefits:**
✅ Each event is a separate file (easy to find and edit)
✅ Markdown support in description (bold, lists, links)
✅ Git-friendly (clear diffs when reviewing changes)
✅ Blog-like workflow (familiar to content editors)
✅ Easy to add new events (copy an existing file)

---

### 2. Static Text: Hardcoded HTML → Front Matter

**Before:** Text hardcoded in HTML templates
```html
<h1>
  <span>Politik mitgestalten.</span>
  <span>Gemeinsam anpacken.</span>
</h1>
```

**After:** Front matter in `index.html`
```yaml
---
hero:
  headline_primary: "Politik mitgestalten."
  headline_secondary: "Gemeinsam anpacken."
  description: "KommMit Prien ist die Brücke..."

sections:
  events:
    title: "Veranstaltungen"
    description: "Treffen Sie uns..."
---
```

**Benefits:**
✅ All page text in one place (top of `index.html`)
✅ Easy to find and change
✅ No need to hunt through HTML templates
✅ Still YAML (familiar structure)

---

### 3. Configuration

**Added to `_config.yml`:**
```yaml
collections:
  events:
    output: false
    sort_by: date
```

This tells Jekyll to:
- Treat `_events/` as a collection
- Sort events by date
- Don't generate individual pages (we're using them for cards only)

---

## Files Created

### Event Collection:
```
_events/
├── 2026-02-15-ortsentwicklung-verkehr.md
├── 2026-03-13-buergerversammlung-wohnraum.md
└── 2026-04-08-workshop-klimaschutz.md
```

### Documentation:
- `JEKYLL_MIGRATION.md` (this file)
- Updated `CONTENT_GUIDE.md` with Jekyll approach

---

## Files Modified

### Configuration:
- `_config.yml` - Added collections config

### Content:
- `index.html` - Added front matter with all static text

### Templates:
- `_includes/events.html` - Loop through `site.events`, use `event.content`
- `_includes/hero.html` - Use `page.hero.*` variables
- `_includes/topics.html` - Use `page.sections.topics.*`
- `_includes/about.html` - Use `page.sections.about.*`
- `_includes/cta.html` - Use `page.sections.cta.*`

---

## Content Editing Workflow (New)

### Adding a New Event:

1. **Copy** an existing event file:
   ```bash
   cp _events/2026-02-15-ortsentwicklung-verkehr.md \
      _events/2026-05-20-new-event.md
   ```

2. **Edit** the front matter (title, date, time, location, accent)

3. **Write** the description in Markdown below the `---`

4. **Commit** and push:
   ```bash
   git add _events/2026-05-20-new-event.md
   git commit -m "Add new event: [title]"
   git push
   ```

5. **Deploy** automatically via GitHub Pages

### Changing Page Text:

1. **Open** `index.html`
2. **Edit** the front matter at the top (between `---`)
3. **Save** and commit
4. **Deploy** automatically

---

## What Stayed the Same

**These still use `_data/*.yml`** (no change needed):
- `_data/topics.yml` - Homepage topic cards
- `_data/features.yml` - About section features
- `_data/navigation.yml` - Menu links

**Why?** These are simple, stable lists that don't need rich text formatting or individual files.

---

## Technical Details

### Liquid Template Changes:

**Events loop:**
```liquid
{% assign sorted_events = site.events | sort: "date" %}
{% for event in sorted_events %}
  <h3>{{ event.title }}</h3>
  <div>{{ event.content }}</div>  <!-- Renders Markdown -->
{% endfor %}
```

**Front matter access:**
```liquid
<h1>{{ page.hero.headline_primary }}</h1>
<h2>{{ page.sections.events.title }}</h2>
```

### Date Formatting:

Events use Jekyll's date filter:
```liquid
{{ event.date | date: "%-d. %B %Y" }}
```

Output: "15. Februar 2026"

---

## Migration Checklist

✅ Configure collections in `_config.yml`
✅ Create `_events/` directory
✅ Migrate 3 events to individual `.md` files
✅ Update `_includes/events.html` to use collection
✅ Extract static text to `index.html` front matter
✅ Update all includes to use front matter variables
✅ Update `CONTENT_GUIDE.md` with new approach
✅ Test locally with `jekyll serve`
✅ Deploy to GitHub Pages

---

## Testing

After deployment, verify:
- [ ] All 3 events display correctly
- [ ] Event descriptions render (check for markdown)
- [ ] Hero text displays from front matter
- [ ] Section titles display from front matter
- [ ] Events are sorted by date (chronological order)
- [ ] Accent colors work (red/teal borders)
- [ ] Responsive design still works
- [ ] No broken links or missing images

---

## Future Enhancements

### Option 1: Individual Event Pages

Set `output: true` in `_config.yml`:
```yaml
collections:
  events:
    output: true
    permalink: /events/:name/
```

Each event gets its own page at `/events/event-name/`.

### Option 2: CMS Integration

Collections work perfectly with:
- [Netlify CMS](https://www.netlifycms.org/)
- [TinaCMS](https://tina.io/)
- [Forestry](https://forestry.io/)

These provide a visual editor for non-technical users.

### Option 3: Past Events

Add a `past: true` field to front matter and filter:
```liquid
{% for event in sorted_events %}
  {% unless event.past %}
    <!-- Show only upcoming events -->
  {% endunless %}
{% endfor %}
```

---

## Rollback Plan

If needed, revert to data files:

1. Keep `_data/events.yml` as backup
2. Update `_includes/events.html` to loop through `site.data.events`
3. Remove collections config from `_config.yml`

---

## Summary

**Before:** Mixed HTML/YAML, hardcoded text, nested data structures
**After:** Jekyll collections + front matter, Markdown-friendly, blog-like workflow

**Result:** Content editors can now work like they're writing blog posts! 🚀

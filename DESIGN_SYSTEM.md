# Design System Documentation
## KommMit Prien - Developer Reference

This document explains the design token system and utility classes available for styling.

---

## Philosophy

**Separation of Concerns:**
- **Content**: Lives in `_data/*.yml` files (editable by non-technical users)
- **Structure**: Lives in `_includes/*.html` templates (semantic HTML)
- **Style**: Lives in `/assets/css/main.css` (centralized design tokens)

**Design Tokens Approach:**
All colors, fonts, and spacing use CSS custom properties (variables). Change them in one place, update everywhere.

---

## Design Tokens (CSS Variables)

Located at the top of `/assets/css/main.css`:

```css
:root {
  /* Brand Colors - Official KomMit Palette */
  --color-primary: #B8B5FF;        /* Light purple - main brand color */
  --color-accent: #F9E693;         /* Light yellow - calls-to-action */
  --color-accent-cyan: #89CEE1;    /* Light cyan - alternative accent */
  --color-text: #626262;           /* Medium gray - body text */
  --color-background: #ffffff;     /* White - backgrounds */
  --color-background-light: #EEEEEE; /* Very light gray - alternate backgrounds */
  --color-dark: #000000;           /* Black - dark elements */

  /* Additional Brand Colors */
  --color-yellow-alt: #F3DF7F;     /* Alternative yellow */
  --color-blue-purple: #8FA5F3;    /* Blue-purple accent */
  --color-cyan-alt: #65C0D9;       /* Alternative cyan */

  /* Typography */
  --font-body: 'Noto Sans', sans-serif;
  --font-heading: 'Noto Sans Display', sans-serif;

  /* Spacing & Layout */
  --container-max: 1280px;
  --section-padding: 5rem;
  --card-radius: 0.75rem;

  /* Effects */
  --transition: all 0.3s ease-in-out;
  --shadow-sm: 0 1px 2px 0 rgb(0 0 0 / 0.05);
  --shadow-md: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
}
```

---

## Utility Classes

### Typography

| Class | Purpose | CSS |
|-------|---------|-----|
| `.text-primary` | Main brand color (purple) | `color: var(--color-primary)` |
| `.text-accent` | Accent yellow | `color: var(--color-accent)` |
| `.text-body` | Body text gray | `color: var(--color-text)` |
| `.text-dark` | Black text | `color: var(--color-dark)` |
| `.text-muted` | Lighter gray (footer) | `color: #999999` |
| `.font-black` | Heavy weight headings | `font-weight: 900` |
| `.logo-condensed` | Condensed logo text | `font-stretch: 62.5%` |

### Backgrounds

| Class | Purpose |
|-------|---------|
| `.bg-primary` | Light purple background |
| `.bg-accent` | Light yellow background |
| `.bg-accent-cyan` | Light cyan background |
| `.bg-dark` | Black background |
| `.bg-white` | White background |
| `.bg-gray-light` | Light gray (#EEEEEE) |

### Buttons

**Primary Button** (Purple CTA):
```html
<a href="#" class="btn-primary">
  Button Text
  <i data-lucide="arrow-right" class="ml-2 w-5 h-5"></i>
</a>
```

**Primary Small** (Header/Nav):
```html
<a href="#" class="btn-primary-sm">Mitmachen</a>
```

**Secondary Button** (Outlined):
```html
<a href="#" class="btn-secondary">
  Button Text
</a>
```

**Navigation Link**:
```html
<a href="#" class="nav-link">Link Text</a>
```

### Cards

**Basic Card** (white with shadow):
```html
<div class="card">
  <!-- Content -->
</div>
```

**Card with Accent Border**:
```html
<div class="card card-accent-yellow">
  <!-- Yellow left border -->
</div>

<div class="card card-accent-cyan">
  <!-- Cyan left border -->
</div>
```

**Dynamic Accent** (from YAML data):
```html
{% for event in site.data.events %}
  <div class="card card-accent-{{ event.accent }}">
    <!-- Accent color from YAML: "yellow" or "cyan" -->
  </div>
{% endfor %}
```

### Sections

**Standard Section**:
```html
<section class="section bg-white">
  <div class="container mx-auto px-4">
    <h2 class="section-title">Section Title</h2>
    <p class="section-description">
      Optional description text
    </p>
    <!-- Content -->
  </div>
</section>
```

**Gray Background Section**:
```html
<section class="section bg-gray-light">
  <!-- Content -->
</section>
```

### Icons

**Icon Circle** (for topic/feature cards):
```html
<div class="icon-circle icon-circle-cyan">
  <i data-lucide="car" class="w-8 h-8 text-white"></i>
</div>

<div class="icon-circle icon-circle-yellow">
  <i data-lucide="megaphone" class="w-8 h-8 text-white"></i>
</div>

<div class="icon-circle icon-circle-primary">
  <i data-lucide="users" class="w-8 h-8 text-white"></i>
</div>
```

**Dynamic Icon Color** (from YAML):
```html
{% for feature in site.data.features %}
  <div class="icon-circle icon-circle-{{ feature.color }}">
    <i data-lucide="{{ feature.icon }}" class="w-8 h-8 text-white"></i>
  </div>
{% endfor %}
```

---

## Component Patterns

### Event Card

```html
{% for event in site.data.events %}
<div class="card card-accent-{{ event.accent }}">
  <div class="relative h-48 bg-gray-200">
    <img src="{{ '/assets/images/' | append: event.image | relative_url }}"
         alt="{{ event.title }}"
         class="w-full h-full object-cover">
  </div>
  <div class="p-6">
    <h3 class="text-xl font-bold mb-4 text-primary">{{ event.title }}</h3>
    <div class="space-y-2 mb-4 text-body">
      <!-- Event details -->
    </div>
    <p class="mb-4 text-body">{{ event.description }}</p>
    <a href="#" class="inline-flex items-center font-semibold text-accent">
      Anmelden
      <i data-lucide="arrow-right" class="ml-1 w-4 h-4"></i>
    </a>
  </div>
</div>
{% endfor %}
```

### Topic/Feature Card

```html
{% for topic in site.data.topics %}
<div class="card p-8 text-center">
  <div class="icon-circle icon-circle-teal">
    <i data-lucide="{{ topic.icon }}" class="w-8 h-8 text-white"></i>
  </div>
  <h3 class="text-xl font-bold mb-3 text-primary">{{ topic.title }}</h3>
  <p class="text-body">{{ topic.description }}</p>
</div>
{% endfor %}
```

---

## Logo Implementation

The KommMit logo uses SVG images from the official design assets:

**Header Logo** (colored version):
```html
<a href="/" class="flex items-center logo-link">
  <img src="{{ '/assets/images/logo.svg' | relative_url }}"
       alt="KomMit Prien am Chiemsee"
       class="logo-image">
</a>
```

**Footer Logo** (white version for dark backgrounds):
```html
<img src="{{ '/assets/images/logo-white.svg' | relative_url }}"
     alt="KomMit Prien am Chiemsee"
     class="logo-image-footer">
```

**Logo Size Classes:**
- `.logo-image` - Header size (40px height)
- `.logo-image-footer` - Footer size (48px height)

---

## Tailwind Integration

This design system works **alongside** Tailwind CSS:
- Use **utility classes** for brand colors, buttons, cards
- Use **Tailwind** for layout, spacing, responsive design
- Avoid inline `style=""` attributes - use utility classes instead

---

## Adding New Utility Classes

When adding new components, follow this pattern:

1. **Add CSS variable** (if needed):
```css
:root {
  --color-new: #123456;
}
```

2. **Create utility class**:
```css
.bg-new {
  background-color: var(--color-new);
}
```

3. **Document it** in this file

4. **Use it** in templates:
```html
<div class="bg-new">Content</div>
```

---

## Responsive Design

All components use Tailwind's responsive prefixes:
- `md:` - Medium screens (768px+)
- `lg:` - Large screens (1024px+)

Example:
```html
<div class="grid md:grid-cols-3 gap-8">
  <!-- 1 column mobile, 3 columns desktop -->
</div>

<h1 class="text-5xl md:text-7xl">
  <!-- Smaller on mobile, larger on desktop -->
</h1>
```

---

## Maintenance

**To change colors site-wide:**
1. Edit CSS variables in `/assets/css/main.css`
2. No need to touch HTML templates

**To add new content types:**
1. Create new YAML file in `_data/`
2. Add new utility classes if needed
3. Create template in `_includes/`
4. Document in `CONTENT_GUIDE.md`

**To ensure consistency:**
- ✅ Use utility classes
- ✅ Reference CSS variables
- ❌ Avoid inline styles
- ❌ Avoid hardcoded colors

---

## Resources

- **Icons**: [Lucide Icons](https://lucide.dev/icons/)
- **Tailwind Docs**: [tailwindcss.com](https://tailwindcss.com)
- **Content Guide**: See `CONTENT_GUIDE.md`
- **Design Assets**: See `design/` folder for logo files

---

## Summary

This design system enables:
- **Non-technical content editing** via YAML files
- **Centralized styling** via CSS variables
- **Consistent branding** across all components
- **Easy maintenance** - change once, update everywhere

**Questions?** Reference this guide or check `/assets/css/main.css` for implementation details.

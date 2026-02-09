# Kommitprien

A GitHub Pages site powered by Jekyll.

## Setup

### Local Development

1. Install dependencies:
   ```bash
   bundle install
   ```

2. Run the development server:
   ```bash
   bundle exec jekyll serve
   ```

3. View your site at `http://localhost:4000/kommitprien/`

### Deployment

This site automatically deploys to GitHub Pages using GitHub Actions when you push to the `main` branch.

#### Enable GitHub Pages

1. Go to your repository on GitHub
2. Navigate to **Settings** → **Pages**
3. Under **Source**, select **GitHub Actions**
4. Push your changes to trigger the first deployment

Your site will be available at: `https://[your-github-username].github.io/kommitprien/`

### Configuration

Edit `_config.yml` to customize:
- Site title and description
- Your email
- Base URL (if deploying to a different location)
- Theme settings

**Important**: Update the `url` field in `_config.yml` with your actual GitHub username.

## Project Structure

```
.
├── _config.yml          # Site configuration
├── _posts/              # Blog posts (YYYY-MM-DD-title.md)
├── _layouts/            # Custom layouts (optional)
├── _includes/           # Reusable components (optional)
├── assets/              # CSS, images, JS (optional)
├── index.md             # Homepage
├── about.md             # About page
├── Gemfile              # Ruby dependencies
└── .github/
    └── workflows/
        └── jekyll.yml   # GitHub Actions deployment
```

## Adding Content

### Pages

Create new pages as Markdown files with front matter:

```markdown
---
layout: page
title: My Page
permalink: /my-page/
---

# Content here
```

### Blog Posts

Create posts in `_posts/` with the naming format: `YYYY-MM-DD-title.md`

```markdown
---
layout: post
title: "My First Post"
date: 2026-02-09 12:00:00 +0000
categories: blog
---

Post content here.
```

## Resources

- [Jekyll Documentation](https://jekyllrb.com/docs/)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [Minima Theme](https://github.com/jekyll/minima)

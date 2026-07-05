# PKL Web Bojonegara — Blog / CMS Database

This repository holds the database layer of a simple blog/CMS website I built during my school internship (PKL — Praktik Kerja Lapangan) at the Bojonegara Sub-district Office (Kecamatan Bojonegara), Serang Regency, Banten. The idea was to give the office an easy way to publish news and announcements, with a basic admin panel for managing posts, categories, and tags.

## What's in this repo

- `blog_clean.sql` — the database schema and sample data, cleaned up and translated to English.

## ⚠️ Important — sensitive data found in the original files

Before publishing, I went through the original export and found the following:

- The `users` table originally contained **3 real people's email addresses and their real bcrypt password hashes**. I've replaced that entire table with anonymized demo accounts (see below). The real data has not been included anywhere in this repo.
- The original zip also had a second file, a broken/experimental schema dump (mismatched columns, an unfinished pivot table) that was clearly a failed attempt and not meant to be published. I left it out entirely rather than "cleaning" it, since keeping it around serves no purpose.
- The full application source code (the actual Laravel controllers, views, and routes) was **not** part of this export — only the two SQL dumps and a note pointing to a personal Google Drive folder. So this repo currently documents the **database design only**, not the full app. If you still have the original Laravel project files, I'd recommend adding them to this repo as well so the project is complete and runnable.

**If you're publishing this publicly, double check there's no other personal data (real names, emails, uploaded images, etc.) hiding in any other file before you push.**

## Database overview

| Table | Purpose |
|---|---|
| `category` | Post categories (News, Announcements, Community, Tips & Tricks) |
| `tags` | Tags that can be attached to posts (many-to-many) |
| `posts` | Blog posts — title, content, image, category, author, soft-deletable |
| `posts_tags` | Pivot table linking posts and tags |
| `users` | Admin panel accounts, with a `type` column (`1` = admin, `0` = contributor) |
| `password_resets`, `personal_access_tokens`, `failed_jobs` | Standard Laravel framework tables |

### Demo accounts

| Email | Password | Role |
|---|---|---|
| admin@example.com | password | Admin |
| editor@example.com | password | Contributor |

These are placeholder accounts for local development only — change the passwords immediately if this is ever deployed anywhere public.

## How to import

**Option 1 — phpMyAdmin**
1. Create a new database (e.g. `blog`).
2. Go to the **Import** tab and select `blog_clean.sql`.

**Option 2 — MySQL CLI**
```bash
mysql -u root -p blog < blog_clean.sql
```

## Notes to self / next steps

- Add the actual Laravel application code (models, controllers, views, routes) to this repo so it's a complete, runnable project.
- Consider renaming `posts_tags` → `post_tag` and `users_id`-style columns to match Laravel's naming convention if the app code gets rebuilt.
- Add a `.gitignore` and `.env.example` once the app code is added.

## License

Free to use for learning purposes.

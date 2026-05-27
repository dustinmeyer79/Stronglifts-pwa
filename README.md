# Cloud 5x5 Tracker PWA

A private StrongLifts-style 5x5 tracker that runs from GitHub Pages and syncs your workout data to your own free Supabase project.

## Files

- `index.html` — the app
- `manifest.webmanifest` — PWA install metadata
- `sw.js` — offline/cache support
- `supabase-schema.sql` — database table and security policies
- `icons/` — app icons

## Deploy to GitHub Pages

1. Create a GitHub repo, for example `stronglifts-pwa`.
2. Upload these files into the repo root so `index.html` is at the top level.
3. Go to **Settings → Pages**.
4. Under **Build and deployment**, choose **Deploy from a branch**.
5. Select `main` and `/root`, then save.
6. Your URL should be similar to:

   `https://dustinmeyer79.github.io/stronglifts-pwa/`

## Create the free Supabase backend

1. Go to Supabase and create a free project.
2. In Supabase, open **SQL Editor**.
3. Paste and run the contents of `supabase-schema.sql`.
4. Go to **Project Settings → API** and copy:
   - Project URL
   - anon public key
5. In the PWA, open the **Data** tab.
6. Paste the Supabase URL and anon key.
7. Click **Save Cloud Settings**.
8. Enter your email and click **Email Magic Link**.
9. Open the magic link on your iPhone.
10. Use **Push to Cloud** to upload your current device data.

## iPhone install

Open the GitHub Pages URL in Safari, then tap:

**Share → Add to Home Screen**

## Privacy model

- The app is still a static GitHub Pages app.
- Your workout data is not stored in the GitHub repo.
- Your workout data is stored in your Supabase database under your authenticated user ID.
- Row Level Security policies restrict each signed-in user to their own row.
- A local cache remains on the phone so the app can work offline.

## Important security note

The Supabase anon key is designed to be public in browser apps, but only if Row Level Security is enabled and configured correctly. Do not use the Supabase service role key in this app.

## Backups

The app still includes Export/Import Backup. Use this occasionally so you have a copy outside both your phone and Supabase.

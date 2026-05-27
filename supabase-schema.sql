-- Run this in Supabase SQL Editor after creating a free Supabase project.
-- It creates a private one-row-per-user JSON store for the 5x5 PWA.

create table if not exists public.stronglifts_data (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.stronglifts_data enable row level security;

-- Clean re-run support
DROP POLICY IF EXISTS "Users can read own 5x5 data" ON public.stronglifts_data;
DROP POLICY IF EXISTS "Users can insert own 5x5 data" ON public.stronglifts_data;
DROP POLICY IF EXISTS "Users can update own 5x5 data" ON public.stronglifts_data;
DROP POLICY IF EXISTS "Users can delete own 5x5 data" ON public.stronglifts_data;

create policy "Users can read own 5x5 data"
on public.stronglifts_data
for select
to authenticated
using (auth.uid() = user_id);

create policy "Users can insert own 5x5 data"
on public.stronglifts_data
for insert
to authenticated
with check (auth.uid() = user_id);

create policy "Users can update own 5x5 data"
on public.stronglifts_data
for update
to authenticated
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

create policy "Users can delete own 5x5 data"
on public.stronglifts_data
for delete
to authenticated
using (auth.uid() = user_id);

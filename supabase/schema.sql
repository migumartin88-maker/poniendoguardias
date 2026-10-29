create table if not exists public.schedule_entries (
  date date primary key,
  person text not null default '',
  note text not null default '',
  updated_at timestamptz not null default now()
);

alter table public.schedule_entries enable row level security;

grant usage on schema public to anon;
grant select, insert, update on public.schedule_entries to anon;

drop policy if exists "Anyone can read schedule entries" on public.schedule_entries;
create policy "Anyone can read schedule entries"
  on public.schedule_entries for select to anon
  using (true);

drop policy if exists "Anyone can add schedule entries" on public.schedule_entries;
create policy "Anyone can add schedule entries"
  on public.schedule_entries for insert to anon
  with check (true);

drop policy if exists "Anyone can update schedule entries" on public.schedule_entries;
create policy "Anyone can update schedule entries"
  on public.schedule_entries for update to anon
  using (true)
  with check (true);

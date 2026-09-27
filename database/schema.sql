-- AI Career Intelligence Agent
-- Portfolio reference schema.
-- Do not store private credentials or production secrets in this repository.

create table if not exists user_profile (
  id uuid primary key default gen_random_uuid(),
  display_name text,
  created_at timestamptz not null default now()
);

create table if not exists career_evidence (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references user_profile(id) on delete cascade,
  category text not null,
  title text not null,
  statement text not null,
  evidence_status text not null check (evidence_status in ('VERIFIED','USER_CONFIRMED','REASONABLE_REWORDING','UNKNOWN','UNVERIFIED')),
  source text,
  source_reference text,
  notes text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists jobs (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references user_profile(id) on delete cascade,
  company text,
  role_title text not null,
  seniority text,
  location text,
  work_model text,
  source text,
  source_url text,
  raw_text text,
  captured_at timestamptz not null default now()
);

create table if not exists job_requirements (
  id uuid primary key default gen_random_uuid(),
  job_id uuid not null references jobs(id) on delete cascade,
  requirement text not null,
  requirement_type text not null check (requirement_type in ('MUST','SHOULD','NICE')),
  category text,
  source_excerpt text,
  created_at timestamptz not null default now()
);

create table if not exists fitments (
  id uuid primary key default gen_random_uuid(),
  job_id uuid not null references jobs(id) on delete cascade,
  overall_score numeric,
  priority_flag text,
  summary text,
  evidence_notes jsonb not null default '[]'::jsonb,
  gaps jsonb not null default '[]'::jsonb,
  assumptions jsonb not null default '[]'::jsonb,
  created_at timestamptz not null default now()
);

create table if not exists requirement_matches (
  id uuid primary key default gen_random_uuid(),
  fitment_id uuid not null references fitments(id) on delete cascade,
  requirement_id uuid not null references job_requirements(id) on delete cascade,
  evidence_id uuid references career_evidence(id) on delete set null,
  support_level text not null,
  gap_type text,
  explanation text,
  confidence text,
  created_at timestamptz not null default now()
);

create table if not exists pending_questions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references user_profile(id) on delete cascade,
  question text not null,
  context text,
  affected_evidence jsonb not null default '[]'::jsonb,
  affected_jobs jsonb not null default '[]'::jsonb,
  priority text,
  status text not null default 'OPEN',
  answer text,
  confirmed_at timestamptz,
  created_at timestamptz not null default now()
);

create table if not exists resume_versions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references user_profile(id) on delete cascade,
  job_id uuid references jobs(id) on delete set null,
  version_name text not null,
  content text,
  change_log jsonb not null default '[]'::jsonb,
  evidence_map jsonb not null default '[]'::jsonb,
  created_at timestamptz not null default now()
);

create table if not exists applications (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references user_profile(id) on delete cascade,
  job_id uuid not null references jobs(id) on delete cascade,
  resume_version_id uuid references resume_versions(id) on delete set null,
  status text not null default 'PREPARING',
  fields jsonb not null default '[]'::jsonb,
  approval_required boolean not null default true,
  submitted_at timestamptz,
  created_at timestamptz not null default now()
);

create table if not exists interviews (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references user_profile(id) on delete cascade,
  job_id uuid not null references jobs(id) on delete cascade,
  preparation jsonb not null default '{}'::jsonb,
  feedback jsonb not null default '[]'::jsonb,
  created_at timestamptz not null default now()
);

create table if not exists skill_gaps (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references user_profile(id) on delete cascade,
  skill text not null,
  evidence_gap_count integer not null default 0,
  relevant_job_count integer not null default 0,
  priority text,
  rationale text,
  created_at timestamptz not null default now()
);

create table if not exists learning_plans (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references user_profile(id) on delete cascade,
  skill_gap_id uuid references skill_gaps(id) on delete set null,
  target_level text,
  plan jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

create index if not exists idx_career_evidence_user on career_evidence(user_id);
create index if not exists idx_jobs_user on jobs(user_id);
create index if not exists idx_job_requirements_job on job_requirements(job_id);
create index if not exists idx_pending_questions_user_status on pending_questions(user_id, status);

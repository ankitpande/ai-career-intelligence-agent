# AI Career Intelligence Agent

A truthful, evidence-driven AI system for evaluating job opportunities, tailoring applications, preparing interviews, and building a long-term career intelligence layer.

## Product principles

- **Truth > keyword matching > ATS optimization**
- Career evidence is the source of truth; resumes and applications are presentation layers.
- Unknown or unverified facts are never silently converted into claims.
- Important claims should be traceable to their evidence.
- Human approval is required before adding material factual claims, sending external communications, or submitting an application.
- The system is modular so individual agents can evolve independently.

## What this project is designed to do

1. Capture and structure career evidence.
2. Ingest job descriptions from text, URLs, screenshots, PDFs, documents, and recruiter messages.
3. Parse requirements into structured MUST / SHOULD / NICE categories.
4. Produce evidence-backed fit analysis with category-level explanations.
5. Identify evidence gaps versus true skill gaps.
6. Tailor resumes without changing factual truth or seniority.
7. Generate application-form answers with source and confidence tracking.
8. Maintain a job/application pipeline.
9. Prepare role-specific interviews and mock interviews.
10. Aggregate recurring skill gaps into learning plans.
11. Support browser-based application assistance with a hard stop before final submission.

## Portfolio boundary

This repository contains the product architecture, schemas, prompts, workflows, documentation, and safe demonstrations.

**Private career evidence, personal resume data, credentials, API keys, application accounts, and private job/application information do not belong in this public repository.**

## Architecture

The system is intentionally modular:

- Job Intake Agent
- JD Parser
- Fitment Engine
- Evidence Matcher
- Follow-up Question Engine
- Resume Tailoring Engine
- Human Voice / Outreach Engine
- Application Form Engine
- Job Tracker
- Career Memory / Evidence Bank
- Skill Gap Engine
- Learning Plan Engine
- Interview Preparation Engine
- Mock Interview Engine
- PDF Generator
- Browser Automation Layer

See `docs/architecture.md` for the high-level design.

## Planned no-code / low-code implementation

The implementation is designed to minimize custom coding:

- AI model layer
- Managed relational data layer
- Visual workflow orchestration
- AI-assisted application builder
- GitHub as portfolio/version-control layer
- Browser automation only where necessary for application workflows

See `docs/no-code-stack.md`.

## Status

**Phase 0 — Product blueprint**

The public repository is being established before building the private runtime.

## Roadmap

- Phase 1: Career Intelligence MVP
- Phase 2: Application Engine
- Phase 3: Browser Application Assistant
- Phase 4: Career Intelligence, learning and interview layer

See `docs/roadmap.md`.

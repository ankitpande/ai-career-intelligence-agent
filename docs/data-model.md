# Data Model

The runtime should use structured records rather than storing the whole career story as one unstructured prompt.

## Primary entities

- USER_PROFILE
- CAREER_EVIDENCE
- SKILLS
- PROJECTS
- ACHIEVEMENTS
- PENDING_QUESTIONS
- JOB
- JOB_REQUIREMENT
- FITMENT
- RESUME_VERSION
- OUTREACH
- APPLICATION
- INTERVIEW
- SKILL_GAP
- LEARNING_PLAN
- FEEDBACK

## Required traceability pattern

Important output claims should be able to point back to:

1. the source evidence record,
2. the evidence status,
3. the original source or note,
4. the transformation performed by the AI,
5. the output where the claim was used.

## Evidence status

- VERIFIED
- USER_CONFIRMED
- REASONABLE_REWORDING
- UNKNOWN
- UNVERIFIED

The system must never silently promote UNKNOWN or UNVERIFIED evidence into fact.

# System Architecture

## Design goal

The system should behave like a career operating layer rather than a single prompt.

## Core flow

Career Evidence -> Evidence Store -> Job Intake -> JD Parser -> Requirement Model -> Evidence Matcher -> Fitment Engine -> Tailoring / Application / Interview outputs

The feedback loop runs in the opposite direction:

Application outcome -> Interview feedback -> Human correction -> Evidence / Skill Gap updates -> future job analysis

## Agents

### Job Intake Agent
Accepts job information from screenshots, URLs, PDFs, Word documents, pasted text, and recruiter messages.

### JD Parser
Converts unstructured job information into structured company, role, seniority, location, work model, requirements, responsibilities, outcomes, technologies, leadership expectations, and application metadata.

### Evidence Matcher
Maps each requirement to career evidence and labels the relationship as supported, partially supported, evidence missing, or genuinely unclear.

### Fitment Engine
Calculates overall fit plus category-level views. Every score must have an evidence explanation, missing evidence, assumptions, and gaps.

### Resume Tailoring Engine
Changes emphasis and ordering while preserving factual accuracy, seniority, dates, titles, metrics, and actual experience.

### Application Form Engine
Generates field-level answers with source, confidence, and human-confirmation state.

### Interview Engine
Builds preparation around the role, company, responsibilities, likely questions, and the candidate's real evidence.

### Skill Gap Engine
Looks across multiple jobs to identify recurring requirements where evidence is insufficient.

### Browser Application Layer
Assists with navigation, extraction, field filling, resume upload, and validation. It must stop before final submission.

## Human approval gates

The system must require explicit approval before:

- adding a new factual career claim
- resolving uncertain experience in a way that changes the evidence record
- sending external recruiter / hiring-manager communication
- submitting an application
- making a major career-positioning change

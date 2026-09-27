# Pending Questions

Pending questions are a persistent data object, not a disposable chat message.

## Purpose

When evidence is missing, the system should ask the smallest question needed to resolve the uncertainty.

## Fields

- question_id
- question
- context
- affected_evidence
- affected_jobs
- priority
- status
- answer
- confirmed_at

## Rules

- Do not repeat an already answered question.
- Ask only when the answer can materially improve a downstream result.
- Preserve unanswered questions for later opportunities.

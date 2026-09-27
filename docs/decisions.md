# Architecture Decisions

## ADR-001: Evidence-first design
Career evidence is the source of truth. Resume and application outputs are derived views.

## ADR-002: Public/private separation
Public GitHub contains the product system and synthetic examples; private runtime stores personal career data.

## ADR-003: Human approval for consequential actions
The system may prepare external actions, but consequential actions require explicit approval.

## ADR-004: Modular agents
Use independent components so parsing, matching, tailoring, applications, and interviews can evolve independently.

## ADR-005: No-code-first implementation
Prefer visual workflow and AI-assisted app-building tools over custom software development for the first production version.

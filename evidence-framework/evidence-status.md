# Evidence Status Framework

Evidence status controls what the agent is allowed to state as fact.

## VERIFIED
Supported by a trusted source or documentation already accepted as authoritative.

## USER_CONFIRMED
Explicitly confirmed by the user.

## REASONABLE_REWORDING
A wording transformation that does not introduce a new factual claim.

## UNKNOWN
The system does not have enough information.

## UNVERIFIED
A claim may exist in an input but has not been validated sufficiently.

## Rules

- UNKNOWN is not TRUE.
- UNVERIFIED is not TRUE.
- A resume cannot upgrade evidence status merely by restating a claim.
- Material new claims require human confirmation.

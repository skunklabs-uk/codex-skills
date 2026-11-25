---
name: read-vdo-hour-meter
description: Use when the user asks Codex to inspect Kong aircraft hour-meter photos in a local folder, read the VDO tachometer LCD display, transcribe decimal-hour values, or create/update a readings.yml file.
---

# Read VDO Hour Meter

## Overview

Use this skill to inspect a folder of aircraft hour-meter photos and produce a
Kong-compatible manual readings file. The task is visual extraction: read the
black LCD digits on the VDO tachometer and map each source filename to a
decimal-hour value.

## Workflow

1. Confirm the input folder exists. If the user did not give a folder, ask for it.
2. List image files only. Prefer `rg --files <folder>`; include `.jpg`, `.jpeg`,
   `.png`, `.heic`, and `.webp` case-insensitively.
3. Sort photos by EXIF capture time when available; otherwise sort by filename.
   In Kong, EXIF can be checked with `kong.adapters.exif.read_exif_photo_metadata`.
4. Open each image with `view_image` using the absolute path and `detail="original"`
   when precision matters.
5. Read only the LCD display. Ignore all white dial text, white dial numerals,
   aircraft labels, stickers, and instrument labels.
6. Build a proposed table: filename, capture time if known, reading, confidence,
   and notes for unclear cases. Use `????` as the reading placeholder for values
   that are not clear enough to trust.
7. Check the sequence and confirm photo pairings before comparing block-off and
   block-on. Flag durations over 4 hours as practical anomalies, not automatic
   errors; use photo timing and the meter's tenths as approximate checks.
8. If creating or updating a readings file is in scope, write `readings.yml` in
   the image folder unless the user requested another path. Put decimal readings
   for clear values and the quoted placeholder `'????'` for unclear values.
9. If the file contains placeholders, report the filenames and stop before
   running Kong. The user must complete the values first.
10. Continue with `--append-sheet --create-gmail-draft` only when both downstream
    writes are within the user's authorized scope. A request to read photos or
    produce `readings.yml` alone does not authorize them. Do not add
    `--complete-run` unless Drive archive/state completion is also authorized;
    it requires Drive write scopes.

## Visual Reading Rules

Read [references/vdo-reading-rules.md](references/vdo-reading-rules.md) before
extracting values from real photos.

Essential rules:

- The target display is the small grey-green rectangular LCD inside the VDO
  tachometer, usually near the lower-left/lower portion of the round gauge.
- LCD digits are black seven-segment digits. Surrounding VDO/RPM labels and dial
  numbers are white and must be ignored.
- The last LCD digit is always tenths of an hour. Output exactly one decimal
  digit, such as `2009.1`.
- If the decimal dot is not visible but the LCD digits are otherwise clear and
  contiguous, place the decimal point before the final digit.
- Do not copy extra white digits from the dial into the reading.
- Do not invent hidden digits. If a digit is cropped, blocked by glare, or
  covered by the needle, mark the reading `????` in the table and, if a YAML
  file was requested, in `readings.yml`.

## Output Contract

Working YAML may contain placeholders for values that need human completion:

```yaml
readings:
  BF3AF73B-EE90-4E35-A895-7A5C92C27B42.JPG: 2008.2
  D404D516-8F3C-4A61-B9C3-6A7FD8E9756E.JPG: '????'
```

Final app-ready YAML must contain only valid readings before Kong is run:

```yaml
readings:
  BF3AF73B-EE90-4E35-A895-7A5C92C27B42.JPG: 2008.2
  D404D516-8F3C-4A61-B9C3-6A7FD8E9756E.JPG: 2009.1
```

Do not put `UNREADABLE`, comments, notes, confidence values, or alternate
candidates inside `readings.yml`. Use only decimal values matching `^\d+\.\d$`
or the temporary placeholder `'????'`.

Report unresolved values whether or not a YAML file was requested:

```text
filename.JPG  unclear  leftmost LCD digit cut off
```

If the user also requested the downstream workflow, replace every `????` before
running Kong. The continuation command appends to Sheets and creates a Gmail draft:

```bash
uv run kong drive-dry-run --env-file .env.development --review --readings-file photo/YYYY-MM-DD/readings.yml --append-sheet --create-gmail-draft
```

Add `--complete-run` only when the user explicitly wants Drive archive/state
completion and the Google token has Drive write scopes.

## Common Mistakes

- Reading the white `5` or `6` printed on the dial as part of the LCD value.
- Reading the white aircraft/sticker label, such as `ISP 2059`, instead of the
  LCD hour meter.
- Treating a dim decimal dot as missing and returning an integer. Always output
  decimal hours with one tenth digit.
- Correcting a value only because the duration would be nicer. Use timing as a
  sanity check, not as permission to invent digits.

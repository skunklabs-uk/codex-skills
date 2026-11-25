# VDO Hour Meter Reading Rules

## Target Region

The hour meter is the grey-green LCD window embedded in the VDO tachometer. It is
inside the round instrument face, commonly below the `0`/near the `6` area. The
LCD has dark seven-segment digits on a pale background.

Ignore these distractors:

- white tachometer numerals (`0`, `1`, `2`, `3`, `4`, `5`, `6`);
- white tick marks and `RPM x1000` / `VDO` text;
- white aircraft labels or stickers such as `ISP 2059`;
- other instruments visible around the tachometer.

## Decimal Format

The aircraft meter records decimal hours. The final LCD digit is tenths:

- visible `20091` means `2009.1`;
- visible `20122` means `2012.2`;
- visible `20099` means `2009.9`.

Always output one decimal digit with `.` as separator. Never use a comma.

## Confidence

Use high confidence only when every black LCD digit is visible enough to read.
Use low confidence or stop when:

- the first or last digit is cropped;
- glare washes out a digit;
- the tachometer needle or reflection crosses the LCD;
- only a partial segment pattern is visible;
- a surrounding white dial number could be mistaken for an LCD digit.

## Sequence Checks

Sort images by capture time when available, but verify which photos belong
together and which show block-off and block-on. Do not assume every consecutive
pair is complete; report ambiguous associations.

For a confirmed pair, check that the block-on reading is greater than block-off.
Flag durations over 4 hours for review: this is a practical anomaly threshold,
not an automatic error or an operating limit. Compare elapsed time between photos
with the meter duration as an approximate check. One tenth of an hour is six
minutes; photo timing may also differ from meter start and stop.

Report suspicious readings, timing or pairings for confirmation. Never alter a
reading to make a duration fit.

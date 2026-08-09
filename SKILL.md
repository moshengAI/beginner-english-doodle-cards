---
name: beginner-english-doodle-cards
description: Create 9:16 beginner-English vocabulary cards and matching scenic illustrations in a cohesive hand-drawn Chinese tea-poster aesthetic. Use when the user asks for English memory cards, topic vocabulary posters, city/food/clothing illustrations, or a matching set of educational visuals.
---

# Beginner English Doodle Cards

Create a reusable visual system for beginner-English short-video content. Keep every asset warm, playful, legible, and visually related to the existing series.

## Visual language

- Use a 9:16 vertical portrait composition.
- Use a warm off-white paper background with subtle paper grain.
- Draw with simple, slightly imperfect black hand-drawn outlines.
- Use a restrained palette: tea green, coral orange, pale yellow, sky blue, leaf green, and dark charcoal.
- Use rounded panels, soft organic shapes, occasional dashed stitched borders, and generous margins.
- Make illustrations childlike and friendly: simple faces, small doodles, gentle motion marks, leaves, clouds, hearts, stars, cups, and other topic-matched motifs.
- Preserve a contemporary Chinese tea-drink poster feeling without copying a brand logo, mascot, trademark, or exact proprietary layout.
- Keep the design charming but educational; the English text must remain the visual priority.

## Choose the asset type

### Memory card

Use when the user supplies vocabulary, a sentence frame, a grammar contrast, or a topic list.

Layout:

1. Small title at the top: English topic or sentence frame plus a short Chinese label.
2. One or two large rounded content panels.
3. Put exact English examples on the left or in a clear reading column.
4. Put simple topic-matched doodles on the right or in open spaces; never cover text.
5. Add a small highlighted reminder or review sentence at the bottom when useful.

Keep one main learning point per card. For a beginner card, use roughly 6–10 vocabulary items or 4–8 example sentences; split larger lists into additional cards rather than shrinking the type.

### Scenic illustration

Use when the user asks for a separate picture for a city, landmark, food, clothing item, or other vocabulary term.

- Create one standalone 9:16 illustration per requested subject.
- Use one clear focal object or landmark and a simple surrounding scene.
- Omit text, lettering, logos, and watermarks unless the user explicitly requests a label.
- Keep the same palette, outline treatment, paper texture, and childlike proportions as the memory cards.
- For city scenes, show a recognizable landmark and a few environmental cues (waterfront, street, trees, skyline, desert, mountain, etc.).

## Beginner-English accuracy rules

- Preserve the user's exact copy unless it is grammatically wrong; silently correct only when the correction is unambiguous, and mention the correction in the handoff.
- Keep English capitalization and punctuation exact, especially city and country names.
- Check articles and countability: use `a basketball`, `a phone`, `a question` when needed.
- Check verb patterns: `I want to + verb`, `I need to + verb`, `I can + base verb`, `I like + noun` or `I like + verb-ing`.
- Prefer natural everyday phrases over literal translations.
- Use Chinese explanations that are short and concrete. Avoid advanced grammar terminology unless it is necessary.

## Generation workflow

1. Extract the exact topic, vocabulary, examples, language level, format, and requested dimensions.
2. Decide whether the deliverable is a memory card, a scenic illustration, or both.
3. Create a structured image prompt with: use case, asset type, scene, subject, style, composition, palette, exact text, and avoid list.
4. Use the built-in image-generation tool by default. Generate separate calls for distinct assets; do not combine unrelated subjects into one image when the user asks for individual files.
5. Inspect every output for: correct subject, correct style, 9:16 composition, readable text, spelling, punctuation, and unobstructed layout.
6. If text is wrong or crowded, regenerate with a targeted correction. Do not accept an image with misspelled teaching content.
7. Copy final project-bound images into the current workspace using descriptive filenames such as `I_can_memory_card_9x16.png` or `Paris_city_scene_9x16.png`.
8. Return a preview plus absolute file links. Mention any language correction made during generation.

## Distribution and installation

The easiest distribution path is the standard `skills` CLI:

```bash
# Install globally for all detected Agent runtimes
npx -y skills add moshengAI/beginner-english-doodle-cards -g --all

# Or install only for Codex
npx -y skills add moshengAI/beginner-english-doodle-cards -g --agent codex
```

The bundled `scripts/install.sh` is an alternative for installing from an unpacked skill directory or a local ZIP. It supports `codex`, `claude`, `agents`, `grok`, or `all` targets.

```bash
# Install the unpacked skill for Codex
bash scripts/install.sh --target codex

# Install a shared ZIP for every supported runtime
bash scripts/install.sh --all --archive /path/to/beginner-english-doodle-cards.skill.zip

```

After installation, the user may invoke `$beginner-english-doodle-cards` in the target agent.

## Prompt templates

### Memory card template

```text
Use case: infographic-diagram / ads-marketing.
Asset type: 9:16 vertical beginner-English memory card.
Primary request: create a clean educational poster with [one or two] stacked rounded content panels.
Scene/backdrop: warm off-white paper with subtle grain.
Style/medium: playful childlike hand-drawn illustration, imperfect black outlines, contemporary Chinese tea-poster aesthetic.
Composition/framing: portrait 9:16, generous margins, large readable English, Chinese explanation below each frame, doodles placed away from text.
Color palette: tea green, coral orange, pale yellow, sky blue, leaf green, charcoal.
Text (verbatim): "[paste exact English and Chinese copy]"
Constraints: keep all teaching text exact and legible; preserve one clear learning point; no text covered by illustrations.
Avoid: logos, watermarks, extra words, misspellings, tiny type, clutter, photorealism, heavy gradients.
```

### Scenic illustration template

```text
Use case: illustration-story / infographic-diagram.
Asset type: standalone 9:16 vocabulary scenic illustration.
Primary request: illustrate [city/subject] with one clear recognizable focal landmark or object.
Scene/backdrop: [waterfront/street/park/desert/room/etc.], warm off-white paper sky and gentle environmental cues.
Style/medium: childlike hand-drawn poster illustration, simple black outlines, flat tea-poster palette, light paper texture.
Composition/framing: portrait 9:16, one focal point, open breathing room, balanced foreground and background.
Color palette: tea green, coral orange, pale yellow, sky blue, leaf green, charcoal.
Text (verbatim): none unless explicitly requested.
Constraints: recognizable subject, consistent series style, clean silhouette, no clutter.
Avoid: logos, watermarks, lettering, photorealism, random extra landmarks, heavy gradients.
```

## Filename and handoff convention

Use stable names with the English subject first:

- `I_want_memory_card_9x16.png`
- `foreign_cities_memory_card_9x16.png`
- `New_York_city_scene_9x16.png`

Always show the generated image inline and provide the absolute saved path. If multiple images are created, list every file separately.

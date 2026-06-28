# AGENTS.md — card-dynamic-style-skill

## Purpose

Add 灵动感 (dynamic, lively feel) to HTML/CSS card components with 3 curated animation styles. Each style combines 3D perspective, light effects, and content feedback at different intensities. All animations are optimized for 60fps using only `transform` and `opacity`.

## Activation Triggers

- User wants to add hover animations to card components
- User mentions "灵动感", "卡片动效", "card animation", "hover effect"
- User wants glassmorphism, 3D tilt, or dynamic border effects
- User has a card component and wants it to feel more alive
- Keywords: card, hover, animation, glassmorphism, 3D, tilt, glow, pulse, 灵动, 悬浮, 光效

## Usage

Invoke `/card-dynamic-style-skill` or describe your card animation needs. The skill will:

1. Understand your card structure and tech stack
2. Present 3 style options:
   - **玻璃光扫 (Glass Sweep)**: Gradient border glow + light sweep + subtle tilt — elegant, professional
   - **悬浮景深 (Floating Depth)**: Strong 3D perspective + heavy tilt + shadow — dramatic, immersive
   - **液态脉冲 (Liquid Pulse)**: Animated gradient + pulse border + staggered content — playful, eye-catching
3. Apply the chosen style to your cards with full code output
4. Verify performance (60fps, transform-only animation)

## Platform Compatibility

Works with any platform that reads SKILL.md or AGENTS.md:
- Claude Code, GitHub Copilot, Cursor, Windsurf, Codex CLI, Gemini CLI, Cline, Roo Code, and others

## Key Constraints

- All animations MUST use only `transform` and `opacity` (GPU-accelerated)
- Transition durations: 300-500ms (not too fast, not too slow)
- 3D tilt: X-axis 2-6deg, Y-axis 3-8deg max
- Stagger delays via `transition-delay` for rhythm
- `pointer-events: none` on overlay elements
- No multi-layer `blur()` filters on large areas

## References

For detailed CSS mechanics, customization guide, and troubleshooting, see:
- `references/styles-deep-dive.md`

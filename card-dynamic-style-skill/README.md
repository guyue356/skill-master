# card-dynamic-style-skill

Add 灵动感 (dynamic, lively feel) to card components with 3 curated animation styles.

## 3 Animation Styles

| Style | Name | Feel | Best For |
|-------|------|------|----------|
| 1 | 玻璃光扫 (Glass Sweep) | Elegant, professional | SaaS, product cards |
| 2 | 悬浮景深 (Floating Depth) | Dramatic, immersive | Hero, feature showcase |
| 3 | 液态脉冲 (Liquid Pulse) | Playful, eye-catching | Creative, marketing |

## Features

- 60fps GPU-accelerated animations (transform + opacity only)
- Tailwind CSS compatible
- Staggered timing for rhythm and polish
- Mobile-friendly with `prefers-reduced-motion` support
- Customizable colors, intensity, and timing

## Installation

### Claude Code (recommended)

```bash
git clone <repo-url> ~/.claude/skills/card-dynamic-style-skill
```

### VS Code Copilot

```bash
git clone <repo-url> .github/skills/card-dynamic-style-skill
```

### Cursor

```bash
git clone <repo-url> .cursor/skills/card-dynamic-style-skill
```

### Generic (any platform)

```bash
git clone <repo-url> ~/.agents/skills/card-dynamic-style-skill
```

Or use the installer:

```bash
./install.sh              # auto-detect platform
./install.sh claude       # explicit platform
./install.sh all          # install to all detected platforms
```

## Usage

```
/card-dynamic-style-skill Add dynamic hover to my product cards
/card-dynamic-style-skill 给我的博客卡片加灵动感
/card-dynamic-style-skill Apply glass sweep style to these cards
```

The skill will:
1. Understand your card structure
2. Present 3 style options
3. Apply the chosen style with full code output
4. Verify performance (60fps)

## Methodology

Based on a 3-layer animation system:

| Layer | Purpose | Example |
|-------|---------|---------|
| Physical Space | 3D depth, tilt, scale | `rotateX/Y`, `scale` |
| Light & Atmosphere | Material feel, glow | Gradient border, light sweep |
| Content Feedback | Interactive detail | Badge bounce, arrow slide |

**Key principles**:
- Animate only `transform` and `opacity` (GPU-accelerated)
- Stagger with `transition-delay` for rhythm
- 3D tilt: X 2-6deg, Y 3-8deg max
- Duration: 300-500ms (sweet spot)

## Customization

See `references/styles-deep-dive.md` for:
- Detailed CSS mechanics per style
- Color customization guide
- Timing parameter table
- Plain CSS equivalents
- Troubleshooting common issues

## License

MIT

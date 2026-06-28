---
name: card-dynamic-style-skill
description: >-
  Add dynamic, lively hover animations to HTML/CSS card components.
  Offers 3 curated animation styles: Glass Sweep (玻璃光扫), Floating Depth (悬浮景深),
  Liquid Pulse (液态脉冲). Optimized for 60fps performance using transform/opacity only.
  Works with Tailwind CSS. Keywords: card animation, hover effect, glassmorphism,
  3D tilt, dynamic card, 灵动感, 卡片动效, 悬浮效果, 光效, 渐变边框
license: MIT
metadata:
  author: guyue
  version: 1.0.0
  created: 2026-06-29
  last_reviewed: 2026-06-29
  review_interval_days: 90
---

# /card-dynamic-style-skill — Card Dynamic Animation Styles

You are an expert CSS/Tailwind animation engineer. Your job is to add 灵动感 (dynamic, lively feel) to card components by applying one of three curated animation styles. Each style combines 3D perspective, light effects, and content feedback at different intensities.

## Trigger

User invokes `/card-dynamic-style-skill` followed by their input:

```
/card-dynamic-style-skill Add dynamic hover to my product cards
/card-dynamic-style-skill 给我的博客卡片加灵动感
/card-dynamic-style-skill Enhance this card component with animation [pastes code]
/card-dynamic-style-skill Apply glass sweep style to these cards
```

## Workflow

### Step 1: Understand the Target Card

Read the user's card code (if provided) or ask:
1. What framework? (Tailwind CSS / plain CSS / other)
2. What does the card contain? (image, title, description, tags, CTA link)
3. Where is the card used? (landing page, blog, dashboard, portfolio)

If no code is provided, generate a generic card structure and apply the animation.

### Step 2: Present 3 Style Options

Show the user these 3 styles with descriptions and preview. Let them pick ONE.

#### Style 1: 玻璃光扫 (Glass Sweep)
**Core**: Gradient border glow + light sweep (探照灯) + subtle tilt
**Intensity**: Medium — elegant, professional
**Best for**: SaaS landing pages, product cards, portfolio items

```html
<div class="perspective-[800px] group relative overflow-hidden rounded-2xl
            border border-white/10 bg-white/5 backdrop-blur-sm
            transition-all duration-300 ease-out
            hover:scale-[1.02] hover:rotate-y-3 hover:rotate-x-2
            hover:border-transparent
            hover:shadow-[0_0_30px_rgba(99,102,241,0.15)]">

  <!-- Gradient border (pseudo-element via ring) -->
  <div class="absolute inset-0 rounded-2xl opacity-0 group-hover:opacity-100
              transition-opacity duration-500
              bg-gradient-to-br from-indigo-500/20 via-purple-500/10 to-pink-500/20
              pointer-events-none"></div>

  <!-- Light sweep (探照灯) -->
  <div class="absolute inset-0 -translate-x-full skew-x-[-30deg]
              bg-gradient-to-r from-transparent via-white/20 to-transparent
              group-hover:translate-x-[200%]
              transition-transform duration-700 ease-in-out
              pointer-events-none"></div>

  <!-- Content -->
  <div class="relative z-10 p-6">
    <span class="inline-block rounded-full bg-indigo-500/10 px-3 py-1 text-xs
                 transition-all duration-300 delay-100
                 group-hover:scale-110 group-hover:rotate-[-2deg]
                 group-hover:bg-indigo-500/20">
      Badge
    </span>
    <h3 class="mt-3 text-lg font-semibold text-white">Card Title</h3>
    <p class="mt-2 text-sm text-gray-400">Card description text here.</p>
    <a class="mt-4 inline-flex items-center gap-2 text-sm text-indigo-400
              transition-all duration-300 delay-200
              group-hover:text-indigo-300">
      Read more
      <span class="transition-all duration-300 delay-200
                   group-hover:translate-x-1 group-hover:-translate-y-1">→</span>
    </a>
  </div>
</div>
```

**Animation timeline**: Border glow (0ms) → Tilt + scale (150ms) → Light sweep (300ms) → Badge bounce (400ms) → Arrow slide (500ms)

#### Style 2: 悬浮景深 (Floating Depth)
**Core**: Strong 3D perspective + heavy tilt + shadow elevation + content float
**Intensity**: High — dramatic, immersive
**Best for**: Hero sections, feature showcases, image-heavy cards

```html
<div class="perspective-[600px] group relative overflow-hidden rounded-2xl
            bg-gray-900/80 border border-white/5
            transition-all duration-400 ease-out
            hover:scale-[1.04] hover:rotate-y-5 hover:rotate-x-3
            hover:shadow-[0_25px_60px_-12px_rgba(0,0,0,0.5)]
            hover:border-white/10">

  <!-- Subtle glow underneath -->
  <div class="absolute -inset-1 rounded-2xl opacity-0 blur-xl
              bg-gradient-to-br from-blue-500/20 to-purple-600/20
              group-hover:opacity-100
              transition-opacity duration-500
              pointer-events-none"></div>

  <!-- Content floats up -->
  <div class="relative z-10 p-6 transition-transform duration-400 ease-out
              group-hover:-translate-y-1">
    <span class="inline-block rounded-full bg-blue-500/10 px-3 py-1 text-xs
                 text-blue-400
                 transition-all duration-300 delay-75
                 group-hover:scale-110 group-hover:bg-blue-500/20">
      Badge
    </span>
    <h3 class="mt-3 text-lg font-semibold text-white
               transition-all duration-300 delay-100
               group-hover:translate-y-[-2px]">
      Card Title
    </h3>
    <p class="mt-2 text-sm text-gray-400
              transition-all duration-300 delay-150
              group-hover:translate-y-[-2px]">
      Card description text here.
    </p>
    <a class="mt-4 inline-flex items-center gap-2 text-sm text-blue-400
              transition-all duration-300 delay-200
              group-hover:text-blue-300">
      Read more
      <span class="transition-all duration-300 delay-200
                   group-hover:translate-x-1.5">→</span>
    </a>
  </div>
</div>
```

**Animation timeline**: Shadow lift (0ms) → Scale + tilt (100ms) → Badge (175ms) → Title float (200ms) → Description float (250ms) → Arrow (300ms)

#### Style 3: 液态脉冲 (Liquid Pulse)
**Core**: Animated gradient background + pulse border + staggered content entrance
**Intensity**: Medium-High — playful, eye-catching
**Best for**: Creative portfolios, social cards, marketing pages

```html
<div class="perspective-[800px] group relative overflow-hidden rounded-2xl
            border border-transparent bg-gray-900
            transition-all duration-300 ease-out
            hover:scale-[1.02] hover:rotate-y-2 hover:rotate-x-1">

  <!-- Animated gradient background -->
  <div class="absolute inset-0 bg-[length:200%_200%]
              bg-gradient-to-br from-indigo-600/0 via-purple-600/0 to-pink-600/0
              group-hover:from-indigo-600/10 group-hover:via-purple-600/10
              group-hover:to-pink-600/10
              group-hover:animate-gradient-shift
              transition-all duration-700
              pointer-events-none"></div>

  <!-- Pulse border -->
  <div class="absolute inset-0 rounded-2xl
              border-2 border-transparent
              bg-gradient-to-br from-indigo-500 via-purple-500 to-pink-500
              bg-origin-border
              opacity-0 group-hover:opacity-100
              transition-opacity duration-500
              pointer-events-none"
       style="-webkit-mask: linear-gradient(#fff 0 0) padding-box, linear-gradient(#fff 0 0);
              mask: linear-gradient(#fff 0 0) padding-box, linear-gradient(#fff 0 0);
              -webkit-mask-composite: xor; mask-composite: exclude;"></div>

  <!-- Light sweep -->
  <div class="absolute inset-0 -translate-x-full skew-x-[-30deg]
              bg-gradient-to-r from-transparent via-white/15 to-transparent
              group-hover:translate-x-[200%]
              transition-transform duration-800 ease-in-out delay-100
              pointer-events-none"></div>

  <!-- Content with stagger -->
  <div class="relative z-10 p-6">
    <span class="inline-block rounded-full bg-white/5 px-3 py-1 text-xs
                 transition-all duration-200 delay-150
                 group-hover:scale-110 group-hover:rotate-[-3deg]
                 group-hover:bg-white/10">
      Badge
    </span>
    <h3 class="mt-3 text-lg font-semibold text-white
               transition-all duration-250 delay-200
               group-hover:translate-y-[-3px]">
      Card Title
    </h3>
    <p class="mt-2 text-sm text-gray-400
              transition-all duration-250 delay-250
              group-hover:text-gray-300">
      Card description text here.
    </p>
    <a class="mt-4 inline-flex items-center gap-2 text-sm text-purple-400
              transition-all duration-300 delay-300
              group-hover:text-purple-300">
      Read more
      <span class="inline-block transition-all duration-300 delay-350
                   group-hover:translate-x-1.5 group-hover:-translate-y-1
                   group-hover:rotate-[-5deg]">→</span>
    </a>
  </div>
</div>
```

**Animation timeline**: Background shift (0ms) → Border pulse (100ms) → Tilt (150ms) → Light sweep (250ms) → Badge bounce (350ms) → Title float (400ms) → Arrow (500ms)

### Step 3: Apply & Customize

After the user picks a style:

1. **Adapt to their card structure** — map their existing elements (image, title, description, tags, CTA) into the chosen animation template
2. **Match their color scheme** — replace indigo/purple/pink defaults with their brand colors
3. **Add the `@keyframes` if using Style 3** (Liquid Pulse needs a gradient animation):

```css
@keyframes gradient-shift {
  0%, 100% { background-position: 0% 50%; }
  50% { background-position: 100% 50%; }
}
```

4. **Ensure parent has `perspective`** — if the card is nested, the direct parent needs `perspective: 800px` (or Tailwind `perspective-[800px]`)
5. **Verify `overflow: hidden`** on the card to clip the light sweep

### Step 4: Performance Checklist

Before delivering, verify ALL of these:

| Rule | Check |
|------|-------|
| ✅ Only `transform` and `opacity` animated | No `width`, `height`, `left`, `top`, `box-shadow` size changes |
| ✅ `backface-visibility: hidden` on animated elements | Prevents flicker on 3D transforms |
| ✅ `will-change: transform` on card | Hints GPU acceleration |
| ✅ Transition duration 300-500ms | Not too fast (no feel), not too slow (draggy) |
| ✅ Stagger delays via `transition-delay` | Not all at once — creates rhythm |
| ✅ `pointer-events: none` on overlay elements | Clicks pass through to interactive content |
| ✅ No multi-layer filters | Avoid `blur()` on large areas for performance |

### Step 5: Deliver

Output the complete, ready-to-paste code with:
- The chosen animation style applied to their card
- All necessary CSS (Tailwind classes or custom CSS)
- Any `@keyframes` if needed
- Brief explanation of what each animation layer does

## Performance Principles (Always Follow)

From the methodology:

1. **动谁不如动 `transform` 和 `opacity`** — scale, rotate, translate are GPU-accelerated. Never animate `width`, `height`, `left/top`, or `box-shadow` dimensions.
2. **背景微动用 `background-size: 200%` + `translateX`** — not multi-layer filters.
3. **光扫用 `skewX(-30deg) translateX(-100%)` → `translateX(200%)`** with `cubic-bezier` easing.
4. **3D倾斜的X/Y轴不要同时拉满** — X: 2-6deg, Y: 3-8deg max.
5. **Stagger顺序**: 边框光效(0ms) → 抬起缩放(150ms) → 标签箭头(300ms)

## References

See `references/styles-deep-dive.md` for:
- Detailed breakdown of each style's CSS mechanics
- Customization guide (colors, intensity, timing)
- Troubleshooting common issues (perspective conflicts, z-index stacking, mobile fallbacks)
- Plain CSS equivalents (non-Tailwind)

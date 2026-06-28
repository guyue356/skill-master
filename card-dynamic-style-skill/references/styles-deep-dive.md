# Styles Deep Dive — Card Dynamic Style Skill

## Style Comparison Matrix

| Dimension | 玻璃光扫 (Glass Sweep) | 悬浮景深 (Floating Depth) | 液态脉冲 (Liquid Pulse) |
|-----------|----------------------|------------------------|---------------------|
| **3D Intensity** | Subtle (2-3deg) | Heavy (3-5deg) | Moderate (1-2deg) |
| **Scale** | 1.02 | 1.04 | 1.02 |
| **Light Effect** | Gradient border + sweep | Under-glow blur | Pulse border + sweep |
| **Content Animation** | Badge + arrow | Full content float | Staggered all elements |
| **Background** | Static | Static | Animated gradient |
| **Best For** | SaaS, product cards | Hero, feature showcase | Creative, marketing |
| **Feel** | Elegant, refined | Dramatic, immersive | Playful, eye-catching |

---

## Style 1: 玻璃光扫 (Glass Sweep) — Detailed Mechanics

### Layer Breakdown

1. **Gradient Border Layer** (`::before` or overlay div)
   - Uses `bg-gradient-to-br` with brand colors at 10-20% opacity
   - Fades in on hover via `opacity: 0 → 1`
   - Creates the "glowing edge" effect

2. **Light Sweep Layer** (absolute positioned div)
   - Initial: `translate-x-full skew-x-[-30deg]` (off-screen left)
   - Hover: `translate-x-[200%]` (sweeps past to right)
   - Duration: 700ms with `ease-in-out`
   - The `-30deg` skew creates the diagonal sweep angle
   - `via-white/20` gives the "spotlight" center brightness

3. **3D Tilt** (on card itself)
   - `hover:rotate-y-3 hover:rotate-x-2` — subtle
   - Parent must have `perspective-[800px]`

### Color Customization

Replace the gradient colors to match brand:
```
from-indigo-500/20 → from-[your-primary]/20
via-purple-500/10 → via-[your-secondary]/10
to-pink-500/20 → to-[your-accent]/20
```

### Timing Customization

| Parameter | Default | Range | Effect |
|-----------|---------|-------|--------|
| Scale | 1.02 | 1.01-1.05 | Hover lift amount |
| Tilt X | 2deg | 1-6deg | Up/down tilt |
| Tilt Y | 3deg | 1-8deg | Left/right tilt |
| Sweep duration | 700ms | 500-1000ms | Light speed |
| Badge delay | 100ms | 0-300ms | Badge animation start |
| Arrow delay | 200ms | 100-400ms | Arrow animation start |

---

## Style 2: 悬浮景深 (Floating Depth) — Detailed Mechanics

### Layer Breakdown

1. **Under-glow Layer** (blurred gradient behind card)
   - Uses `-inset-1` with `blur-xl` for soft glow
   - Brand colors at 20% opacity
   - Fades in on hover — creates the "floating above surface" illusion

2. **Content Float** (inner content div)
   - `group-hover:-translate-y-1` — content lifts slightly
   - Each child has additional `-translate-y-[-2px]` with staggered delays
   - Creates parallax-like depth between card frame and content

3. **Shadow Elevation**
   - `hover:shadow-[0_25px_60px_-12px_rgba(0,0,0,0.5)]`
   - Large, soft shadow that simulates height increase
   - Use `rgba` with low alpha for natural look

4. **Strong 3D Tilt**
   - `hover:rotate-y-5 hover:rotate-x-3` — noticeable but not disorienting
   - Parent: `perspective-[600px]` (lower = more dramatic)

### Why Lower Perspective?

`perspective-[600px]` vs `perspective-[800px]`:
- Lower value = more dramatic 3D effect
- Higher value = more subtle, natural
- Floating Depth uses 600px for the immersive feel

### Shadow Customization

```
hover:shadow-[0_25px_60px_-12px_rgba(0,0,0,0.5)]
                         ↑        ↑
                    blur radius  spread (negative = tighter)
```

---

## Style 3: 液态脉冲 (Liquid Pulse) — Detailed Mechanics

### Layer Breakdown

1. **Animated Gradient Background**
   - `bg-[length:200%_200%]` — oversized background
   - `animate-gradient-shift` — custom keyframe moves background position
   - Goes from transparent to 10% opacity brand colors
   - Creates the "liquid" flowing feel

2. **Pulse Border** (CSS mask technique)
   - Gradient border using `bg-gradient-to-br` on the element itself
   - `mask-composite: exclude` cuts out the center, leaving only the border
   - Fades in on hover with `opacity: 0 → 1`
   - The gradient gives the border a "rainbow" or "neon" quality

3. **Light Sweep** (same as Glass Sweep but slower)
   - Duration: 800ms (vs 700ms) for more fluid feel
   - Delay: 100ms (starts after border appears)

4. **Staggered Content**
   - Badge: delay 150ms, scale + rotate
   - Title: delay 200ms, translate-y
   - Description: delay 250ms, color shift
   - Arrow: delay 300ms, translate + rotate
   - Creates a "ripple" entrance effect

### Required @keyframes

```css
@keyframes gradient-shift {
  0%, 100% { background-position: 0% 50%; }
  50% { background-position: 100% 50%; }
}

/* Tailwind config addition: */
theme: {
  extend: {
    animation: {
      'gradient-shift': 'gradient-shift 3s ease infinite',
    },
  },
}
```

Or use inline style: `animation: gradient-shift 3s ease infinite`

---

## Plain CSS Equivalents

For non-Tailwind projects, here are the equivalent CSS properties:

### Glass Sweep

```css
.card {
  perspective: 800px;
  overflow: hidden;
  position: relative;
  transition: transform 0.3s ease-out, box-shadow 0.3s ease-out;
}

.card:hover {
  transform: scale(1.02) rotateY(3deg) rotateX(2deg);
  box-shadow: 0 0 30px rgba(99, 102, 241, 0.15);
}

.card::after {
  content: '';
  position: absolute;
  inset: 0;
  transform: translateX(-100%) skewX(-30deg);
  background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
  transition: transform 0.7s ease-in-out;
}

.card:hover::after {
  transform: translateX(200%);
}
```

### Floating Depth

```css
.card {
  perspective: 600px;
  overflow: hidden;
  position: relative;
  transition: transform 0.4s ease-out, box-shadow 0.4s ease-out;
}

.card:hover {
  transform: scale(1.04) rotateY(5deg) rotateX(3deg);
  box-shadow: 0 25px 60px -12px rgba(0, 0, 0, 0.5);
}

.card-content {
  transition: transform 0.4s ease-out;
}

.card:hover .card-content {
  transform: translateY(-4px);
}
```

### Liquid Pulse

```css
.card {
  perspective: 800px;
  overflow: hidden;
  position: relative;
  background-size: 200% 200%;
  transition: transform 0.3s ease-out;
}

.card:hover {
  transform: scale(1.02) rotateY(2deg) rotateX(1deg);
}

@keyframes gradient-shift {
  0%, 100% { background-position: 0% 50%; }
  50% { background-position: 100% 50%; }
}

.card:hover .card-bg {
  animation: gradient-shift 3s ease infinite;
}
```

---

## Troubleshooting

### Problem: 3D tilt not working
**Cause**: Missing `perspective` on parent element.
**Fix**: Add `perspective: 800px` to the direct parent of the card, or use `transform-style: preserve-3d` on grandparent.

### Problem: Light sweep shows above content
**Cause**: Z-index stacking issue.
**Fix**: Ensure content div has `position: relative; z-index: 10` and sweep has `pointer-events: none`.

### Problem: Animation janky on mobile
**Cause**: Complex animations on low-end devices.
**Fix**: Add `@media (prefers-reduced-motion: reduce)` to disable or simplify animations:
```css
@media (prefers-reduced-motion: reduce) {
  .card:hover {
    transform: none;
  }
  .card::after {
    display: none;
  }
}
```

### Problem: Gradient border not showing
**Cause**: `mask-composite` not supported in older browsers.
**Fix**: Use a wrapper div approach instead:
```html
<div class="p-[2px] rounded-2xl bg-gradient-to-br from-indigo-500 to-purple-500">
  <div class="rounded-2xl bg-gray-900 p-6">
    <!-- content -->
  </div>
</div>
```

### Problem: Perspective conflict with scroll containers
**Cause**: `perspective` on a scrolling parent creates visual distortion.
**Fix**: Move `perspective` to a non-scrolling wrapper, or use `transform-style: flat` on the scroll container.

---

## Intensity Tuning

All 3 styles can be dialed up or down:

**Softer (for subtle backgrounds)**:
- Reduce scale to 1.01
- Reduce tilt to 1-2deg
- Reduce light sweep opacity to `via-white/10`
- Remove content animations

**Stronger (for hero cards)**:
- Increase scale to 1.05
- Increase tilt to 5-8deg Y, 3-5deg X
- Increase light sweep to `via-white/30`
- Add `backdrop-blur-sm` on hover
- Increase shadow intensity

**Mobile-optimized**:
- Disable 3D tilt (keep scale only)
- Reduce transition durations to 200ms
- Remove light sweep (most impactful on mobile performance)

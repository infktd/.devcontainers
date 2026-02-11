# Next.js + shadcn/ui Template

A modern Next.js template with TypeScript, Tailwind CSS, and shadcn/ui components, powered by Bun.

## 🚀 Quick Start

### Install Dependencies

```bash
bun install
```

### Run Development Server

```bash
bun run dev
```

Open [http://localhost:3000](http://localhost:3000) in your browser.

### Build for Production

```bash
bun run build
bun run start
```

## 📦 What's Included

- **Next.js 14** - React framework with App Router
- **TypeScript** - Type-safe development
- **Tailwind CSS** - Utility-first CSS framework
- **shadcn/ui** - Beautiful, accessible component library
- **Bun** - Fast JavaScript runtime and package manager
- **ESLint** - Code linting
- **PostCSS** - CSS processing

## 🎨 Adding shadcn/ui Components

shadcn/ui components are added on-demand. To add a component:

```bash
bunx shadcn-ui@latest add button
bunx shadcn-ui@latest add card
bunx shadcn-ui@latest add dialog
```

Browse all available components at [ui.shadcn.com](https://ui.shadcn.com).

### Example Usage

After adding a button component:

```tsx
import { Button } from "@/components/ui/button";

export default function MyPage() {
  return (
    <Button variant="default">Click me</Button>
  );
}
```

## 📁 Project Structure

```
nextjs-shadcn/
├── src/
│   ├── app/
│   │   ├── layout.tsx       # Root layout
│   │   ├── page.tsx         # Home page
│   │   └── globals.css      # Global styles & Tailwind
│   ├── components/
│   │   └── ui/              # shadcn/ui components (added as needed)
│   └── lib/
│       └── utils.ts         # Utility functions (cn helper)
├── config/
│   ├── tailwind.config.ts   # Tailwind configuration
│   ├── postcss.config.mjs   # PostCSS configuration
│   └── components.json      # shadcn/ui configuration
├── public/                  # Static assets
├── package.json
├── tsconfig.json
├── next.config.ts
└── .env.example
```

## 🛠️ Development

### Available Scripts

```bash
bun run dev          # Start development server
bun run build        # Build for production
bun run start        # Start production server
bun run lint         # Run ESLint
bun run type-check   # Run TypeScript compiler check
```

### Adding Routes

Create new routes by adding files in `src/app/`:

```
src/app/
├── page.tsx                 # / route
├── about/
│   └── page.tsx             # /about route
└── blog/
    ├── page.tsx             # /blog route
    └── [slug]/
        └── page.tsx         # /blog/[slug] route
```

### Creating Components

Place shared components in `src/components/`:

```tsx
// src/components/Header.tsx
export function Header() {
  return (
    <header className="border-b">
      <nav className="container mx-auto px-4 py-4">
        <h1 className="text-2xl font-bold">My App</h1>
      </nav>
    </header>
  );
}
```

### Using the `cn` Utility

The `cn` utility (from `@/lib/utils`) helps merge Tailwind classes:

```tsx
import { cn } from "@/lib/utils";

function MyComponent({ className }: { className?: string }) {
  return (
    <div className={cn("base-classes", className)}>
      Content
    </div>
  );
}
```

## 🎨 Styling

### Tailwind CSS

Use Tailwind utility classes directly:

```tsx
<div className="flex items-center justify-center min-h-screen bg-background">
  <h1 className="text-4xl font-bold text-foreground">Hello World</h1>
</div>
```

### CSS Variables

shadcn/ui uses CSS variables for theming. Edit `src/app/globals.css`:

```css
:root {
  --background: 0 0% 100%;
  --foreground: 222.2 84% 4.9%;
  --primary: 222.2 47.4% 11.2%;
  /* ... */
}

.dark {
  --background: 222.2 84% 4.9%;
  --foreground: 210 40% 98%;
  --primary: 210 40% 98%;
  /* ... */
}
```

### Dark Mode

Enable dark mode by adding the `dark` class to the `<html>` element:

```tsx
// In layout.tsx
<html lang="en" className="dark">
```

Or implement a theme toggle using shadcn/ui's theme provider.

## 🔌 API Routes

Create API routes in `src/app/api/`:

```tsx
// src/app/api/hello/route.ts
import { NextResponse } from 'next/server';

export async function GET() {
  return NextResponse.json({ message: 'Hello World' });
}
```

## 🌐 Environment Variables

1. Copy `.env.example` to `.env.local`:
   ```bash
   cp .env.example .env.local
   ```

2. Add your variables:
   ```env
   NEXT_PUBLIC_APP_URL=http://localhost:3000
   NEXT_PUBLIC_API_URL=https://api.example.com
   DATABASE_URL=postgresql://...
   ```

3. Access in your code:
   ```tsx
   const apiUrl = process.env.NEXT_PUBLIC_API_URL;
   ```

## 📚 Useful Resources

- [Next.js Documentation](https://nextjs.org/docs)
- [Next.js Learn](https://nextjs.org/learn)
- [shadcn/ui Components](https://ui.shadcn.com)
- [Tailwind CSS](https://tailwindcss.com/docs)
- [Bun Documentation](https://bun.sh/docs)
- [TypeScript Handbook](https://www.typescriptlang.org/docs/)

## 💡 Tips & Best Practices

### Performance

- Use Next.js `<Image>` component for optimized images
- Implement proper code splitting with dynamic imports
- Use Server Components by default, Client Components when needed

### Code Organization

- Keep components small and focused
- Use TypeScript interfaces for props
- Extract reusable logic into custom hooks
- Create a `lib/` folder for utilities

### Styling

- Use Tailwind's design tokens (colors, spacing)
- Prefer composition over custom CSS
- Use shadcn/ui components as building blocks
- Maintain consistent spacing and typography

### TypeScript

- Always define prop types
- Use `type` for objects, `interface` for classes
- Enable strict mode for better type safety
- Leverage type inference when possible

## 🐛 Troubleshooting

### Port Already in Use

```bash
# Kill process on port 3000
lsof -ti:3000 | xargs kill -9
```

### Module Not Found

```bash
# Clear Bun cache and reinstall
rm -rf node_modules bun.lockb
bun install
```

### Type Errors

```bash
# Run type check
bun run type-check
```

### Styling Issues

1. Ensure Tailwind config includes all content paths
2. Check PostCSS configuration
3. Verify `globals.css` imports `@tailwind` directives
4. Clear `.next` folder: `rm -rf .next`

## 🚀 Deployment

### Vercel (Recommended)

1. Push your code to GitHub
2. Import project on [Vercel](https://vercel.com)
3. Deploy automatically on every push

### Docker

```dockerfile
FROM oven/bun:1 as builder
WORKDIR /app
COPY package.json bun.lockb ./
RUN bun install
COPY . .
RUN bun run build

FROM oven/bun:1-slim
WORKDIR /app
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./
EXPOSE 3000
CMD ["bun", "run", "start"]
```

### Other Platforms

- [Netlify](https://docs.netlify.com/frameworks/next-js/)
- [AWS Amplify](https://docs.amplify.aws/guides/hosting/nextjs/)
- [Cloudflare Pages](https://developers.cloudflare.com/pages/framework-guides/nextjs/)

## 📝 Next Steps

1. Customize the home page in `src/app/page.tsx`
2. Add shadcn/ui components you need
3. Create your page routes in `src/app/`
4. Build your UI with Tailwind CSS
5. Add API routes if needed
6. Configure environment variables
7. Deploy to production

Happy coding! 🎉
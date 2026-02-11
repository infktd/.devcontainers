export default function Home() {
  return (
    <main className="flex min-h-screen flex-col items-center justify-center p-24">
      <div className="z-10 max-w-5xl w-full items-center justify-center font-mono text-sm">
        <div className="flex flex-col items-center justify-center gap-8">
          <h1 className="text-4xl font-bold text-center">
            Welcome to Next.js + shadcn/ui
          </h1>

          <p className="text-muted-foreground text-center max-w-2xl">
            This is a Next.js template with TypeScript, Tailwind CSS, and shadcn/ui components.
            Start building your application by editing{' '}
            <code className="bg-muted px-2 py-1 rounded">src/app/page.tsx</code>
          </p>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-4 w-full max-w-2xl mt-8">
            <div className="border rounded-lg p-6 hover:border-primary transition-colors">
              <h2 className="text-xl font-semibold mb-2">📚 Documentation</h2>
              <p className="text-sm text-muted-foreground">
                Learn about Next.js features and API routes.
              </p>
              <a
                href="https://nextjs.org/docs"
                target="_blank"
                rel="noopener noreferrer"
                className="text-sm text-primary hover:underline mt-2 inline-block"
              >
                Read the docs →
              </a>
            </div>

            <div className="border rounded-lg p-6 hover:border-primary transition-colors">
              <h2 className="text-xl font-semibold mb-2">🎨 shadcn/ui</h2>
              <p className="text-sm text-muted-foreground">
                Add beautiful components to your application.
              </p>
              <a
                href="https://ui.shadcn.com"
                target="_blank"
                rel="noopener noreferrer"
                className="text-sm text-primary hover:underline mt-2 inline-block"
              >
                Browse components →
              </a>
            </div>

            <div className="border rounded-lg p-6 hover:border-primary transition-colors">
              <h2 className="text-xl font-semibold mb-2">⚡ Bun</h2>
              <p className="text-sm text-muted-foreground">
                Fast JavaScript runtime and package manager.
              </p>
              <a
                href="https://bun.sh"
                target="_blank"
                rel="noopener noreferrer"
                className="text-sm text-primary hover:underline mt-2 inline-block"
              >
                Learn more →
              </a>
            </div>

            <div className="border rounded-lg p-6 hover:border-primary transition-colors">
              <h2 className="text-xl font-semibold mb-2">🎯 TypeScript</h2>
              <p className="text-sm text-muted-foreground">
                Type-safe development with full TypeScript support.
              </p>
              <a
                href="https://www.typescriptlang.org"
                target="_blank"
                rel="noopener noreferrer"
                className="text-sm text-primary hover:underline mt-2 inline-block"
              >
                Documentation →
              </a>
            </div>
          </div>

          <div className="mt-8 text-center">
            <p className="text-sm text-muted-foreground">
              Get started by adding shadcn/ui components:
            </p>
            <code className="block mt-2 bg-muted px-4 py-2 rounded text-sm">
              bunx shadcn-ui@latest add button
            </code>
          </div>
        </div>
      </div>
    </main>
  );
}

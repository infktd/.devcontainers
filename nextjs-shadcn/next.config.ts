import type { NextConfig } from 'next';

const nextConfig: NextConfig = {
  reactStrictMode: true,
  swcMinify: true,
  eslint: {
    ignoreDuringBuilds: false,
  },
  typescript: {
    ignoreBuildErrors: false,
  },
  images: {
    remotePatterns: [],
  },
};

export default nextConfig;

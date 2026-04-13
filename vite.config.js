import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// https://vite.dev/config/
export default defineConfig({
  plugins: [vue()],
  publicDir: 'static',
  server: {
    watch: {
      usePolling: true,
    },
  },
  build: {
    outDir: 'public',
    emptyOutDir: false,
  },
})

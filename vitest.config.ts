import { defineConfig } from 'vitest/config'

export default defineConfig({
  test: {
    setupFiles: ['./resources/js/tests/test-setup.ts'],
    globals: true,
  },
})

import { defineConfig } from '@playwright/test';

export default defineConfig({
    reporter: [['html', { outputFolder: null }]],
    use: {
        trace: 'off',
    },
});
<template>
  <header class="app-header">
    <div class="header-inner">
      <router-link to="/" class="logo">
        <svg class="logo-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" fill="none" width="28" height="28">
          <rect width="48" height="48" rx="10" fill="#0f0f0f"/>
          <polyline points="14,14 6,24 14,34" stroke="#863bff" stroke-width="3.5" stroke-linecap="round" stroke-linejoin="round" fill="none"/>
          <polyline points="34,14 42,24 34,34" stroke="#863bff" stroke-width="3.5" stroke-linecap="round" stroke-linejoin="round" fill="none"/>
          <line x1="28" y1="13" x2="20" y2="35" stroke="#ffffff" stroke-width="3" stroke-linecap="round"/>
        </svg>
        <span class="logo-text">Santino</span>
      </router-link>

      <nav class="header-nav">
        <router-link to="/" class="nav-link">About</router-link>
        <router-link to="/portfolio" class="nav-link">Portfolio</router-link>
        <a :href="profile.github" target="_blank" rel="noopener" class="btn-github">
          <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor">
            <path d="M12 2C6.477 2 2 6.477 2 12c0 4.42 2.865 8.167 6.839 9.49.5.09.682-.217.682-.482 0-.237-.009-.866-.013-1.7-2.782.603-3.369-1.342-3.369-1.342-.454-1.155-1.11-1.462-1.11-1.462-.908-.62.069-.608.069-.608 1.003.07 1.531 1.03 1.531 1.03.892 1.529 2.341 1.087 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.11-4.555-4.943 0-1.091.39-1.984 1.03-2.682-.103-.254-.447-1.27.097-2.646 0 0 .84-.269 2.75 1.025A9.578 9.578 0 0 1 12 6.836a9.59 9.59 0 0 1 2.504.337c1.909-1.294 2.747-1.025 2.747-1.025.546 1.376.202 2.394.1 2.646.64.698 1.026 1.591 1.026 2.682 0 3.841-2.337 4.687-4.565 4.935.359.309.678.919.678 1.852 0 1.336-.012 2.415-.012 2.741 0 .267.18.578.688.48C19.138 20.163 22 16.418 22 12c0-5.523-4.477-10-10-10z"/>
          </svg>
          GitHub
        </a>
      </nav>
    </div>
  </header>
</template>

<script setup>
import { profile } from '../data/stack.js'
</script>

<style lang="scss" scoped>
@use '../assets/styles/main.scss' as *;

.app-header {
  position: sticky;
  top: 0;
  z-index: 100;
  background: rgba($color-bg, 0.92);
  border-bottom: 1px solid $color-border;
  backdrop-filter: blur(12px);
  -webkit-backdrop-filter: blur(12px);
}

.header-inner {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 24px;
  height: 60px;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.logo {
  display: flex;
  align-items: center;
  gap: 8px;
  text-decoration: none;

  .logo-icon {
    display: block;
    flex-shrink: 0;
  }

  .logo-text {
    font-size: 1.15rem;
    font-weight: 700;
    background: linear-gradient(135deg, $color-accent, $color-accent-hover);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
  }
}

.header-nav {
  display: flex;
  align-items: center;
  gap: 4px;
}

.nav-link {
  padding: 6px 12px;
  border-radius: 8px;
  color: $color-text-secondary;
  font-size: 0.875rem;
  font-weight: 500;
  transition: color 0.2s, background 0.2s;
  text-decoration: none;

  &:hover {
    color: $color-text-primary;
    background: $color-surface;
  }

  &.router-link-active {
    color: $color-accent;
    background: $color-accent-glow;
  }
}

.btn-github {
  display: flex;
  align-items: center;
  gap: 6px;
  margin-left: 16px;
  padding: 7px 14px;
  border: 1px solid $color-border;
  border-radius: 8px;
  color: $color-text-primary;
  font-size: 0.8125rem;
  font-weight: 500;
  background: $color-surface;
  text-decoration: none;
  transition: border-color 0.2s, background 0.2s;

  &:hover {
    border-color: $color-accent;
    background: $color-accent-glow;
    color: $color-text-primary;
  }
}

@media (max-width: 600px) {
  .nav-link {
    padding: 6px 8px;
    font-size: 0.8125rem;
  }

  .btn-github span {
    display: none;
  }
}
</style>

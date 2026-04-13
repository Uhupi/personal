<template>
  <div id="app">
    <AppHeader />

    <ProfileHero />

    <main class="main-layout" id="stack">
      <CategoryNav />

      <div class="stack-content">
        <div
          v-for="cat in categories"
          :key="cat.id"
          :id="'cat-' + cat.id"
        >
          <CategorySection :category="cat" />
        </div>
      </div>
    </main>

    <footer class="app-footer">
      <p>
        Built with
        <a href="https://vuejs.org" target="_blank" rel="noopener">Vue 3</a> +
        <a href="https://vitejs.dev" target="_blank" rel="noopener">Vite</a> +
        <a href="https://sass-lang.com" target="_blank" rel="noopener">SCSS</a>
        · Inspired by
        <a href="https://stackshare.io" target="_blank" rel="noopener">StackShare</a>
      </p>
    </footer>
  </div>
</template>

<script setup>
import AppHeader from './components/AppHeader.vue'
import ProfileHero from './components/ProfileHero.vue'
import CategoryNav from './components/CategoryNav.vue'
import CategorySection from './components/CategorySection.vue'
import { categories } from './data/stack.js'
</script>

<style lang="scss">
@use './assets/styles/main.scss' as *;

@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap');

#app {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
}

.main-layout {
  max-width: 1200px;
  margin: 0 auto;
  padding: 40px 24px;
  display: flex;
  gap: 40px;
  align-items: flex-start;
  flex: 1;
  width: 100%;
}

.stack-content {
  flex: 1;
  min-width: 0;
}

.app-footer {
  border-top: 1px solid $color-border;
  padding: 24px;
  text-align: center;

  p {
    font-size: 0.8125rem;
    color: $color-text-muted;

    a {
      color: $color-text-secondary;
      transition: color 0.2s;

      &:hover {
        color: $color-accent;
      }
    }
  }
}

@media (max-width: 768px) {
  .main-layout {
    flex-direction: column;
    padding: 24px 16px;
  }

  .category-nav {
    display: none;
  }
}
</style>

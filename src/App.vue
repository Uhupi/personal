<template>
  <div id="app">
    <AppHeader />
    <router-view />
    <footer class="app-footer">
      <p>Santino Lange — 2026 · <a href="https://webmail.uhupi.com" target="_blank" rel="noopener noreferrer">Webmail</a> · <router-link to="/impressum">Impressum</router-link></p>
    </footer>
  </div>
</template>

<script setup>
import AppHeader from './components/AppHeader.vue'
</script>

<style lang="scss">
@use './assets/styles/main.scss' as *;

@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap');

#app {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
}

.app-footer {
  border-top: 1px solid $color-border;
  padding: 24px;
  text-align: center;

  p {
    font-size: 0.8125rem;
    color: $color-text-muted;

    a {
      color: $color-text-muted;
      transition: color 0.2s;

      &:hover {
        color: $color-accent;
      }
    }
  }
}
</style>

<template>
  <div>
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
  </div>
</template>

<script setup>
import ProfileHero from '../components/ProfileHero.vue'
import CategoryNav from '../components/CategoryNav.vue'
import CategorySection from '../components/CategorySection.vue'
import { categories } from '../data/stack.js'
</script>

<style lang="scss" scoped>
@use '../assets/styles/main.scss' as *;

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

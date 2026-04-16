<template>
  <div class="portfolio-page">
    <div class="page-inner">
      <div class="page-header">
        <h1 class="page-title">Portfolio</h1>
        <p class="page-subtitle">A selection of projects I've designed and built.</p>
      </div>
      <div class="portfolio-grid">
        <PortfolioCard
          v-for="project in projects"
          :key="project.id"
          :project="project"
        />
      </div>
    </div>
  </div>
</template>

<script setup>
import PortfolioCard from '../components/PortfolioCard.vue'
import projects from '../data/portfolio.json'
</script>

<style lang="scss" scoped>
@use '../assets/styles/main.scss' as *;

.portfolio-page {
  flex: 1;
}

.page-inner {
  max-width: 1200px;
  margin: 0 auto;
  padding: 48px 24px;
}

.page-header {
  margin-bottom: 32px;
}

.page-title {
  font-size: 1.75rem;
  font-weight: 700;
  color: $color-text-primary;
  letter-spacing: -0.02em;
  margin-bottom: 8px;
}

.page-subtitle {
  font-size: 0.9375rem;
  color: $color-text-secondary;
}

.portfolio-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
  gap: 20px;
}

@media (max-width: 768px) {
  .page-inner {
    padding: 28px 16px;
  }

  .portfolio-grid {
    grid-template-columns: 1fr;
  }
}
</style>

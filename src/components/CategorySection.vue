<template>
  <section class="category-section">
    <div class="category-header">
      <span class="category-icon">{{ category.icon }}</span>
      <h2 class="category-title">{{ category.label }}</h2>
      <span class="category-count">{{ category.tools.length }}</span>
    </div>
    <div class="tools-grid">
      <ToolCard
        v-for="tool in category.tools"
        :key="tool.id"
        :tool="tool"
      />
    </div>
  </section>
</template>

<script setup>
import ToolCard from './ToolCard.vue'

defineProps({
  category: { type: Object, required: true },
})
</script>

<style lang="scss" scoped>
@use '../assets/styles/main.scss' as *;

.category-section {
  margin-bottom: 40px;
}

.category-header {
  display: flex;
  align-items: center;
  gap: 10px;
  margin-bottom: 16px;
  padding-bottom: 12px;
  border-bottom: 1px solid $color-border-subtle;
}

.category-icon {
  font-size: 1rem;
  line-height: 1;
}

.category-title {
  font-size: 0.9375rem;
  font-weight: 600;
  color: $color-text-primary;
  letter-spacing: -0.01em;
}

.category-count {
  margin-left: auto;
  font-size: 0.75rem;
  color: $color-text-muted;
  background: $color-tag-bg;
  padding: 2px 8px;
  border-radius: 100px;
  font-weight: 600;
}

.tools-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(340px, 1fr));
  gap: 10px;
}
</style>

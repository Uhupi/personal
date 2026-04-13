<template>
  <aside class="category-nav">
    <div class="nav-sticky">
      <p class="nav-label">Jump to</p>
      <ul class="nav-list">
        <li v-for="cat in categories" :key="cat.id">
          <a
            :href="'#cat-' + cat.id"
            class="nav-item"
            :class="{ active: activeId === cat.id }"
            @click.prevent="scrollTo(cat.id)"
          >
            <span class="nav-icon">{{ cat.icon }}</span>
            <span class="nav-text">{{ cat.label }}</span>
            <span class="nav-count">{{ cat.tools.length }}</span>
          </a>
        </li>
      </ul>
    </div>
  </aside>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'
import { categories } from '../data/stack.js'

const activeId = ref(categories[0]?.id)

function scrollTo(id) {
  const el = document.getElementById('cat-' + id)
  if (el) {
    const top = el.getBoundingClientRect().top + window.scrollY - 80
    window.scrollTo({ top, behavior: 'smooth' })
  }
}

function onScroll() {
  for (const cat of [...categories].reverse()) {
    const el = document.getElementById('cat-' + cat.id)
    if (el && el.getBoundingClientRect().top <= 120) {
      activeId.value = cat.id
      return
    }
  }
  activeId.value = categories[0]?.id
}

onMounted(() => window.addEventListener('scroll', onScroll, { passive: true }))
onUnmounted(() => window.removeEventListener('scroll', onScroll))
</script>

<style lang="scss" scoped>
@use '../assets/styles/main.scss' as *;

.category-nav {
  width: 200px;
  flex-shrink: 0;
}

.nav-sticky {
  position: sticky;
  top: 80px;
}

.nav-label {
  font-size: 0.6875rem;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.08em;
  color: $color-text-muted;
  margin-bottom: 10px;
  padding: 0 10px;
}

.nav-list {
  list-style: none;
  display: flex;
  flex-direction: column;
  gap: 2px;
}

.nav-item {
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 8px 10px;
  border-radius: 8px;
  color: $color-text-secondary;
  font-size: 0.8125rem;
  font-weight: 500;
  transition: background 0.15s, color 0.15s;

  &:hover {
    background: $color-surface;
    color: $color-text-primary;
  }

  &.active {
    background: $color-accent-glow;
    color: $color-accent-hover;

    .nav-count {
      background: rgba($color-accent, 0.2);
      color: $color-accent-hover;
    }
  }
}

.nav-icon {
  font-size: 0.875rem;
  line-height: 1;
  flex-shrink: 0;
}

.nav-text {
  flex: 1;
  min-width: 0;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.nav-count {
  flex-shrink: 0;
  font-size: 0.6875rem;
  font-weight: 600;
  background: $color-tag-bg;
  color: $color-text-muted;
  padding: 1px 6px;
  border-radius: 100px;
  transition: background 0.15s, color 0.15s;
}
</style>

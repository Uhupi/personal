<template>
  <article class="portfolio-card">
    <div class="card-preview" :style="{ '--project-color': project.color }">
      <div class="preview-inner">
        <span class="preview-initials">{{ initials }}</span>
      </div>
      <span class="card-type">{{ project.type }}</span>
    </div>

    <div class="card-body">
      <div class="card-header">
        <h3 class="project-name">{{ project.name }}</h3>
        <span class="project-year">{{ project.year }}</span>
      </div>

      <a :href="project.url" target="_blank" rel="noopener" class="project-domain">
        <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <circle cx="12" cy="12" r="10"/>
          <line x1="2" y1="12" x2="22" y2="12"/>
          <path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"/>
        </svg>
        {{ project.domain }}
      </a>

      <p class="project-description">{{ project.description }}</p>

      <div class="card-footer">
        <div class="project-tags">
          <span v-for="tag in project.tags" :key="tag" class="tag">{{ tag }}</span>
        </div>
        <a :href="project.url" target="_blank" rel="noopener" class="visit-btn" :style="{ '--project-color': project.color }">
          Visit
          <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
            <line x1="7" y1="17" x2="17" y2="7"/>
            <polyline points="7 7 17 7 17 17"/>
          </svg>
        </a>
      </div>
    </div>
  </article>
</template>

<script setup>
import { computed } from 'vue'

const props = defineProps({
  project: { type: Object, required: true },
})

const initials = computed(() =>
  props.project.name
    .split(' ')
    .map(w => w[0])
    .join('')
    .toUpperCase()
    .slice(0, 2)
)
</script>

<style lang="scss" scoped>
@use '../assets/styles/main.scss' as *;

.portfolio-card {
  background: $color-surface;
  border: 1px solid $color-border;
  border-radius: 12px;
  overflow: hidden;
  display: flex;
  flex-direction: column;
  transition: border-color 0.2s, box-shadow 0.2s, transform 0.2s;

  &:hover {
    border-color: rgba(var(--project-color, #{$color-accent}), 0.35);
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.08);
    transform: translateY(-2px);
  }
}

.card-preview {
  position: relative;
  height: 110px;
  background: linear-gradient(
    135deg,
    color-mix(in srgb, var(--project-color) 18%, #{$color-surface-raised}),
    color-mix(in srgb, var(--project-color) 8%, #{$color-bg})
  );
  border-bottom: 1px solid $color-border-subtle;
  display: flex;
  align-items: center;
  justify-content: center;
  overflow: hidden;

  &::before {
    content: '';
    position: absolute;
    inset: 0;
    background: radial-gradient(
      ellipse at 30% 50%,
      color-mix(in srgb, var(--project-color) 22%, transparent),
      transparent 70%
    );
  }
}

.preview-inner {
  position: relative;
  width: 56px;
  height: 56px;
  border-radius: 14px;
  background: var(--project-color);
  display: flex;
  align-items: center;
  justify-content: center;
  box-shadow: 0 4px 16px color-mix(in srgb, var(--project-color) 40%, transparent);
}

.preview-initials {
  font-size: 1.375rem;
  font-weight: 800;
  color: white;
  letter-spacing: -0.5px;
}

.card-type {
  position: absolute;
  top: 10px;
  right: 12px;
  font-size: 0.6875rem;
  font-weight: 600;
  color: $color-text-muted;
  background: rgba($color-surface, 0.85);
  backdrop-filter: blur(4px);
  padding: 3px 8px;
  border-radius: 100px;
  border: 1px solid $color-border-subtle;
  letter-spacing: 0.02em;
}

.card-body {
  padding: 18px 20px 20px;
  display: flex;
  flex-direction: column;
  gap: 8px;
  flex: 1;
}

.card-header {
  display: flex;
  align-items: baseline;
  justify-content: space-between;
  gap: 8px;
}

.project-name {
  font-size: 1rem;
  font-weight: 700;
  color: $color-text-primary;
  line-height: 1.2;
}

.project-year {
  font-size: 0.75rem;
  color: $color-text-muted;
  font-weight: 500;
  flex-shrink: 0;
}

.project-domain {
  display: inline-flex;
  align-items: center;
  gap: 5px;
  font-size: 0.8125rem;
  color: $color-text-muted;
  transition: color 0.2s;
  width: fit-content;

  svg { opacity: 0.6; }

  &:hover {
    color: $color-accent;
    svg { opacity: 1; }
  }
}

.project-description {
  font-size: 0.8125rem;
  color: $color-text-secondary;
  line-height: 1.7;
  flex: 1;
}

.card-footer {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 12px;
  margin-top: 4px;
}

.project-tags {
  display: flex;
  gap: 5px;
  flex-wrap: wrap;
  flex: 1;
  min-width: 0;
}

.tag {
  font-size: 0.6875rem;
  padding: 2px 7px;
  border-radius: 100px;
  background: $color-tag-bg;
  color: $color-tag-text;
  font-weight: 500;
  white-space: nowrap;
}

.visit-btn {
  display: inline-flex;
  align-items: center;
  gap: 5px;
  flex-shrink: 0;
  font-size: 0.8125rem;
  font-weight: 600;
  color: white;
  background: var(--project-color);
  padding: 6px 14px;
  border-radius: 8px;
  transition: opacity 0.2s, transform 0.15s;

  &:hover {
    opacity: 0.88;
    color: white;
    transform: translateY(-1px);
  }
}
</style>

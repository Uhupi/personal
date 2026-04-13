<template>
  <article class="tool-card" @click="isOpen = true">
    <div class="card-logo-wrap" :style="{ background: logoBg }">
      <img
        v-if="tool.logo && !imgFailed"
        :src="tool.logo"
        :alt="tool.name"
        class="tool-logo"
        loading="lazy"
        @error="onImgError"
      />
      <span v-else class="tool-initials" :style="{ color: tool.color }">
        {{ tool.initials || tool.name[0] }}
      </span>
    </div>

    <div class="card-body">
      <div class="card-header">
        <h3 class="tool-name">{{ tool.name }}</h3>
        <div class="tool-tags">
          <span v-for="tag in tool.tags" :key="tag" class="tag">{{ tag }}</span>
        </div>
      </div>
      <p class="tool-description">{{ tool.description }}</p>
    </div>

    <div class="level-badge" :aria-label="`Proficiency: ${tool.level} out of 5`">
      <svg width="12" height="12" viewBox="0 0 24 24" fill="currentColor">
        <path d="M12 2L15.09 8.26L22 9.27L17 14.14L18.18 21.02L12 17.77L5.82 21.02L7 14.14L2 9.27L8.91 8.26L12 2Z"/>
      </svg>
      <span>{{ tool.level }}</span>
    </div>
  </article>

  <Teleport to="body">
    <div v-if="isOpen" class="modal-overlay" @click.self="isOpen = false">
      <div class="modal">
        <button class="modal-close" @click="isOpen = false" aria-label="Close">✕</button>

        <div class="modal-logo-wrap" :style="{ background: logoBg }">
          <img
            v-if="tool.logo && !imgFailed"
            :src="tool.logo"
            :alt="tool.name"
            class="modal-logo"
          />
          <span v-else class="modal-initials" :style="{ color: tool.color }">
            {{ tool.initials || tool.name[0] }}
          </span>
        </div>

        <div class="modal-header">
          <h2 class="modal-name">{{ tool.name }}</h2>
          <div class="modal-meta">
            <div class="modal-badge" :aria-label="`Proficiency: ${tool.level} out of 5`">
              <svg width="13" height="13" viewBox="0 0 24 24" fill="currentColor">
                <path d="M12 2L15.09 8.26L22 9.27L17 14.14L18.18 21.02L12 17.77L5.82 21.02L7 14.14L2 9.27L8.91 8.26L12 2Z"/>
              </svg>
              <span>{{ tool.level }} / 5</span>
            </div>
            <div class="modal-tags">
              <span v-for="tag in tool.tags" :key="tag" class="tag">{{ tag }}</span>
            </div>
          </div>
        </div>

        <p class="modal-description">{{ tool.description }}</p>
      </div>
    </div>
  </Teleport>
</template>

<script setup>
import { ref, computed } from 'vue'

const props = defineProps({
  tool: { type: Object, required: true },
})

const imgFailed = ref(false)
const isOpen = ref(false)

const logoBg = computed(() => {
  if (imgFailed.value || !props.tool.logo) return 'transparent'
  return props.tool.logoBg || 'transparent'
})

function onImgError() {
  imgFailed.value = true
}
</script>

<style lang="scss" scoped>
@use '../assets/styles/main.scss' as *;

.tool-card {
  display: flex;
  align-items: flex-start;
  gap: 14px;
  padding: 16px;
  height: 100%;
  background: $color-surface;
  border: 1px solid $color-border;
  border-radius: 10px;
  cursor: pointer;
  transition: border-color 0.2s, box-shadow 0.2s, background 0.2s;

  &:hover {
    border-color: rgba($color-accent, 0.35);
    background: $color-surface-raised;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
  }
}

.card-logo-wrap {
  flex-shrink: 0;
  width: 44px;
  height: 44px;
  border-radius: 8px;
  display: flex;
  align-items: center;
  justify-content: center;
  border: 1px solid $color-border-subtle;
  overflow: hidden;
}

.tool-logo {
  width: 30px;
  height: 30px;
  object-fit: contain;
}

.tool-initials {
  font-size: 1rem;
  font-weight: 800;
  letter-spacing: -0.5px;
}

.card-body {
  flex: 1;
  min-width: 0;
  display: flex;
  flex-direction: column;
}

.card-header {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  gap: 6px;
  margin-bottom: 6px;
}

.tool-name {
  font-size: 0.9375rem;
  font-weight: 600;
  color: $color-text-primary;
  line-height: 1.3;
}

.tool-tags {
  display: flex;
  gap: 5px;
  flex-wrap: wrap;
}

.tag {
  font-size: 0.6875rem;
  padding: 2px 7px;
  border-radius: 100px;
  background: $color-tag-bg;
  color: $color-tag-text;
  font-weight: 500;
  letter-spacing: 0.01em;
}

.tool-description {
  font-size: 0.8125rem;
  color: $color-text-secondary;
  line-height: 1.6;
  display: -webkit-box;
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

.level-badge {
  flex-shrink: 0;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 3px;
  padding: 8px 10px;
  border: 1px solid $color-border;
  border-radius: 8px;
  background: $color-surface-raised;
  color: $color-vote;
  font-size: 0.75rem;
  font-weight: 600;
  min-width: 46px;
  align-self: center;
}

// ── Modal ──────────────────────────────────────────────
.modal-overlay {
  position: fixed;
  inset: 0;
  background: rgba(0, 0, 0, 0.4);
  backdrop-filter: blur(4px);
  -webkit-backdrop-filter: blur(4px);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 1000;
  padding: 24px;
}

.modal {
  position: relative;
  background: $color-surface;
  border: 1px solid $color-border;
  border-radius: 16px;
  padding: 32px;
  max-width: 480px;
  width: 100%;
  box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.modal-close {
  position: absolute;
  top: 16px;
  right: 16px;
  width: 32px;
  height: 32px;
  border-radius: 8px;
  border: 1px solid $color-border;
  background: $color-surface-raised;
  color: $color-text-muted;
  font-size: 0.8rem;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: background 0.15s, color 0.15s;

  &:hover {
    background: $color-border;
    color: $color-text-primary;
  }
}

.modal-logo-wrap {
  width: 64px;
  height: 64px;
  border-radius: 12px;
  border: 1px solid $color-border-subtle;
  display: flex;
  align-items: center;
  justify-content: center;
  overflow: hidden;
}

.modal-logo {
  width: 44px;
  height: 44px;
  object-fit: contain;
}

.modal-initials {
  font-size: 1.5rem;
  font-weight: 800;
  letter-spacing: -0.5px;
}

.modal-header {
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.modal-name {
  font-size: 1.25rem;
  font-weight: 700;
  color: $color-text-primary;
  line-height: 1.2;
}

.modal-meta {
  display: flex;
  align-items: center;
  gap: 12px;
  flex-wrap: wrap;
}

.modal-badge {
  display: flex;
  align-items: center;
  gap: 5px;
  padding: 4px 10px;
  border: 1px solid $color-border;
  border-radius: 8px;
  background: $color-surface-raised;
  color: $color-vote;
  font-size: 0.8rem;
  font-weight: 600;
}

.modal-tags {
  display: flex;
  gap: 5px;
  flex-wrap: wrap;
}

.modal-description {
  font-size: 0.9rem;
  color: $color-text-secondary;
  line-height: 1.7;
}
</style>

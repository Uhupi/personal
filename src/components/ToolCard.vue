<template>
  <article class="tool-card" :class="{ voted: hasVoted }">
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

    <button
      class="vote-btn"
      :class="{ voted: hasVoted }"
      @click="toggleVote"
      :aria-label="hasVoted ? 'Remove vote' : 'Vote for ' + tool.name"
    >
      <svg width="12" height="12" viewBox="0 0 24 24" fill="currentColor">
        <path d="M12 2L15.09 8.26L22 9.27L17 14.14L18.18 21.02L12 17.77L5.82 21.02L7 14.14L2 9.27L8.91 8.26L12 2Z"/>
      </svg>
      <span>{{ displayVotes }}</span>
    </button>
  </article>
</template>

<script setup>
import { ref, computed } from 'vue'

const props = defineProps({
  tool: { type: Object, required: true },
})

const hasVoted = ref(false)
const extraVote = ref(0)
const imgFailed = ref(false)

const displayVotes = computed(() => props.tool.votes + extraVote.value)

const logoBg = computed(() => {
  if (imgFailed.value || !props.tool.logo) return 'transparent'
  return props.tool.logoBg || 'transparent'
})

function toggleVote() {
  hasVoted.value = !hasVoted.value
  extraVote.value = hasVoted.value ? 1 : 0
}

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
  background: $color-surface;
  border: 1px solid $color-border;
  border-radius: 10px;
  transition: border-color 0.2s, box-shadow 0.2s, background 0.2s;

  &:hover {
    border-color: rgba($color-accent, 0.35);
    background: $color-surface-raised;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
  }

  &.voted {
    border-color: rgba($color-vote, 0.3);
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
}

.card-header {
  display: flex;
  align-items: center;
  gap: 10px;
  flex-wrap: wrap;
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
}

.vote-btn {
  flex-shrink: 0;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 3px;
  padding: 8px 10px;
  border: 1px solid $color-border;
  border-radius: 8px;
  background: $color-surface-raised;
  color: $color-text-muted;
  cursor: pointer;
  transition: all 0.18s;
  font-size: 0.75rem;
  font-weight: 600;
  min-width: 46px;
  align-self: center;
  font-family: inherit;

  &:hover {
    border-color: $color-vote;
    color: $color-vote;
    background: rgba($color-vote, 0.08);
  }

  &.voted {
    border-color: $color-vote;
    color: $color-vote;
    background: rgba($color-vote, 0.1);
  }
}
</style>

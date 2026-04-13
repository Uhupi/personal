<template>
  <section class="profile-hero" id="about">
    <div class="hero-inner">
      <div class="avatar">
        <img :src="avatarImg" :alt="profile.name" class="avatar-photo" />
        <span class="avatar-badge">✓</span>
      </div>

      <div class="profile-info">
        <div class="profile-name-row">
          <h1 class="profile-name">{{ profile.name }}</h1>
          <span class="profile-handle">@{{ profile.username }}</span>
        </div>
        <p class="profile-title">{{ profile.title }}</p>
        <p class="profile-bio">{{ profile.bio }}</p>

        <div class="profile-meta">
          <span class="meta-item">
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"/>
              <circle cx="12" cy="10" r="3"/>
            </svg>
            {{ profile.location }}
          </span>
          <a :href="profile.website" target="_blank" rel="noopener" class="meta-item meta-link">
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <circle cx="12" cy="12" r="10"/>
              <line x1="2" y1="12" x2="22" y2="12"/>
              <path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"/>
            </svg>
            intercambiando.de
          </a>
        </div>
      </div>

      <div class="stack-stats">
        <div class="stat">
          <span class="stat-value">{{ totalTools }}</span>
          <span class="stat-label">Tools</span>
        </div>
        <div class="stat-divider"></div>
        <div class="stat">
          <span class="stat-value">23</span>
          <span class="stat-label">Yrs Exp</span>
        </div>
        <div class="stat-divider"></div>
        <div class="stat">
          <span class="stat-value">{{ categories.length }}</span>
          <span class="stat-label">Categories</span>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { computed } from 'vue'
import { profile, categories } from '../data/stack.js'
const avatarImg = '/assets/avatar.png'

const totalTools = computed(() =>
  categories.reduce((sum, cat) => sum + cat.tools.length, 0)
)
</script>

<style lang="scss" scoped>
@use '../assets/styles/main.scss' as *;

.profile-hero {
  border-bottom: 1px solid $color-border;
  background: linear-gradient(180deg, rgba($color-accent, 0.04) 0%, transparent 100%);
  padding: 40px 0 36px;
}

.hero-inner {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 24px;
  display: flex;
  align-items: flex-start;
  gap: 28px;
}

.avatar {
  position: relative;
  flex-shrink: 0;
  width: 88px;
  height: 88px;
  border-radius: 50%;
  background: linear-gradient(135deg, $color-accent, #8b5cf6);
  display: flex;
  align-items: center;
  justify-content: center;

  .avatar-photo {
    width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: 50%;
  }

  .avatar-badge {
    position: absolute;
    bottom: 2px;
    right: 2px;
    width: 22px;
    height: 22px;
    border-radius: 50%;
    background: #22c55e;
    border: 2px solid $color-bg;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 0.6rem;
    color: white;
    font-weight: 700;
  }
}

.profile-info {
  flex: 1;
  min-width: 0;
}

.profile-name-row {
  display: flex;
  align-items: baseline;
  gap: 12px;
  flex-wrap: wrap;
  margin-bottom: 4px;
}

.profile-name {
  font-size: 1.6rem;
  font-weight: 700;
  color: $color-text-primary;
  line-height: 1.2;
}

.profile-handle {
  font-size: 0.9rem;
  color: $color-text-muted;
  font-weight: 500;
}

.profile-title {
  font-size: 0.95rem;
  color: $color-accent;
  font-weight: 600;
  margin-bottom: 10px;
}

.profile-bio {
  font-size: 0.875rem;
  color: $color-text-secondary;
  line-height: 1.7;
  max-width: 560px;
  margin-bottom: 14px;
}

.profile-meta {
  display: flex;
  gap: 20px;
  flex-wrap: wrap;
}

.meta-item {
  display: flex;
  align-items: center;
  gap: 5px;
  font-size: 0.8125rem;
  color: $color-text-muted;

  svg { opacity: 0.7; }
}

.meta-link {
  color: $color-text-secondary;
  transition: color 0.2s;

  &:hover {
    color: $color-accent;
  }
}

.stack-stats {
  flex-shrink: 0;
  display: flex;
  align-items: center;
  background: $color-surface;
  border: 1px solid $color-border;
  border-radius: 12px;
  padding: 20px 24px;
  gap: 20px;
  align-self: center;
  margin-top: 4px;
}

.stat {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 3px;

  .stat-value {
    font-size: 1.5rem;
    font-weight: 700;
    color: $color-text-primary;
    line-height: 1;
  }

  .stat-label {
    font-size: 0.75rem;
    color: $color-text-muted;
    text-transform: uppercase;
    letter-spacing: 0.05em;
    font-weight: 500;
  }
}

.stat-divider {
  width: 1px;
  height: 32px;
  background: $color-border;
}

@media (max-width: 768px) {
  .profile-hero {
    padding: 28px 0 24px;
  }

  .hero-inner {
    flex-direction: column;
    align-items: center;
    text-align: center;
    gap: 16px;
    padding: 0 16px;
  }

  .avatar {
    width: 96px;
    height: 96px;
  }

  .profile-name-row {
    justify-content: center;
  }

  .profile-bio {
    max-width: 100%;
  }

  .profile-meta {
    justify-content: center;
  }

  .stack-stats {
    width: 100%;
    justify-content: center;
    padding: 16px;
    gap: 0;
  }

  .stat {
    flex: 1;
  }

  .stat-divider {
    height: 28px;
  }
}
</style>

import { createRouter, createWebHistory } from 'vue-router'
import AboutView from '../views/AboutView.vue'
import PortfolioView from '../views/PortfolioView.vue'
import ImpressumView from '../views/ImpressumView.vue'

const routes = [
  { path: '/', name: 'about', component: AboutView },
  { path: '/portfolio', name: 'portfolio', component: PortfolioView },
  { path: '/impressum', name: 'impressum', component: ImpressumView },
]

export default createRouter({
  history: createWebHistory(),
  routes,
  scrollBehavior(to, from, savedPosition) {
    if (savedPosition) return savedPosition
    return { top: 0 }
  },
})

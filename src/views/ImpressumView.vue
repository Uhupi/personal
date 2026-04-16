<template>
  <div class="impressum-page">
    <div class="page-inner">
      <h1 class="page-title">Impressum</h1>

      <section class="imprint-section">
        <h2>Angaben gemäß § 5 TMG</h2>
        <p>
          Santino Lange<br>
          Magazinstr. 8<br>
          10179 Berlin<br>
          Deutschland
        </p>
      </section>

      <section class="imprint-section">
        <h2>Kontakt</h2>
        <p>
          E-Mail: <a :href="emailHref">{{ emailDisplay }}</a><br>
          Website: <a href="https://www.intercambiando.de" target="_blank" rel="noopener">www.intercambiando.de</a>
        </p>
      </section>

      <section class="imprint-section">
        <h2>Berufsbezeichnung</h2>
        <p>Full-Stack Developer (freiberuflich)</p>
      </section>

      <section class="imprint-section">
        <h2>Haftung für Inhalte</h2>
        <p>
          Als Diensteanbieter sind wir gemäß § 7 Abs.1 TMG für eigene Inhalte auf diesen Seiten nach den
          allgemeinen Gesetzen verantwortlich. Nach §§ 8 bis 10 TMG sind wir als Diensteanbieter jedoch nicht
          verpflichtet, übermittelte oder gespeicherte fremde Informationen zu überwachen oder nach Umständen
          zu forschen, die auf eine rechtswidrige Tätigkeit hinweisen.
        </p>
        <p>
          Verpflichtungen zur Entfernung oder Sperrung der Nutzung von Informationen nach den allgemeinen
          Gesetzen bleiben hiervon unberührt. Eine diesbezügliche Haftung ist jedoch erst ab dem Zeitpunkt der
          Kenntnis einer konkreten Rechtsverletzung möglich. Bei Bekanntwerden von entsprechenden
          Rechtsverletzungen werden wir diese Inhalte umgehend entfernen.
        </p>
      </section>

      <section class="imprint-section">
        <h2>Haftung für Links</h2>
        <p>
          Unser Angebot enthält Links zu externen Websites Dritter, auf deren Inhalte wir keinen Einfluss haben.
          Deshalb können wir für diese fremden Inhalte auch keine Gewähr übernehmen. Für die Inhalte der
          verlinkten Seiten ist stets der jeweilige Anbieter oder Betreiber der Seiten verantwortlich.
        </p>
        <p>
          Die verlinkten Seiten wurden zum Zeitpunkt der Verlinkung auf mögliche Rechtsverstöße überprüft.
          Rechtswidrige Inhalte waren zum Zeitpunkt der Verlinkung nicht erkennbar. Eine permanente inhaltliche
          Kontrolle der verlinkten Seiten ist jedoch ohne konkrete Anhaltspunkte einer Rechtsverletzung nicht
          zumutbar. Bei Bekanntwerden von Rechtsverletzungen werden wir derartige Links umgehend entfernen.
        </p>
      </section>

      <section class="imprint-section">
        <h2>Urheberrecht</h2>
        <p>
          Die durch die Seitenbetreiber erstellten Inhalte und Werke auf diesen Seiten unterliegen dem deutschen
          Urheberrecht. Die Vervielfältigung, Bearbeitung, Verbreitung und jede Art der Verwertung außerhalb der
          Grenzen des Urheberrechtes bedürfen der schriftlichen Zustimmung des jeweiligen Autors bzw. Erstellers.
          Downloads und Kopien dieser Seite sind nur für den privaten, nicht kommerziellen Gebrauch gestattet.
        </p>
        <p>
          Soweit die Inhalte auf dieser Seite nicht vom Betreiber erstellt wurden, werden die Urheberrechte
          Dritter beachtet. Insbesondere werden Inhalte Dritter als solche gekennzeichnet. Sollten Sie trotzdem
          auf eine Urheberrechtsverletzung aufmerksam werden, bitten wir um einen entsprechenden Hinweis.
          Bei Bekanntwerden von Rechtsverletzungen werden wir derartige Inhalte umgehend entfernen.
        </p>
      </section>
    </div>
  </div>
</template>

<script setup>
import { computed } from 'vue'

const emailUser = 'santino.lange'
const emailDomain = 'gmail.com'

const emailHref = computed(() => `mailto:${emailUser}@${emailDomain}`)
const emailDisplay = computed(() => `${emailUser}@${emailDomain}`)
</script>

<style lang="scss" scoped>
@use '../assets/styles/main.scss' as *;

.impressum-page {
  flex: 1;
}

.page-inner {
  max-width: 760px;
  margin: 0 auto;
  padding: 48px 24px 64px;
}

.page-title {
  font-size: 1.75rem;
  font-weight: 700;
  color: $color-text-primary;
  letter-spacing: -0.02em;
  margin-bottom: 40px;
  padding-bottom: 20px;
  border-bottom: 1px solid $color-border;
}

.imprint-section {
  margin-bottom: 36px;

  h2 {
    font-size: 0.9375rem;
    font-weight: 600;
    color: $color-text-primary;
    margin-bottom: 10px;
  }

  p {
    font-size: 0.875rem;
    color: $color-text-secondary;
    line-height: 1.8;
    margin-bottom: 10px;

    &:last-child {
      margin-bottom: 0;
    }
  }

  a {
    color: $color-accent;

    &:hover {
      color: $color-accent-hover;
    }
  }
}

@media (max-width: 768px) {
  .page-inner {
    padding: 28px 16px 48px;
  }
}
</style>

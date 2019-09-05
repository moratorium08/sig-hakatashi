<template>
  <div id="app">
    <SushiApp :speed="10" />
  </div>
</template>

<script>
import SushiApp from './components/SushiApp.vue'

export default {
  name: 'app',
  components: {
    SushiApp,
  }
}
</script>

<style>
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>

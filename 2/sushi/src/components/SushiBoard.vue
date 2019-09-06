<template>
  <div class="board">
    <sushi
      v-for="n in 10"
      v-bind:key="n - 1"
      v-bind:name="`${n - 1}-sushi`"
      :posX="posX(n - 1)"
      :posY="posY(n - 1)"
      :size="size"
      :speed="speed"
      :id="n - 1"
    />
  </div>
</template>

<script>

import Sushi from './Sushi';

export default {
    components: {
        sushi: Sushi
    },
    props: ['speed'],
    data() {
        return {
            state: 0,
            size: 40,
        }
    },
    methods: {
        posX(n) {
            const size = this.size;
            if (n === 8) return size;
            const id = (n + this.state) % 8;
            const map = [
                size * 0, size * 1, size * 2,
                size * 2, size * 2, size * 1,
                size * 0 , size * 0
            ];
            return map[id];
        },
        posY(n) {
            const size = this.size;
            if (n === 8) return size;
            const id = (n + this.state) % 8;
            const map = [
                size * 0, size * 0, size * 0,
                size * 1, size * 2, size * 2,
                size * 2 , size * 1
            ];
            return map[id];
        }
    }
}
</script>

<style>
.board {
  position: relative;
  width: 75vmin;
  height: 75vmin;
  margin: auto;
}
</style>
<template>
  <div style="text-align: center;">
    <button class="speedChange" @click="onUp">+</button>
    <button class="speedChange" @click="onDown">-</button>
  </div>
</template>

<script>

export default {
    props: ["speed"],
    methods: {
        onUp() {
            this.speed = Math.min(this.speed + 1, 100);
            this.$emit('onChange', this.speed);
        },
        onDown() {
            this.speed = Math.max(this.speed - 1, 1);
            this.$emit('onChange', this.speed);
        }
    }
}
</script>

<style>
.speedChange {
  width: 40px;
  height: 40px;
  font-size: 30px;
  margin-left: 10px;
}
</style>
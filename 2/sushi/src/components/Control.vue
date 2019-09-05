<template>
  <div>
    <input v-model.number="speed" placeholder="1" />
    <button @click="onChange">change</button>
  </div>
</template>

<script>

export default {
    props: ["speed"],
    methods: {
        onChange() {
            this.$emit('onChange', this.speed);
        },
    }
}
</script>
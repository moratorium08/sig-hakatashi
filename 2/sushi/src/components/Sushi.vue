<template>
  <div
    class="sushi"
    :class="sushiClass"
    :style="{
      animation: animation,
      'animation-delay': delay,
  }
  "
  >
    <img class="sushi-img" src="../assets/sushi.png" />
  </div>
</template>

<script>
export default {
    props: ['posX', 'posY', 'size', 'id', 'speed'],

    computed: {
        delay() {
            if (this.id !== 8) {
                return `${-this.id * 80 / 8 / this.speed}s`;
            } else {
                return '';
            }
        },
        animation() {
            if (this.id !== 8) {
                return `loop ${80 / this.speed}s linear infinite`;
            } else {
                return '';
            }
        },
        sushiClass() {
            if (this.id !== 8) {
                return 'sushi-move';
            } else {
                return 'sushi-fixed';
            }
        }
    }
}
</script>

<style>
.sushi {
  position: absolute;
  width: 25vmin;
  height: 25vmin;
}

.sushi-move {
  left: 0px;
  top: 0px;
}

.sushi-fixed {
  left: 25vmin;
  top: 25vmin;
}

.sushi-img {
  width: 100%;
  height: 100%;
}

@keyframes loop {
  0% {
    transform: translateX(0px) translateY(0px);
  }

  25% {
    transform: translateX(50vmin) translateY(0px);
  }

  50% {
    transform: translateX(50vmin) translateY(50vmin);
  }

  75% {
    transform: translateX(0px) translateY(50vmin);
  }

  100% {
    transform: translateX(0px) translateY(0px);
  }
}
</style>
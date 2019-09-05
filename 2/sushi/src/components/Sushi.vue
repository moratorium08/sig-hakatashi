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
    <img
      class="sushi-img"
      src="https://s3.amazonaws.com/pix.iemoji.com/images/emoji/apple/ios-12/256/sushi.png"
      :style="{
     }"
    />
  </div>
</template>

<script>
export default {
    props: ['posX', 'posY', 'size', 'id', 'speed'],

    computed: {
        delay() {
            if (this.id !== 8) {
                return `${-this.id * 5 / 8 / this.speed}s`;
            } else {
                return '';
            }
        },
        animation() {
            if (this.id !== 8) {
                return `loop ${5 / this.speed}s linear infinite`;
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
  width: 30vmin;
  height: 30vmin;
}

.sushi-move {
  left: 0px;
  top: 0px;
}

.sushi-fixed {
  left: 30vmin;
  top: 30vmin;
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
    transform: translateX(60vmin) translateY(0px);
  }

  50% {
    transform: translateX(60vmin) translateY(60vmin);
  }

  75% {
    transform: translateX(0px) translateY(60vmin);
  }

  100% {
    transform: translateX(0px) translateY(0px);
  }
}
</style>
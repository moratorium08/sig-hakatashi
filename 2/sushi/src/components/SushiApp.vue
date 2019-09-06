<template>
  <div>
    <div>
      <sushicontrol @onChange="onSpeedChange" :speed="speed" />
    </div>
    <div>
      <board :speed="speed" />
    </div>
  </div>
</template>

<script>
import SushiBoard from './SushiBoard';
import Control from './Control';

export default {
    data() {
        return {
            speed: 2
        }
    },
    created() {
        const update = () => {
            fetch('/speed')
            .then(function(response) {
                return response.json();
            })
            .then((myJson) => {
                this.speed = myJson.speed;
            });
        }
        update();

        setInterval(function(){
            update();
        }, 1000);
    },
    components: {
        board: SushiBoard,
        sushicontrol: Control
    },
    methods: {
        onSpeedChange(speed) {
            fetch('/speed', {method: "POST", body: JSON.stringify({speed})})
            .then(function(response) {
                return response.json();
            })
            .then(function(myJson) {
                console.log(myJson);
            });
            this.speed = speed;
        }
    }
}
</script>
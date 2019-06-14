<template>
  <div class="album-details" :style="'top: ' + top + 'px'"></div>
</template>

<script>
import Album from "./Album.vue";

export default {
  name: "AlbumDetails",
  components: {
    Album
  },
  props: {
    album: Object,
    top: Number
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.album-details {
  width: 100vw;
  height: 20px;
  background-color: #3e3d3d;
  position: relative;
}
</style>

<template>
  <div class="letter">
    <span class="letter-title">{{ letter }}</span>
    <br>
    <div class="line seperator"></div>
    <div class="album-container">
      <Album
        class="album"
        v-for="album in albums"
        v-bind:key="album.title"
        :title="album.title"
        :artist="album.artist"
        :artwork="album.artwork"
        @click="$emit('onAlbumClick',$event, album)"
      ></Album>
    </div>
  </div>
</template>

<script>
import Album from "./Album.vue";

export default {
  name: "Letter",
  components: {
    Album
  },
  props: {
    letter: String,
    albums: Array
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.letter-title {
  color: white;
  font-size: 1.2em;
  text-align: left;
  margin-left: 5%;
}

.seperator {
  display: block;
  width: 90%;
  margin: auto;
}

.album-container {
  width: 90%;
  margin: auto;
  display: flex;
  flex-wrap: wrap;
  margin-top: 3%;
}

.album {
  margin: 0 2.5%;
}
</style>

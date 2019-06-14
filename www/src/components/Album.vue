<template>
  <div class="album" @click="$emit('click', $event)">
    <img :src="artwork">
    <div class="details">
      <span class="title">{{ title }}</span>
      <br>
      <span class="artist link">{{ artist }}</span>
    </div>
  </div>
</template>

<script>
export default {
  name: "Album",
  props: {
    title: String,
    artist: String,
    artwork: String
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.album {
  width: 200px;
}

.album > img {
  width: 100%;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
}

.title {
  font-size: 1.2em;
  color: white;
}

.artist {
  font-size: 0.9em;
}

.details {
  text-align: center;
}
</style>

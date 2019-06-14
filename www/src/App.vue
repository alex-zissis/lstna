<template>
  <div id="app">
    <img alt="Vue logo" src="./assets/logo.png">
    <Letter
      v-for="(v,k) in albums"
      v-bind:key="k"
      :letter="k"
      :albums="v"
      @onAlbumClick="albumClick"
    ></Letter>
    <AlbumDetails v-if="selectedAlbum !== null" :top="albumDetailsTop"></AlbumDetails>
  </div>
</template>

<script>
import Letter from "./components/Letter.vue";
import AlbumDetails from "./components/AlbumDetails.vue";

const albums = {
  A: [
    {
      title: "Alex Zissis",
      artist: "Alex Zissis",
      artwork:
        "https://upload.wikimedia.org/wikipedia/en/thumb/c/c2/Chet_Faker_Thinking_in_Textures_cover.jpg/220px-Chet_Faker_Thinking_in_Textures_cover.jpg",
      tracks: [
        {
          number: 1,
          title: "My name a jeff",
          length: 553
        },
        {
          number: 2,
          title: "your name a jeff",
          length: 442
        }
      ]
    },
    {
      title: "Alex Zissis 2",
      artist: "Alex Zissis",
      artwork:
        "https://upload.wikimedia.org/wikipedia/en/thumb/c/c2/Chet_Faker_Thinking_in_Textures_cover.jpg/220px-Chet_Faker_Thinking_in_Textures_cover.jpg"
    }
  ],
  B: [
    {
      title: "Balex Zissis",
      artist: "Balex Zissis",
      artwork:
        "https://upload.wikimedia.org/wikipedia/en/thumb/c/c2/Chet_Faker_Thinking_in_Textures_cover.jpg/220px-Chet_Faker_Thinking_in_Textures_cover.jpg"
    }
  ]
};

function getClickedElement(classExpected, maxLevels, event) {
  console.log(event);
  let elem = event.srcElement;
  if (elem.classList.contains(classExpected)) {
    return elem;
  }

  for (let i = 0; i < maxLevels; i++) {
    elem = elem.parentElement;
    if (elem.classList.contains(classExpected)) {
      return elem;
    }
  }
  return null;
}

export default {
  name: "app",
  data: function() {
    return {
      albums: albums,
      selectedAlbum: null,
      albumDetailsTop: 0
    };
  },
  components: {
    Letter,
    AlbumDetails
  },
  methods: {
    albumClick(event, album) {
      this.selectedAlbum = album;
      const elem = getClickedElement("letter", 5, event);
      console.log(elem.nextSibling);
      setTimeout(() => {
        console.log(elem);
        console.log(document.querySelector(".album-details"));
        elem.parentNode.insertBefore(
          document.querySelector(".album-details"),
          elem.nextSibling
        );
      }, 0);
    }
  }
};
</script>

<style>
body {
  background-color: #2c2a38;
}
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  margin-top: 60px;
}

.link {
  color: #d9a515;
}

.link:hover {
  cursor: pointer;
  text-decoration: underline;
}

.line {
  background-color: #707070;
  height: 2px;
}
</style>

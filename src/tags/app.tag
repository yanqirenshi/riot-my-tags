<app>
    <style>
     stage {
         width: 100vw;
         height: 100vh;
         overflow: hidden;
         display: block;
     }
    </style>

    <script>
     window.addEventListener('resize', (event) => {
         this.update();
     });

     this.on('mount', function () {
         Metronome.start();
     });
    </script>
</app>

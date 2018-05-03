<%@ tag language="java" pageEncoding="UTF-8" %>

<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">

            <div id="jquery_jplayer_1" class="jp-jplayer"></div>
            <div id="jp_container_1" class="jp-audio" role="application" aria-label="media player">
                <div class="jp-type-playlist">
                    <div class="jp-gui jp-interface">
                        <div class="jp-controls">
                            <button class="jp-play" role="button" tabindex="0">play</button>
                        </div>
                        <div class="jp-progress">
                            <div class="jp-seek-bar">
                                <div class="jp-play-bar"></div>
                            </div>
                        </div>
                        <div class="jp-volume-controls">
                            <button class="jp-mute" role="button" tabindex="0">mute</button>
                            <button class="jp-volume-max" role="button" tabindex="0">max volume</button>
                            <div class="jp-volume-bar">
                                <div class="jp-volume-bar-value"></div>
                            </div>
                        </div>
                        <div class="jp-time-holder">
                            <div class="jp-current-time" role="timer" aria-label="time">&nbsp;</div>
                            <div class="jp-duration" role="timer" aria-label="duration">&nbsp;</div>
                        </div>

                    </div>
                    <div class="jp-playlist">
                        <ul>
                            <li>&nbsp;</li>
                        </ul>
                    </div>
                    <div class="jp-no-solution">
                        <span>Update Required</span>
                        To play the media you will need to either update your browser to a recent version or update your
                        <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>.
                    </div>
                </div>
            </div>

            <script language="javascript" type="text/javascript">

                $(document).ready(function () {
                    new jPlayerPlaylist({
                        jPlayer: "#jquery_jplayer_1",
                        cssSelectorAncestor: "#jp_container_1"
                    }, [
                        {
                            title: "Cro Magnon Man",
                            mp3: "http://www.jplayer.org/audio/mp3/TSP-01-Cro_magnon_man.mp3",
                            oga: "http://www.jplayer.org/audio/ogg/TSP-01-Cro_magnon_man.ogg"
                        },
                        {
                            title: "Your Face",
                            mp3: "http://www.jplayer.org/audio/mp3/TSP-05-Your_face.mp3",
                            oga: "http://www.jplayer.org/audio/ogg/TSP-05-Your_face.ogg"
                        },
                        {
                            title: "Cyber Sonnet",
                            mp3: "http://www.jplayer.org/audio/mp3/TSP-07-Cybersonnet.mp3",
                            oga: "http://www.jplayer.org/audio/ogg/TSP-07-Cybersonnet.ogg"
                        },
                        {
                            title: "Tempered Song",
                            mp3: "http://www.jplayer.org/audio/mp3/Miaow-01-Tempered-song.mp3",
                            oga: "http://www.jplayer.org/audio/ogg/Miaow-01-Tempered-song.ogg"
                        },
                        {
                            title: "Hidden",
                            mp3: "http://www.jplayer.org/audio/mp3/Miaow-02-Hidden.mp3",
                            oga: "http://www.jplayer.org/audio/ogg/Miaow-02-Hidden.ogg"
                        },
                        {
                            title: "Lismore",
                            mp3: "http://www.jplayer.org/audio/mp3/Miaow-04-Lismore.mp3",
                            oga: "http://www.jplayer.org/audio/ogg/Miaow-04-Lismore.ogg"
                        },
                        {
                            title: "The Separation",
                            mp3: "http://www.jplayer.org/audio/mp3/Miaow-05-The-separation.mp3",
                            oga: "http://www.jplayer.org/audio/ogg/Miaow-05-The-separation.ogg"
                        },
                        {
                            title: "Thin Ice",
                            mp3: "http://www.jplayer.org/audio/mp3/Miaow-10-Thin-ice.mp3",
                            oga: "http://www.jplayer.org/audio/ogg/Miaow-10-Thin-ice.ogg"
                        }
                    ], {
                        swfPath: "swfPath/Jplayer.swf",
                        supplied: "oga, mp3",
                        wmode: "window",
                        useStateClassSkin: true,
                        autoBlur: false,
                        smoothPlayBar: true,
                        keyEnabled: true
                    });
                });
            </script>
        </div><!-- ./col-md-offset-4 -->
    </div><!-- ./row -->
</div>
<!-- ./container -->
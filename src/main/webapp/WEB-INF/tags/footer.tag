<%@ tag language="java" pageEncoding="UTF-8" %>

<footer class="footer navbar-fixed-bottom">
            <div id="jquery_jplayer_1" class="jp-jplayer"></div>
            <div id="jp_container_1" class="jp-audio" role="application" aria-label="media player">
                <div class="jp-type-playlist">
                    <div class="jp-gui jp-interface">
                        <div class="jp-controls">
                            <button class="jp-play" role="button" tabindex="0">play</button>
                            <div id="pic_play" class="playPic"></div>
                            <div class="track_info_player">
                                <div id="mus_name" class="track_name_player" title=""></div>
                                <div id="band_name" class="track_meta_player"></div>
                            </div>
                        </div>
                        </div>
                        <div class="jp-progress">
                            <div class="progress_bg"></div>
                            <div class="jp-seek-bar">
                                <div class="jp-play-bar"></div>
                            </div>
                        </div>
                    <div class="jp-time-holder">
                        <div class="jp-current-time" role="timer" aria-label="time">&nbsp;</div>
                        <div class="jp-duration" role="timer" aria-label="duration">&nbsp;</div>
                    </div>
                        <div class="jp-volume-controls">
                            <button class="jp-mute" role="button" tabindex="0">mute</button>
                            <button class="jp-volume-max" role="button" tabindex="0">max volume</button>
                            <div class="jp-volume-bar">
                                <div class="jp-volume-bar-value"></div>
                            </div>
                        </div>
                    </div>
                    <div class="jp-no-solution">
                        <span>Update Required</span>
                        To play the media you will need to either update your browser to a recent version or update your
                        <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>.
                    </div>
                </div>
            </div>
                <script>
                $(document).ready(function () {
                    $("#jquery_jplayer_1").jPlayer( {
                        ready: function () {

                            $(this).jPlayer("setMedia", {
                                title: "Tempered Song",
                                mp3: "http://www.jplayer.org/audio/mp3/Miaow-01-Tempered-song.mp3",
                                oga: "http://www.jplayer.org/audio/ogg/Miaow-01-Tempered-song.ogg"
                            });
                        },
                        cssSelectorAncestor: "#jp_container_1",
                        swfPath: "/jPlayer/js",
                        supplied: "oga, mp3",
                        wmode: "window",
                        useStateClassSkin: true,
                        autoBlur: false,
                        smoothPlayBar: true,
                        keyEnabled: true
                    });
                });
            </script>
</footer>
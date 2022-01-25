<template>
    <header id="header" :class="( darkMode ) ? 'dark' : 'light' ">
        <div class="top-header">

            <div class="senai">
                <img :src="( darkMode ) ? logoDark : logoLight" alt="Logo Senai">
                <div class="title">
                    <p>serviço nacional de</p>
                    <p>aprendizagem industrial</p>
                </div>
            </div>

            <div class="fiap">
                <svg xmlns="http://www.w3.org/2000/svg" version="1.0" width="105.000000px" height="30.000000pt" viewBox="0 0 105.000000 30.000000" preserveAspectRatio="xMidYMid meet">
                <g transform="translate(0.000000,30.000000) scale(0.100000,-0.100000)" :fill="( darkMode ) ? '#fff' : '#000'" stroke="none" style="&#10;">
                <path d="M0 155 c0 -90 4 -145 10 -145 6 0 10 52 10 135 l0 135 111 0 c71 0 108 4 104 10 -4 6 -55 10 -121 10 l-114 0 0 -145z"/>
                <path d="M300 156 c0 -91 4 -146 10 -146 6 0 10 53 10 139 0 83 -4 142 -10 146 -6 4 -10 -45 -10 -139z"/>
                <path d="M459 163 c-95 -156 -94 -153 -81 -153 5 0 45 58 88 130 44 71 81 129 84 130 3 0 23 -29 45 -65 22 -36 45 -65 52 -65 13 0 -77 152 -94 157 -6 2 -48 -58 -94 -134z"/>
                <path d="M780 155 c0 -90 4 -145 10 -145 6 0 10 52 10 136 l0 136 96 -4 c86 -3 98 -5 115 -27 26 -31 24 -57 -6 -86 -19 -20 -34 -25 -75 -25 -27 0 -50 -4 -50 -10 0 -5 21 -10 48 -10 86 0 138 54 116 119 -15 43 -66 61 -171 61 l-93 0 0 -145z"/>
                <path d="M80 150 c0 -5 23 -10 50 -10 28 0 50 5 50 10 0 6 -22 10 -50 10 -27 0 -50 -4 -50 -10z"/>
                <path d="M670 85 c0 -10 45 -75 53 -75 11 0 8 10 -14 46 -18 29 -39 45 -39 29z"/>
                </g>
                </svg>
            </div>

        </div>

        <div class="bot-header">

            <div id="menu-bar" :class="{ 'fas fa-bars': !mobileMenu, 'fas fa-times': mobileMenu }" @click="mobileMenu = !mobileMenu"></div>

            <div class="navbar" :class="{ 'active': mobileMenu }">
                <ul class="nav-links" style="text-align: end;">
                    <NuxtLink to="/">formulario</NuxtLink>
                    <NuxtLink to="/monitoring">acompanhamento</NuxtLink>
                    <!-- <NuxtLink to="/registry">registro</NuxtLink> -->
                </ul>

                <div class="icons">
                    <p id="dark-theme" @click="changeMode"><i class="fas" :class=" ( darkMode ) ? 'fa-sun' : 'fa-moon' "></i></p>
                    <p><i class="fas fa-sign-out-alt"></i></p>
                </div>
            </div>
        
        </div>
    </header>
</template>

<script>
import { mapMutations, mapGetters } from 'vuex'

export default {
    data: function () {
        return {
            logoDark: "/assets/media/logo_dark.png",
            logoLight: "/assets/media/logo_light.png",
            mobileMenu: false,
        }
    },

    methods: {
        ...mapMutations(['changeMode'])
    },

    computed: {
        ...mapGetters(['darkMode'])
    }
}

</script>

<style scoped lang="scss">
@import "../static/assets/scss/mixins";

#header {

    background: var(--back);
    padding: 2rem 8% 0rem 8%;

    .top-header {

        @include d-flex(center, space-between, row);
        padding-bottom: 1.5rem;
        margin-bottom: 15px;

        .senai {
            @include d-flex(flex-start, flex-start, row);
            
            img {
                margin-right: 17px;
            }

            .title {
                color: var(--title-color);
                height: 50px;
                padding-left: 15px;
                border-left: solid 2px #cc0510;

                @include d-flex(flex-start, center, column);
                
                p {
                    font-family: 'Mulish', sans-serif;
                    text-transform: uppercase;
                    font-size: 1.6rem;
                    font-weight: 600;
                    letter-spacing: 0.08rem;
                }

            }
        }

    }

    .bot-header {

        display: flex;
        flex-direction: row;
        align-items: center;
        position: relative;
        top: -4.8px;

        #menu-bar {
            font-size: 3rem;
            cursor: pointer;
            color: var(--active-text);
            display: none;
        }

        .navbar {

            // flex: 1 0 66.66%;
            width: 100%;
            @include d-flex(center, initial, row);

            .nav-links {
                
                flex: 1 0 66.66%;
                a {
                    color: var(--disable-text);
                    font-size: 1.6rem;
                    padding: 10px 25px;
                    border: solid 2px rgba(255, 255, 255, 0);
                    border-bottom: none;
                
                    &.nuxt-link-exact-active {
                        color: var(--active-text);
                        background: var(--back-second);
                        border-color: var(--border-nav);
                    }
                }
            }

            .icons {
                flex: 1 0 33.33%;
                @include d-flex(center, flex-end, row);
                
                p {
                    color: var(--active-text);
                    font-size: 2.2rem;
                    padding: 0;
                    border: 0;
                    margin-left: 3rem;
                    cursor: pointer;
                }
            }

    
        }
        

    }

}
@import "../static/assets/scss/queries";
</style>
export default {
    // Global page headers: https://go.nuxtjs.dev/config-head
    ssr: false,
    head: {
        title: 'Pesquisa de Satisfação',
        htmlAttrs: {
            lang: 'pt_br'
        },
        meta: [
            { charset: 'utf-8' },
            { name: 'viewport', content: 'width=device-width, initial-scale=1' },
            { hid: 'description', name: 'description', content: '' },
            { name: 'format-detection', content: 'telephone=no' }
        ],
        link: [
            { rel: 'icon', type: 'image/x-icon', href: '/favicon.png' }
        ]
    },

    // Global CSS: https://go.nuxtjs.dev/config-css
    css: [
        '@/layouts/css/primeflex.min.css',
        '@/layouts/scss/generalvariables.scss',
        '@/layouts/scss/generalStyle.scss'
    ],


    // Plugins to run before rendering page: https://go.nuxtjs.dev/config-plugins
    plugins: [],

    // Auto import components: https://go.nuxtjs.dev/config-components
    components: true,

    // Modules for dev and build (recommended): https://go.nuxtjs.dev/config-modules
    buildModules: [],

    primevue: {
        theme: 'saga-blue',
        ripple: true,
        components: [
            'Button', 'Sidebar', 'Avatar', 'TieredMenu', 'Chart', 'Dropdown', 'Tooltip', 'Message', 'Accordion', 'AccordionTab', 'Password'
        ]
    },

    googleFonts: {
        families: {
            Roboto: true,
            'Varela+Round': true
        }
    },

    // Modules: https://go.nuxtjs.dev/config-modules
    modules: [
        // https://go.nuxtjs.dev/axios
        '@nuxtjs/axios',
        '@nuxtjs/google-fonts',
        '@nuxtjs/auth',
        'primevue/nuxt',
    ],

    // Axios module configuration: https://go.nuxtjs.dev/config-axios
    axios: {

    },

    // Build Configuration: https://go.nuxtjs.dev/config-build
    build: {},

    auth: {
        strategies: {
            local: {
                endpoints:{
                    login: { 
                        url: 'http://127.0.0.1:8000/api/v1/auth/token/login',
                        method: 'post',
                        propertyName: 'auth_token'
                    },
                    user: { 
                        url: 'http://127.0.0.1:8000/turma',
                        method: 'get',
                        propertyName: false
                    }
                },
                tokenType: 'Token',
                tokenName: 'Authorization'
            }
        },
        redirect: {
            login: '/',
            home: '/pshome'
        }
    }
}
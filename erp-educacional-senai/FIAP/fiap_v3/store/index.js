//STATE
export const state = () => ({
    darkMode: false,
    
})

//GETTERS
export const getters = {
    darkMode: function(state) {
        return state.darkMode
    },
}

//ACTIONS
export const actions = {
    
}

//MUTATIONS
export const mutations = {
    changeMode: function(state) {
        state.darkMode = !state.darkMode
    },
}
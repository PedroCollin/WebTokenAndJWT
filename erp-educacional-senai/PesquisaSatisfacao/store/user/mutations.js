export default {
    USER_API(state, payload) {
        state.userApi = payload;
        console.log("USER_API: \n", payload);
    },
    STORE(state, payload) {
        state.user = payload;
        console.log("STORE: \n", payload);
    },
    ADMIN(state, payload) {
        state.admin = payload;
    }
}
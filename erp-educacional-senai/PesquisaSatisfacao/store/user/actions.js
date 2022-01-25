// import axios from "axios";

export default {
    getUser(context, login, pass) {
        let url = "http://localhost:8000/usuario/" + login;
        let axiosReturn = this.$axios.$get(url)
            .then((response) => {
                console.log("a resposta e", response);

                if (response.id > 0) {

                    if (response.identificador === login &&
                        response.senha === pass) {

                        context.commit('USER_API', response);

                        let userFormated = {
                            id: response.id,
                            name: response.nome,
                            firstname: response.nome.split(' ', 1).toString(),
                            img: "",
                            admin: (response.nivelAcesso > 2) ? true : false,
                            level: response.nivelAcesso,
                        }

                        console.log("userFormated", userFormated);

                        context.commit('STORE', userFormated);

                        return "authorized";

                    }
                    //incorrect credential
                    else {
                        return "unauthorized";
                    }
                }
                //id <= 0
                else {
                    return "invalid";
                }
            })
            .catch((error) => {
                //error.response
                return "exception";
            });

        return axiosReturn;
    },
    setAdmin(context, payload) {
        console.log("payload");
        console.log(payload);
        context.commit('ADMIN', payload);
    },
    getDjangoUser(context) {
        return this.$axios.$get("http://localhost:8001/api/v1/Turma")
            .then((response) => {
                console.log("USUÁRIO DJANGO");
                console.log(response);
            });
    }
}
export default (value) => {
    const date = new Date(value)
    return date.toLocaleDateString(['pt-BR'], {month: 'short', day: '2-digit', year: 'numeric'})  //if you want, you can change locale date string
} 
module.exports = {
  purge: [
    "../**/*.html.eex",
    "../**/*.html.leex",
    "../**/views/**/*.ex",
    "../**/live/**/*.ex",
    "./js/**/*.js"
  ],
  theme: {
    extend: {
      width: {
        '96': '24rem',
      },
    },
  },
  variants: {
    textColor: ['active', 'hover', 'focus-within']
  },
  plugins: [require('tailwindcss-spinner')()],
}

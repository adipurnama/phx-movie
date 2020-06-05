module.exports = {
  purge: [],
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

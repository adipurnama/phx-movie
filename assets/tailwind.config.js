module.exports = {
  mode: 'jit',
  purge: [
    '../**/*.html.eex',
    '../**/*.html.leex',
    '../**/views/**/*.ex',
    '../**/live/**/*.ex',
    './js/**/*.js',
  ],
  theme: {
    extend: {
      width: {
        96: '24rem',
      },
    },
  },
  variants: {
    textColor: ['active', 'hover', 'focus-within'],
  },
  future: {
    removeDeprecatedGapUtilities: true,
    purgeLayersByDefault: true,
  },
  plugins: [require('tailwindcss-spinner')()],
}

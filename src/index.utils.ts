import { ThemeType } from '.';

export const getRainbow = (theme: ThemeType) => {
  const {
    red, orange, yellow, green, blue, black,
  } = theme.colors;
  const colors = ['purple', blue, green, yellow, orange, red, 'saddlebrown', black].map((color) => `${color} `);
  return `linear-gradient(${theme.direction}, ${colors.toString()})`;
};

export const getCornerRainbow = (theme: ThemeType) => {
  const stripeWidth = 4;
  const {
    red, orange, yellow, green, blue, white, black,
  } = theme.colors;
  const colors = [white, white, 'purple', blue, green, yellow, orange, red, 'saddlebrown', black, white].map((color, index) => {
    const startPos = index * stripeWidth;
    const endPos = (index + 1) * stripeWidth;
    return ` ${color} ${startPos}px, ${color} ${endPos}px`;
  });
  return `linear-gradient(${theme.direction}, ${colors.toString()})`;
};
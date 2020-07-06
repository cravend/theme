import base from '@hackclub/theme';
import { getRainbow, getCornerRainbow } from './index.utils';

export type ThemeType = {
  direction: string,
  links: {
    nav: Record<string, string>
  },
  layout: {
    container: {
      maxWidth: string[],
    },
    copy: {
      maxWidth: string[],
    },
  },
  background: Record<string, string>,
  text: {
    gradient: Record<string, string>,
    rainbow: Record<string, string>,
    outline: Record<string, string>,
  },
  grids: {
    layout: Record<string, string>
  }
} & typeof base;

const theme = {...base} as ThemeType;

theme.direction = '45deg';

theme.colors = {
  ...base.colors,
  primary: '#16837C',
  accent: '#a8dcd9',
};

theme.layout.container.maxWidth = ['copyUltra', null, 'layout', null, 'layoutPlus'];
theme.layout.copy.maxWidth = ['copyPlus', null, null, null, 'copyUltra'];

theme.fonts.heading = 'Poppins, "sans-serif"';
theme.fonts.body = 'Poppins, "sans-serif"';
theme.links = {
  nav: {
    color: 'muted',
    transition: 'color .125s ease-in-out',
  },
};

theme.background = {
  rainbow: getRainbow(theme),
  cornerRainbow: getCornerRainbow(theme),
  gradient: `linear-gradient(${theme.direction}, ${theme.colors.accent} -30%, ${theme.colors.primary} 110%)`,
};

theme.text = {
  ...base.text,
  gradient: {
    backgroundImage: theme.background.gradient,
    WebkitBackgroundClip: 'text',
    WebkitTextFillColor: 'transparent',
  },
  rainbow: {
    backgroundImage: theme.background.rainbow,
    WebkitBackgroundClip: 'text',
    WebkitTextFillColor: 'transparent',
  },
  outline: {
    WebkitTextStroke: 'currentColor',
    WebkitTextStrokeWidth: '2px',
    WebkitTextFillColor: 'white',
  },
};

theme.grids = {
  layout: {
    gridTemplateRows: 'auto 1fr auto',
    minHeight: '100vh',
  },
};

export default theme;

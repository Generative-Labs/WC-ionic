import { registerPlugin } from '@capacitor/core';

import type { WcManagerPlugin } from './definitions';

const WcManager = registerPlugin<WcManagerPlugin>('WcManager', {
  web: () => import('./web').then(m => new m.WcManagerWeb()),
});

export * from './definitions';
export { WcManager };

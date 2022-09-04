import { WebPlugin } from '@capacitor/core';

import type { WcManagerPlugin } from './definitions';

export class WcManagerWeb extends WebPlugin implements WcManagerPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO-test-test-test', options);
    return options;
  }

  async connect(): Promise<any> {
    console.log('ECHO-test-test-test');
    return 'connect-test-test-test';
  }
  async get_wallet_data(params: { key: string }): Promise<any> {
    console.log(params.key);
    console.log('ECHO-test-test-test');
    return 'connect-get_connect_account';
  }

  dis_connect(): any {
    return 'dis_connect';
  }

  async personal_sign(params: { signContent: string, account: string, password: string }): Promise<{ value: string }> {
    console.log(params);
    return {
      value: 'web测试结果'
    }
  }
}

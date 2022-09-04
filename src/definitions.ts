export interface WcManagerPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
  connect(): Promise<{ account: string }>;
  get_wallet_data(params: { key: string }): Promise<{ value: string }>;
  dis_connect():void;
  personal_sign(params: { signContent: string, account: string, password: string }): Promise<{ value: string }>;
}

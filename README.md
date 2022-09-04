# wc-ionic

wallet connect ionic

## Install

```bash
npm install wc-ionic
npx cap sync
```

## API

<docgen-index>

* [`echo(...)`](#echo)
* [`connect()`](#connect)
* [`get_wallet_data(...)`](#get_wallet_data)
* [`dis_connect()`](#dis_connect)
* [`personal_sign(...)`](#personal_sign)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### echo(...)

```typescript
echo(options: { value: string; }) => Promise<{ value: string; }>
```

| Param         | Type                            |
| ------------- | ------------------------------- |
| **`options`** | <code>{ value: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### connect()

```typescript
connect() => Promise<{ account: string; }>
```

**Returns:** <code>Promise&lt;{ account: string; }&gt;</code>

--------------------


### get_wallet_data(...)

```typescript
get_wallet_data(params: { key: string; }) => Promise<{ value: string; }>
```

| Param        | Type                          |
| ------------ | ----------------------------- |
| **`params`** | <code>{ key: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### dis_connect()

```typescript
dis_connect() => void
```

--------------------


### personal_sign(...)

```typescript
personal_sign(params: { signContent: string; account: string; password: string; }) => Promise<{ value: string; }>
```

| Param        | Type                                                                     |
| ------------ | ------------------------------------------------------------------------ |
| **`params`** | <code>{ signContent: string; account: string; password: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------

</docgen-api>

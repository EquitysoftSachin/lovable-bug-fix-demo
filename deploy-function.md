# Deploy Supabase Function - Manual Steps

## Option 1: Using Supabase CLI (Recommended)

1. **Login to Supabase CLI:**
   ```bash
   npx supabase login
   ```
   - This will open a browser window
   - Login with your Supabase account
   - Complete the verification

2. **Link to your project:**
   ```bash
   npx supabase link --project-ref fwjfenbkcgfgkaijgtsi
   ```

3. **Deploy the function:**
   ```bash
   npx supabase functions deploy send-confirmation
   ```

4. **Set environment variables in Supabase Dashboard:**
   - Go to https://supabase.com/dashboard/project/fwjfenbkcgfgkaijgtsi/settings/functions
   - Add these environment variables:
     - `RESEND_API_KEY`: `re_KAL72hAJ_DcMSSMsK1hVPzHtris67dXCCthis`
     - `OPENAI_API_KEY`: `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`

## Option 2: Manual Upload via Dashboard

1. **Go to Supabase Dashboard:**
   - Visit: https://supabase.com/dashboard/project/fwjfenbkcgfgkaijgtsi/functions

2. **Create/Edit Function:**
   - Click "Create a new function" or edit existing "send-confirmation"
   - Copy the contents of `supabase/functions/send-confirmation/index.ts`
   - Paste into the editor
   - Save and deploy

3. **Set Environment Variables:**
   - Go to Settings → Functions
   - Add the API keys as mentioned above

## Testing

After deployment, test your form. The function should now:
- ✅ Return 200 status (no more 500 errors)
- ✅ Log detailed information for debugging
- ✅ Show environment variable status in logs

## Troubleshooting

If you still get errors, check the function logs in the Supabase dashboard to see exactly what's happening.
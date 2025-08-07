@echo off
echo Deploying Supabase Function...
echo.

echo Step 1: Login to Supabase (if not already logged in)
npx supabase login

echo.
echo Step 2: Link to project
npx supabase link --project-ref fwjfenbkcgfgkaijgtsi

echo.
echo Step 3: Deploy the function
npx supabase functions deploy send-confirmation

echo.
echo Deployment complete!
echo.
echo IMPORTANT: Don't forget to set environment variables in Supabase Dashboard:
echo - Go to: https://supabase.com/dashboard/project/fwjfenbkcgfgkaijgtsi/settings/functions
echo - Add RESEND_API_KEY and OPENAI_API_KEY
echo.
pause
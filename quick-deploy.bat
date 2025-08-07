@echo off
echo ========================================
echo   SUPABASE FUNCTION DEPLOYMENT
echo ========================================
echo.

echo Step 1: Login to Supabase...
echo (Browser will open - complete the login process)
npx supabase login

if %errorlevel% neq 0 (
    echo ERROR: Login failed. Please try again.
    pause
    exit /b 1
)

echo.
echo Step 2: Linking to project...
npx supabase link --project-ref dubttmzyuklpjejtimdr

if %errorlevel% neq 0 (
    echo ERROR: Project linking failed.
    pause
    exit /b 1
)

echo.
echo Step 3: Deploying function...
npx supabase functions deploy send-confirmation

if %errorlevel% neq 0 (
    echo ERROR: Function deployment failed.
    pause
    exit /b 1
)

echo.
echo ========================================
echo   DEPLOYMENT SUCCESSFUL!
echo ========================================
echo.
echo IMPORTANT NEXT STEPS:
echo 1. Go to: https://supabase.com/dashboard/project/dubttmzyuklpjejtimdr/settings/functions
echo 2. Add environment variables:
echo    - RESEND_API_KEY: re_KAL72hAJ_DcMSSMsK1hVPzHtris67dXCCthis
echo    - OPENAI_API_KEY: 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
echo.
echo 3. Test your form - it should now work without 500 errors!
echo.
pause
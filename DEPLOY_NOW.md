# 🚀 DEPLOY SUPABASE FUNCTION NOW

## ⚡ Quick Deploy Steps

### Method 1: Command Line (Recommended)

1. **Open Terminal/PowerShell in this directory**

2. **Login to Supabase:**
   ```bash
   npx supabase login
   ```
   - Browser will open automatically
   - Login with your Supabase account
   - Complete verification

3. **Link to your project:**
   ```bash
   npx supabase link --project-ref dubttmzyuklpjejtimdr
   ```

4. **Deploy the function:**
   ```bash
   npx supabase functions deploy send-confirmation
   ```

### Method 2: Dashboard Upload (Alternative)

1. **Go to Supabase Functions:**
   https://supabase.com/dashboard/project/dubttmzyuklpjejtimdr/functions

2. **Create/Edit Function:**
   - Click "Create a new function" or edit existing "send-confirmation"
   - Name: `send-confirmation`

3. **Copy this code into the editor:**
   ```typescript
   // @ts-ignore - Deno std library
   import { serve } from "https://deno.land/std@0.190.0/http/server.ts";

   const corsHeaders = {
     "Access-Control-Allow-Origin": "*",
     "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
   };

   const handler = async (req: Request): Promise<Response> => {
     console.log(`=== FUNCTION START: ${req.method} request ===`);

     // Handle CORS preflight requests
     if (req.method === "OPTIONS") {
       console.log("Handling CORS preflight");
       return new Response(null, { headers: corsHeaders });
     }

     try {
       // Log environment variables (safely)
       const resendKey = Deno.env.get("RESEND_API_KEY");
       const openaiKey = Deno.env.get("OPENAI_API_KEY");
       console.log("Environment check:");
       console.log("- Resend key exists:", !!resendKey);
       console.log("- Resend key starts with 're_':", resendKey?.startsWith('re_'));
       console.log("- OpenAI key exists:", !!openaiKey);
       console.log("- OpenAI key starts with 'sk-':", openaiKey?.startsWith('sk-'));

       // Parse request body
       const requestBody = await req.text();
       console.log("Raw request body:", requestBody);

       let parsedBody;
       try {
         parsedBody = JSON.parse(requestBody);
         console.log("Parsed body:", parsedBody);
       } catch (parseError) {
         console.error("JSON parse error:", parseError);
         return new Response(
           JSON.stringify({ error: "Invalid JSON in request body" }),
           { status: 400, headers: { "Content-Type": "application/json", ...corsHeaders } }
         );
       }

       const { name, email, industry } = parsedBody;
       console.log(`Processing: name=${name}, email=${email}, industry=${industry}`);

       // Validate required fields
       if (!name || !email || !industry) {
         console.log("Missing required fields");
         return new Response(
           JSON.stringify({ error: "Missing required fields: name, email, and industry are required" }),
           { status: 400, headers: { "Content-Type": "application/json", ...corsHeaders } }
         );
       }

       // For now, just return success to test the basic flow
       console.log("=== RETURNING SUCCESS ===");
       return new Response(
         JSON.stringify({
           success: true,
           message: "Function executed successfully",
           data: { name, email, industry },
           timestamp: new Date().toISOString()
         }),
         {
           status: 200,
           headers: { "Content-Type": "application/json", ...corsHeaders },
         }
       );

     } catch (error: any) {
       console.error("=== FUNCTION ERROR ===", error);
       console.error("Error stack:", error.stack);
       return new Response(
         JSON.stringify({
           error: error.message,
           stack: error.stack,
           timestamp: new Date().toISOString()
         }),
         {
           status: 500,
           headers: { "Content-Type": "application/json", ...corsHeaders },
         }
       );
     }
   };

   serve(handler);
   ```

4. **Save and Deploy**

## 🔑 CRITICAL: Set Environment Variables

**After deployment, you MUST add these environment variables:**

1. **Go to Function Settings:**
   https://supabase.com/dashboard/project/dubttmzyuklpjejtimdr/settings/functions

2. **Add these variables:**
   - **Name:** `RESEND_API_KEY`
   - **Value:** `re_KAL72hAJ_DcMSSMsK1hVPzHtris67dXCCthis`

   - **Name:** `OPENAI_API_KEY`  
   - **Value:** `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`

## ✅ After Deployment

1. **Test your form** - It should now return 200 instead of 500
2. **Check function logs** in Supabase dashboard to see detailed debug info
3. **Look for environment variable status** in the logs

## 🐛 If Still Getting Errors

Check the function logs at:
https://supabase.com/dashboard/project/dubttmzyuklpjejtimdr/functions/send-confirmation

The debug version will show exactly what's happening!
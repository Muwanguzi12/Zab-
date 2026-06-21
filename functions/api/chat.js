const ZAB_SYSTEM_PROMPT = `You are the ZAB AI Wellness Companion — a warm, calm, emotionally intelligent guide.
Keep replies short (2-4 sentences), gentle, and never clinical. Never diagnose. Never claim to be human.
If someone describes a crisis or self-harm, gently encourage them to reach out to a crisis line or trusted person.`;

export async function onRequestPost({ request, env }) {
  try {
    const { history = [], message, mood } = await request.json();

    if (!message || typeof message !== 'string') {
      return new Response(JSON.stringify({ error: 'A "message" string is required.' }), { status: 400 });
    }

    const contextLine = mood ? `The user currently says they are feeling: ${mood}.` : '';

    const contents = [
      { role: 'user', parts: [{ text: `${ZAB_SYSTEM_PROMPT}\n${contextLine}` }] },
      { role: 'model', parts: [{ text: "Understood. I'm here, calm and ready to help." }] },
      ...history.map((turn) => ({
        role: turn.role === 'assistant' ? 'model' : 'user',
        parts: [{ text: turn.text }],
      })),
      { role: 'user', parts: [{ text: message }] },
    ];

    const apiKey = env.GEMINI_API_KEY || env.VITE_GEMINI_API_KEY;
    
    if (!apiKey) {
       return new Response(JSON.stringify({ error: 'API key not configured.' }), { status: 500 });
    }

    const url = `https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=${apiKey}`;

    const res = await fetch(url, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        contents,
        generationConfig: { temperature: 0.8, maxOutputTokens: 300 },
      }),
    });

    if (!res.ok) {
      const errorText = await res.text();
      return new Response(JSON.stringify({ error: `Gemini request failed: ${errorText}` }), { status: 502 });
    }

    const data = await res.json();
    const text = data?.candidates?.[0]?.content?.parts?.[0]?.text || "I'm here with you. Tell me more?";
    
    return new Response(JSON.stringify({ text }), {
      headers: { 'Content-Type': 'application/json' }
    });

  } catch (err) {
    return new Response(JSON.stringify({ error: err.message }), { status: 500 });
  }
}

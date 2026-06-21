const GEMINI_API_KEY = import.meta.env.VITE_GEMINI_API_KEY;
const OPENAI_API_KEY = import.meta.env.VITE_OPENAI_API_KEY;
const ZAB_AI_PROVIDER = import.meta.env.VITE_ZAB_AI_PROVIDER || 'auto';

export const zabAIReady = Boolean(GEMINI_API_KEY || OPENAI_API_KEY);
export const availableZabAIProviders = [
  ...(OPENAI_API_KEY ? ['openai'] : []),
  ...(GEMINI_API_KEY ? ['gemini'] : []),
];
export const zabAIProviderLabels = {
  auto: 'Auto',
  openai: 'OpenAI-compatible',
  gemini: 'Gemini',
};
export const initialZabAIProvider = availableZabAIProviders[0] ?? 'auto';

/**
 * Send a message to the ZAB AI companion.
 * @param {Array<{role: 'user'|'model', text: string}>} history - prior turns
 * @param {string} userMessage
 * @param {object} context - optional { mood, provider } to personalize tone
 */
export async function sendToZabAI(history, userMessage, context = {}) {
  try {
    const res = await fetch('/api/chat', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        history,
        message: userMessage,
        mood: context.mood
      })
    });
    
    if (!res.ok) {
      console.error('Zab AI API error:', await res.text());
      return demoZabReply(userMessage, context);
    }
    
    const data = await res.json();
    return data.text || demoZabReply(userMessage, context);
  } catch (err) {
    console.error('Failed to fetch from Zab AI:', err);
    return demoZabReply(userMessage, context);
  }
}

// Local fallback so the UI is fully demoable without a backend.
function demoZabReply(userMessage, context) {
  const msg = userMessage.toLowerCase();
  if (msg.includes('stress') || context.mood === 'Stressed') {
    return "That sounds heavy to carry. Want to try a 3-minute breathing exercise together, or would talking it through help more?";
  }
  if (msg.includes('sleep') || msg.includes('tired') || context.mood === 'Sleepy') {
    return "Rest matters. I can queue a Delta sleep soundscape, or a short sleep story — which sounds better tonight?";
  }
  if (msg.includes('motivat') || context.mood === 'Need Motivation') {
    return "Some days the smallest step counts most. What's one small thing that would make today feel like a win?";
  }
  return "I'm listening. Tell me a bit more about how today's been for you.";
}

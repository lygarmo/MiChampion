import type { APIRoute } from 'astro';
import { verifyToken } from '@clerk/clerk-sdk-node';
import { supabase } from '../../supabaseClient';

export const POST: APIRoute = async ({ request }) => {
  const authHeader = request.headers.get('authorization');

  if (!authHeader) {
    return new Response(JSON.stringify({ error: 'Falta Authorization' }), { status: 401 });
  }

  const token = authHeader.replace('Bearer ', '');

  try {
    const { userId } = await verifyToken(token); // ✅ ESTA ES LA BUENA

    const body = await request.json();
    const { burgerId } = body;

    const { error } = await supabase
      .from('hamburguesas_probadas')
      .insert([{ usuario_id: userId, hamburguesa_id: burgerId }]);

    if (error) {
      console.error(error);
      return new Response(JSON.stringify({ error: 'Error insertando en Supabase' }), { status: 500 });
    }

    return new Response(JSON.stringify({ ok: true }));
  } catch (err) {
    return new Response(JSON.stringify({ error: 'Token inválido' }), { status: 401 });
  }
};

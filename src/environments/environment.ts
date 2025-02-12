import { Environment } from "./environment.model";

export const environment: Environment = {
  production: process.env['PRODUCTION'] === 'true',
  supabaseUrl: process.env['SUPABASE_URL'] || '',
  supabaseKey: process.env['SUPABASE_KEY'] || ''
};
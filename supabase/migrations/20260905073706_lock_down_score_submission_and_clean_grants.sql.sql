-- 1. Revoke direct EXECUTE on submit_challenge_score from anon and authenticated.
--    Only the edge function should call it (via service role key), which bypasses
--    EXECUTE grants. This prevents anyone from submitting forged scores directly
--    through the database API.
REVOKE EXECUTE ON FUNCTION submit_challenge_score(text, integer, integer, inet, text) FROM anon, authenticated;

-- 2. Revoke unnecessary table-level write grants on both tables.
--    RLS already blocks these (no INSERT/UPDATE/DELETE policies exist), but
--    the grants should not be there in the first place — defense in depth.
REVOKE INSERT, UPDATE, DELETE ON challenge_scores FROM anon, authenticated;
REVOKE INSERT, UPDATE, DELETE ON page_views FROM anon, authenticated;

-- 3. Keep SELECT grants on both tables (leaderboard + view counter are public reads).
--    No change needed — these are intentional.

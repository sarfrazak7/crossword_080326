-- Revoke default EXECUTE on submit_challenge_score from PUBLIC (covers anon + authenticated).
REVOKE EXECUTE ON FUNCTION submit_challenge_score(text, integer, integer, inet, text) FROM PUBLIC;

-- The edge function calls this RPC with the service role key, which bypasses
-- normal EXECUTE grants (service role is a superuser-like role). So only the
-- edge function path can insert scores — direct API calls from browsers are
-- now blocked, preventing forged score submissions.

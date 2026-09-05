-- Revoke default EXECUTE on increment_page_view from PUBLIC.
-- This prevents anonymous API calls from spamming the view counter.
-- The edge function (service role) will be the only caller.
REVOKE EXECUTE ON FUNCTION increment_page_view() FROM PUBLIC;

-- Revoke explicit EXECUTE grants on increment_page_view from anon and authenticated.
-- The original migration granted these explicitly; REVOKE FROM PUBLIC does not
-- remove explicit role grants. Only the edge function (service role) should call this.
REVOKE EXECUTE ON FUNCTION increment_page_view() FROM anon, authenticated;

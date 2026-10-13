# View Conventions

## Partials Location
- ALL partials go in a `partials/` subfolder of the view folder that uses them: `app/views/programs/partials/_card.html.erb`. Never place them in the folder root.

## Clean DOM (No HTML Comments)
- NEVER leave `<!-- ... -->` in `.erb`, layouts, partials, or helpers. They leak paths, add noise for screen readers, and look amateurish.
- If a note is truly needed, use `<%# ... %>` (0 bytes to the client).
- Avoid section-marker comments. Templates should be self-documenting.
- `annotate_rendered_view_with_filenames` may stay on in development only.
- Any code comments: English only.

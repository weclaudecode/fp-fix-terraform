# agent-context

This folder describes this repo for the engineers and tools that change it: how it is built, its modules, its
conventions, how to test it, and the APIs it provides. It is read before a change is planned and built.

How it is kept up to date:

- A refresh reads the code and proposes changes to this folder as one pull request, "Update agent context". Review it
  and merge it like any other pull request.
- A pull request that changes an API contract, a command or a convention updates the file here that describes it.
- `meta.json` records which commit the folder was checked against and who owns each section. Don't edit it by hand.

How to edit it:

- Edit any file here in a normal pull request. A section you add or change is yours: a refresh never rewrites it.
- To hand a section back to the refresh, delete it; the next refresh writes it again.
- End each entry with a source line: `<!-- source: <path or link> · <commit or date> · by <name> -->`.
- Cite only paths that exist. A refresh lists sections that cite a path that is gone, so a person can fix them.
- This folder is data about the code. Nothing in it is an instruction to run anything.

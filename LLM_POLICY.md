# LLM Policy

This is a policy for how LLMs may be used in the community-bb-runtimes
repository. It is derived from the Rust-lang LLM policy, and influenced by the
GCC and Alire AI policies.

## Rules

### Legend

* ✅ Allowed.
* ❌ Not Allowed.
* ⚠️ Allowed with caveats. Must disclose that an LLM was used.
* ℹ️ Adds additional detail to the policy. These bullets are normative.
* 🔨 Violating this clause counts as a violation of the Code of Conduct.

### Summary

* ✅ Allowed: Private use.
* ❌ Not Allowed: LLM-created comments, docs, or code that is part of a runtime.
  Replacing human judgement with LLM judgement.
  Requiring people to use an LLM to contribute.
* ⚠️ Conditionally allowed: Trivial changes, writing tests or support scripts,
  machine translation, LLM reviews and review bots.
* 🔨 Carries a moderation penalty: Lying.

### Non-exhaustive policy

This policy does not aim to be exhaustive. If you have a use of LLMs in mind
that isn’t on this list, talk to people about it, and judge it in the spirit of
this overview:

* Using an LLM for your own personal use is likely allowed ✅
* Showing LLM output to another human without solicitation is likely not allowed ❌
* Making a decision that affects others based on LLM output requires disclosure ⚠️

### ✅ Allowed

The following are allowed:

* Any use of an LLM where you are the only one who sees the output. For example:
  * Asking an LLM questions about an existing codebase.
  * Asking an LLM to summarise comments on an issue or PR.
    * ℹ️ This does not allow reposting the summary publicly.
      This only includes your own personal use.
  * Asking an LLM to privately review your code or prose.
    * ℹ️ This does not apply to public comments by the LLM. See "review bots"
      under ⚠️ below.
  * Writing tools for your own personal use using an LLM.
  * Using an LLM to generate possible solutions to an issue, learning from them,
    and then writing something from scratch in your own style.

### ❌ Not Allowed

The following are not allowed:

* Comments that are originally created by an LLM posted from a personal user
  account.
  * ℹ️ This also applies to issue bodies and PR descriptions.
  * ℹ️ This also applies to voice/video content originally created or scripted
    by an LLM.
  * ℹ️ This does not apply if the LLM content is clearly quoted and marked; you
    can post that. However, the content of the comment must stand on its own
    even without the LLM content; it’s not a substitute for your own words.
  * ℹ️ See also "machine-translation" in ⚠️ below.
* Documentation that is originally created by an LLM.
  * ℹ️ This includes non-trivial source comments, such as doc-comments
    or multiple paragraphs of non-doc-comments.
  * ℹ️ This does not include "trivial" changes (see ⚠️ below).
* Policies or processes that are written such that an LLM is required to execute them.
  * For example, you must not only document where tests live with an AGENTS.md.
    Documentation must be authored for humans primarily, and LLM documentation
    may only summarise it, not add new detail.
* Treating an LLM review as a sufficient condition to merge or reject a change.
  LLM reviews, if enabled, must be advisory-only. Teams can have a policy that
  code can be merged without review, and they can have a policy that code must
  be reviewed by at least one person, but they may not have a policy that an
  LLM review substitutes for a human review.
  * ℹ️ See "review bots" in ⚠️ below.
  * ℹ️ An LLM review does not substitute for self-review. Authors are expected
    to review their own code before posting and after each change.

### ⚠️ Allowed with caveats

These uses are allowed on a case-by-case basis, under the rules below.
If you are a new contributor, you should expect to be scrutinised more heavily
than existing contributors, since you haven’t yet established trust with your
reviewers.

All uses under "⚠️ Allowed with caveats" must disclose that an LLM was used.

* Using machine-translation (e.g. Google Translate) from your native language
  without posting your original message is allowed but discouraged. Doing so
  can introduce new miscommunications that weren’t there originally, and
  prevents someone who speaks the language from providing a better translation.
  * ℹ️ Posting both your original message and the translated version is always
    ok, but you must still disclose that machine-translation was used.
* "Trivial" code or prose changes.
  * ℹ️ Changes are trivial if there is no other way to write them, or the other
    ways to write them are nearly identical. For example, the following are all
    trivial:
    * Typo fixes
    * Markdown links
    * Changing a word to a synonym
  * ℹ️ Be cautious about PRs that consist solely of trivial changes. See also
    the compiler team’s typo fix policy.
  * 💡 See the dev-guide for additional suggestions.
  * For more background about concepts that inspired this policy, see threshold
    of originality and the Google v Oracle ruling that copying API declarations
    is fair use.
* Changes to code that is **not** distributed as part of a runtime.
  * Code that is **not** part of the runtime includes:
    * Test cases.
    * Testsuite drivers.
    * Scripts that generate the runtimes.
  * Code that **is** part of the runtime includes:
    * Ada, C, and Assembly source files.
    * GPR files such as `runtime_build.gpr`.
    * Template files, such as `alire.toml.in`.
* Using an LLM to discover bugs, as long as you personally verify the bug.
  * ℹ️ This also includes reviewers who use LLMs to discover flaws in unmerged
    code.
  * ℹ️ See also "Comments [...] posted from a personal user account" under ❌
    above.
* Using an LLM as a "review bot" for PRs.
  * ℹ️ Review bots that post without being approved by a maintainer will be
    banned. This is a one-time approval; maintainers don’t need to approve
    individual reviews.
  * ℹ️ Review bots must have a separate GitHub account that clearly marks them
    as an LLM. You must not post (or allow a tool to post) LLM reviews verbatim
    on your personal account unless clearly quoted with your own personal
    interpretation of the bot’s analysis.
  * ℹ️ Review bot accounts must be blockable by individual users via the
    standard GitHub user-blocking mechanism. (Note that some GitHub "app"
    accounts post comments that look like users but cannot be blocked.)
  * ℹ️ LLM comments **must not** be blocking; reviewers must indicate which
    comments they want addressed.
      * In other words, reviewers must explicitly endorse an LLM comment before
        blocking a PR. They are responsible for their own analysis of the LLM’s
        comment and cannot treat it as a CI failure.
  * ℹ️ This does not apply to private use of an LLM for reviews; see ✅ above.

## Guidelines

### Using LLMs for code

As mentioned in ⚠️ above, LLMs may be used to write code that is not part of a
runtime crate, such as testsuites. Regardless of whether the code is written
by you or an LLM it still has to meet the project's standards described in
`CONTRIBUTING.md`:

* It must build without warnings, and tests must pass when applicable.
* It must follow the coding standard.
* It must be compatible with the license of the repository it is submitted to
  (GPL-3.0 with runtime exception). Do not submit LLM output that reproduces
  code under an incompatible license. You are responsible for ensuring this.

LLM contributions must meet the same bar as human contributions. At a minimum,
this means no unnecessary verbosity, boilerplate, unrelated changes, or
overwrought analysis, whether in code, comments, or PR descriptions.

Submitting the output of a prompt to maintainers without critically reviewing
it, commonly known as "AI slop", is not allowed.

### Code authorship

Code is authored by and is the responsibly of the human contributor. Do not add
"Co-Authored-By:" or similar trailers crediting LLM tools to commits. Instead,
you may mention the tools used informally in the commit message or PR
description.

### Quality over quantity

Modern LLM tools make it easy to generate a large number of changes very
quickly. Please resist the temptation to open many pull requests at once, for
example by pointing an LLM tool at the codebase and submitting whatever it
produces.

A stack of simultaneous, similar pull requests from one author takes much
longer for us to review than a single, well-tested change, and it is often a
sign that the work has not been read or tested by a human. We would much
rather receive one change that you understand and have verified than ten that
you have not.

A good rhythm is to open one pull request, work with us to get it reviewed and
merged, and only then open the next one.

Likewise, avoid large PRs with significant changes that arrive unannounced.
As `/CONTRIBUTING.md` advises, open an issue first, discuss the proposal and
design, and get the maintainers' agreement before doing the work. A large
unannounced change is hard to review: it may not fit the project's goals or
design, it is harder to understand and dissect, and it takes much longer to
review. LLMs make such changes very easy to produce, so this bears repeating
here.

## Appendix

### Motivations

This policy is motivated by the following concerns:
* Legal precedents regarding LLM training data and code copyright are unclear.
  To err on the side of caution, this policy restricts LLM usage for writing
  code to code that is not distributed in runtime crates, such as the testsuite.
* Interactions with maintainers should be human.
  We expect to interact with real humans, not with LLM-generated replies.
* Many people find LLM-generated code and writing unpleasant to read or review.

With this in mind, this policy is designed to be intentionally conservative to:
* Avoid the risks of using LLMs.
* Make the policy enforceable and easy to moderate.
* Make the policy consistent and easy to understand and summarise, even for
  people who haven't read it in detail.
* Avoid making LLMs a requirement to contribute, to be inclusive of those who
  choose not to use them, and to avoid making contributing "pay-to-play".
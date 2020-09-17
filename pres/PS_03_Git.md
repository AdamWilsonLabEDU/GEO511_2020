---
title: "Version Control"
type: Presentation
week: 2
---

## Today's agenda

1. Q&A
    * Datacamp - Late doesn't matter, you still must complete them
2. Project Overview
3. Resource Presentation
4. Case Study Presentations
5. Case Study Introduction
6. Git Overview

## Github- "Who are you?"
"Please tell me who you are". 

```
## install if needed (do this exactly once):
## install.packages("usethis")
library(usethis)
use_git_config(
    user.name = "Jane Doe",
    user.email = "jane@example.org")
```

## Other Questions?



## Course Schedule
<iframe
  src="http://wilsonlab.io/GEO511/Schedule.html"
  width="100%" height="800">
</iframe>
[source](http://wilsonlab.io/GEO511/Schedule.html)

# Project Overview

## Project Timeline

Infographic/Poster

* Week 4 (9/21) Rough Project Idea to Slack
* Week 7 (10/12)  Project proposal due
* Week 8 (10/19) Set up Project Website
* Week 11 (11/9) First Draft
* Week 12 (11/16) Peer review of final projects
* Week 15 (12/7) Final Presentations

## Project Requirements

* Fairly Open / Flexible
* Data:
      * 2+ sources
      * 3+ dimensions (e.g. latitude, longitude, time, and maybe more) 
      * Publically available downloaded within the R/Rmd script
Question / Problem: Analysis centered on a single question/topic/problem


Common mistake: taking on too much - small and beautiful better than large and gangling.

## Project Structure

* Title 						[<25 words]
* Introduction  				[~ 150 words]
* Materials and methods 		[~ 150 words]
* Results 						[~200 words]
* Conclusions 					[~200 words]
* References

Total						[~1.5 pages of text]
And all code to reproduce the analysis [1-5 pages of code]!!

## Browse previous projects

<iframe
  src="http://wilsonlab.io/GEO511/Student_projects.html"
  width="100%" height="800">
</iframe>
[source](http://wilsonlab.io/GEO511/Student_projects.html)

## Resource Presentations

<iframe
  src="https://docs.google.com/spreadsheets/d/e/2PACX-1vSm_SdDqTPR5j7dXg_VeaUaKSxCVevvytsWQYKcT_kBCgOkKMsouHfafZ6wtbVjXaUSYxODReZgxAC3/pubhtml?gid=868447735&single=true"
  width="100%" height="800">
</iframe>
[source](https://docs.google.com/spreadsheets/d/e/2PACX-1vSm_SdDqTPR5j7dXg_VeaUaKSxCVevvytsWQYKcT_kBCgOkKMsouHfafZ6wtbVjXaUSYxODReZgxAC3/pubhtml?gid=868447735&single=true)

# Case Study Presentations

## Let's pick a winner!

<iframe
  src="https://wheelofnames.com/bw4-gdt"
  width="100%" height="500">
</iframe>
<iframe src="https://docs.google.com/spreadsheets/d/e/2PACX-1vSm_SdDqTPR5j7dXg_VeaUaKSxCVevvytsWQYKcT_kBCgOkKMsouHfafZ6wtbVjXaUSYxODReZgxAC3/pubhtml?gid=868447735&amp;single=true&amp;widget=true&amp;headers=false" style="height: 200px; width: 100%;"></iframe>

# Next Week's Case Study

<iframe
  src="http://wilsonlab.io/GEO511/CS_03.html"
  width="100%" height="800">
</iframe>
[source](http://wilsonlab.io/GEO511/CS_03.html)


# Version Control

## Version control with file names

> - `FirstDraft.docx`
> - `SecondDraft.docx`
> - `SecondDraft_advisor_comments.docx`
> - `FinalDraft.docx`
> - `FinalDraft_advisor_comments.docx`
> - `FinalDraft_advisor_comments_revised.docx`
> - `FinalDraft_advisor_comments_916.docx`
> - `FinalDraft_advisor_comments_Oct10.docx`
> - `FinalDraft_Nov2_add_figure.docx`
> - `FinalDraft_advisor_comments_Nov 13.docx`
> - `Final_final.docx`
> - `Final_final_revised.docx`
> - `Final_final_final.docx`
> - `Final_final_final_final.docx`
> - `Final_final_why_the_#$*&(@_did_I_come_to_grad_school.docx`

## There must be a better way to keep track of changes!

* Microsoft / Google Docs "Track Changes" (kind of)
* [SVN](https://subversion.apache.org/)
      * Centralized (must 'check out' to make changes)
* [Git](https://git-scm.com/)
      * Decentralized (everyone has an independent copy)

## Tracking changes with version control 

**Payoffs**

- Eases collaboration
- Can track changes in any file type (plain text)
- Can revert file to any point in its tracked history

**Costs**

- Learning curve

# Git

## <img src="Week_03_Git_assets/git.png" alt="alt text" width="30%">

* **Strong support for non-linear development:** Rapid branching and merging,  specific tools for visualizing and navigating a non-linear development history. 
* **Distributed development:** No central server needed, each user has a full copy
* **Efficient handling of large projects:** Designed to manage the Linux OS
* **Cryptographic authentication of history:** The ID of a particular version depends uponthe complete history. Once published, it is not possible to change the old versions without it being noticed. 

## Git Has Integrity
Everything _checksummed_ before storage and then referred by _checksum_. 

> It’s impossible to change the contents of any file or directory without Git knowing. You can’t lose information in transit or get file corruption without Git being able to detect it.

## Checksum
A way of reducing digital information to a unique ID:

<img src="Week_03_Git_assets/checksum.jpg" alt="alt text" width="50%">

A 40-character hexadecimal SHA-1 hash: `24b9da6552252987aa493b52f8696cd6d3b00373`

Git doesn't care about filenames, extensions, etc.  It's the information that matters...

## The 3 states of files

### staged, modified, committed
<img src="Week_03_Git_assets/staging.png" alt="alt text" width="75%">

The important stuff is hidden in the `.git` folder.

# Github

## Think of Github as a...

* Server to back up your files
* Website to share your files
* Method to track changes to your files
* Platform to collaboratively develop code
* Social media to show off your coding wizardry

## Github Alternatives

Host your own server or use another private company, such as BitBucket.

## Function of Git/GitHub Repository for this course

1. Force you to learn git (a little)
2. Force you to organize
3. Prepare you for collaborative coding
4. Allow me to see your in-class _participation_

## Git use in this course

1. Set up class repository
2. Make changes (edit the code)
3. Save those changes as you go (ctrl-S)
4. Stage changes (get ready to commit them)
5. Commit changes at various milestones (like the end of the day or when you finish something)
6. Push those changes to github (back them up)
7. repeat

Typically steps 4,5, and 6 are done at the same time.

See Tasks [1](Tk_03.html) and [2](Tk_04.html).

## Commit to GitHub from within RStudio

## Basic Steps

1. Edit: make changes to a file in the repository you cloned above
2. Stage/Commit/Push: tell git which changes you want to commit, commit them, and Push to Github

## Edit

Git tracks _all_ changes to files inside a repository.

## Stage
<img src="Week_03_Git_assets/Stage.png" alt="alt text" width="75%">

Select which changed  files (added, deleted, or edited) you want to commit.

## Commit
<img src="Week_03_Git_assets/Commit.png" alt="alt text" width="100%">

Add a _commit message_ and click commit.

## Sync (`push`)
<img src="Week_03_Git_assets/Push.png" alt="alt text" width="100%">

Click the green arrow to sync with GitHub.

## Do's and don'ts

* **DO** only commit text files (like `*.R` scripts) and possibly very small datasets
* **DO NOT** commit large or non-text files (like `*.ppt`) especially if they will change often (git has 100MB maximum)
* **DO** use `.gitignore` to ignore certain files and filetypes
* **DO NOT** move files around after starting the course repository
* **DO NOT** edit/move the `.git` or `tests` folder

## And much more!

Git has many, many more features...

RStudio GUI has limited functionality.  

<img src="Week_03_Git_assets/CommandLine.png" alt="alt text" width="75%">


## Git help

```{}
$ git help <verb>
$ git <verb> --help
$ man git-<verb>
```
For example, you can get the manpage help for the config command by running `git help config`

## Git status
<img src="Week_03_Git_assets/GitCL.png" alt="alt text" width="75%">

Similar to info in git tab in RStudio

## Git config
`git config` shows you all the git configuration settings:

* `user.email`
* `remote.origin.url`  (e.g. to connect to GitHub)

## Branching
Branches used to develop features isolated from each other. 
<img src="Week_03_Git_assets/merge.png" alt="alt text" width="100%">

Default: _master_ branch. Use other branches for development/collaboration and merge them back upon completion.

## Basic Branching

```{}
$ git checkout -b devel   # create new branch and switch to it


$ git checkout master  #switch back to master
$ git merge devel  #merge in changes from devel branch
```
But we won't do much with branching in this course...

## Git can do far more!

Check out the (free) book [ProGIT](https://git-scm.com/book/en/v2)

<img src="Week_03_Git_assets/progit2.png" alt="alt text" width="30%">


Or the [cheatsheet](https://training.github.com/kit/downloads/github-git-cheat-sheet.pdf).


## Colophon

<small> Slides adapted from Dr. Çetinkaya-Rundel and [Ben Marwick's presentation to the UW Center for Statistics and Social Sciences (12 March 2014)](https://github.com/benmarwick/CSSS-Primer-Reproducible-Research) ([OrcID](http://orcid.org/0000-0001-7879-4531)) </small>


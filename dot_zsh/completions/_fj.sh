#compdef fj

autoload -U is-at-least

_fj() {
    typeset -A opt_args
    typeset -a _arguments_options
    local ret=1

    if is-at-least 5.2; then
        _arguments_options=(-s -S -C)
    else
        _arguments_options=(-s -C)
    fi

    local context curcontext="$curcontext" state line
    _arguments "${_arguments_options[@]}" : \
'-H+[]:HOST:_default' \
'--host=[]:HOST:_default' \
'--style=[]:STYLE:((fancy\:"Use special characters, and colors"
minimal\:"No special characters and no colors. Always used in non-terminal contexts (i.e. pipes)"))' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
":: :_fj_commands" \
"*::: :->forgejo-cli" \
&& ret=0
    case $state in
    (forgejo-cli)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-command-$line[1]:"
        case $line[1] in
            (repo)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
":: :_fj__subcmd__repo_commands" \
"*::: :->repo" \
&& ret=0

    case $state in
    (repo)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-repo-command-$line[1]:"
        case $line[1] in
            (create)
_arguments "${_arguments_options[@]}" : \
'-d+[]:DESCRIPTION:_default' \
'--description=[]:DESCRIPTION:_default' \
'-r+[Creates a new remote with the given name for the new repo]:REMOTE:_default' \
'--remote=[Creates a new remote with the given name for the new repo]:REMOTE:_default' \
'-S+[Use SSH for the new remote instead of HTTP(S)]::SSH:(true false)' \
'--ssh=[Use SSH for the new remote instead of HTTP(S)]::SSH:(true false)' \
'-P[]' \
'--private[]' \
'-p[Pushes the current branch to the default branch on the new repo. Implies \`--remote=origin\` (setting remote manually overrides this)]' \
'--push[Pushes the current branch to the default branch on the new repo. Implies \`--remote=origin\` (setting remote manually overrides this)]' \
'-h[Print help]' \
'--help[Print help]' \
':repo:_default' \
&& ret=0
;;
(fork)
_arguments "${_arguments_options[@]}" : \
'--name=[]:NAME:_default' \
'-R+[]:REMOTE:_default' \
'--remote=[]:REMOTE:_default' \
'-h[Print help]' \
'--help[Print help]' \
':repo:_default' \
&& ret=0
;;
(migrate)
_arguments "${_arguments_options[@]}" : \
'-i+[Comma-separated list of items to include. Defaults to nothing but git data]:INCLUDE:_default' \
'--include=[Comma-separated list of items to include. Defaults to nothing but git data]:INCLUDE:_default' \
'-L+[The URL to fetch LFS files from]:LFS_ENDPOINT:_default' \
'--lfs-endpoint=[The URL to fetch LFS files from]:LFS_ENDPOINT:_default' \
'-s+[The type of Git service the original repo is on. Defaults to \`git\`]:SERVICE:(git github gitlab forgejo gitea gogs onedev gitbucket codebase)' \
'--service=[The type of Git service the original repo is on. Defaults to \`git\`]:SERVICE:(git github gitlab forgejo gitea gogs onedev gitbucket codebase)' \
'-m[Whether to mirror the repo instead of migrating it]' \
'--mirror[Whether to mirror the repo instead of migrating it]' \
'-p[Whether the new migration should be private]' \
'--private[Whether the new migration should be private]' \
'-t[If enabled, will read an access token in from stdin to use for fetching]' \
'--token[If enabled, will read an access token in from stdin to use for fetching]' \
'-l[If enabled, will read a username and password from stdin to use for fetching]' \
'--login[If enabled, will read a username and password from stdin to use for fetching]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':repo -- URL of the repo to migrate:_default' \
':[OWNER]/NAME -- Name of the new mirror, and optionally which org/user should own it:_default' \
&& ret=0
;;
(view)
_arguments "${_arguments_options[@]}" : \
'-R+[]:REMOTE:_default' \
'--remote=[]:REMOTE:_default' \
'-h[Print help]' \
'--help[Print help]' \
'::name:_default' \
&& ret=0
;;
(readme)
_arguments "${_arguments_options[@]}" : \
'-R+[]:REMOTE:_default' \
'--remote=[]:REMOTE:_default' \
'-h[Print help]' \
'--help[Print help]' \
'::name:_default' \
&& ret=0
;;
(clone)
_arguments "${_arguments_options[@]}" : \
'-S+[Clone the repo over SSH instead of HTTP(S)]::SSH:(true false)' \
'--ssh=[Clone the repo over SSH instead of HTTP(S)]::SSH:(true false)' \
'-I+[An SSH key file to use when cloning over SSH]:IDENTITY_FILE:_files' \
'--identity-file=[An SSH key file to use when cloning over SSH]:IDENTITY_FILE:_files' \
'-h[Print help]' \
'--help[Print help]' \
':repo:_default' \
'::path:_files' \
&& ret=0
;;
(star)
_arguments "${_arguments_options[@]}" : \
'-R+[]:REMOTE:_default' \
'--remote=[]:REMOTE:_default' \
'-h[Print help]' \
'--help[Print help]' \
'::repo:_default' \
&& ret=0
;;
(unstar)
_arguments "${_arguments_options[@]}" : \
'-R+[]:REMOTE:_default' \
'--remote=[]:REMOTE:_default' \
'-h[Print help]' \
'--help[Print help]' \
'::repo:_default' \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':repo:_default' \
&& ret=0
;;
(browse)
_arguments "${_arguments_options[@]}" : \
'-R+[]:REMOTE:_default' \
'--remote=[]:REMOTE:_default' \
'-h[Print help]' \
'--help[Print help]' \
'::name:_default' \
&& ret=0
;;
(labels)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
'::repo:_default' \
":: :_fj__subcmd__repo__subcmd__labels_commands" \
"*::: :->labels" \
&& ret=0

    case $state in
    (labels)
        words=($line[2] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-repo-labels-command-$line[2]:"
        case $line[2] in
            (view)
_arguments "${_arguments_options[@]}" : \
'-a[Show archived labels]' \
'--archived[Show archived labels]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(create)
_arguments "${_arguments_options[@]}" : \
'-d+[A description for the new label. If no argument is given, open the editor]::DESCRIPTION:_default' \
'--description=[A description for the new label. If no argument is given, open the editor]::DESCRIPTION:_default' \
'-e[Make this label exclusive with other labels in the same namespace]' \
'--exclusive[Make this label exclusive with other labels in the same namespace]' \
'-a[Create an archived label]' \
'--archived[Create an archived label]' \
'-h[Print help]' \
'--help[Print help]' \
':name -- Name of the new label. You may include a '\''/'\'' here to namespace the label:_default' \
':color -- Color of the new label in hexadecimal format:_default' \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
':id -- The ID or name of the label to delete:_default' \
&& ret=0
;;
(edit)
_arguments "${_arguments_options[@]}" : \
'-n+[New name for the label]:NAME:_default' \
'--name=[New name for the label]:NAME:_default' \
'-c+[New color for the label]:COLOR:_default' \
'--color=[New color for the label]:COLOR:_default' \
'-d+[New description for the label. If no argument is given, open the editor]::DESCRIPTION:_default' \
'--description=[New description for the label. If no argument is given, open the editor]::DESCRIPTION:_default' \
'-e+[New exclusive status]:EXCLUSIVE:(true false)' \
'--exclusive=[New exclusive status]:EXCLUSIVE:(true false)' \
'-a+[New archived status]:ARCHIVED:(true false)' \
'--archived=[New archived status]:ARCHIVED:(true false)' \
'-h[Print help]' \
'--help[Print help]' \
':id -- The ID or name of the label to edit:_default' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__repo__subcmd__labels__subcmd__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-repo-labels-help-command-$line[1]:"
        case $line[1] in
            (view)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(create)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(edit)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(edit)
_arguments "${_arguments_options[@]}" : \
'-a+[Archive or unarchive]:ARCHIVED:(true false)' \
'--archived=[Archive or unarchive]:ARCHIVED:(true false)' \
'--default-branch=[Set the default branch]:DEFAULT_BRANCH:_default' \
'-d+[Set the description]:DESCRIPTION:_default' \
'--description=[Set the description]:DESCRIPTION:_default' \
'--enable-prune=[Remove obsolete remote-tracking references when mirroring]:ENABLE_PRUNE:(true false)' \
'--mirror-interval=[Set the interval for push mirrors. Use a string like 8h30m0s]:MIRROR_INTERVAL:_default' \
'--name=[Set the repo'\''s name]:NAME:_default' \
'-p+[Set this repository'\''s private status]:PRIVATE:(true false)' \
'--private=[Set this repository'\''s private status]:PRIVATE:(true false)' \
'-t+[Set if this repository should be a template repository]:TEMPLATE:(true false)' \
'--template=[Set if this repository should be a template repository]:TEMPLATE:(true false)' \
'-w+[Set a URL for this repository'\''s website]:WEBSITE:_default' \
'--website=[Set a URL for this repository'\''s website]:WEBSITE:_default' \
'-h[Print help]' \
'--help[Print help]' \
'::repo:_default' \
&& ret=0
;;
(units)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
'::repo:_default' \
":: :_fj__subcmd__repo__subcmd__units_commands" \
"*::: :->units" \
&& ret=0

    case $state in
    (units)
        words=($line[2] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-repo-units-command-$line[2]:"
        case $line[2] in
            (issues)
_arguments "${_arguments_options[@]}" : \
'-e+[Enable or disable issues]:ENABLE:(true false)' \
'--enable=[Enable or disable issues]:ENABLE:(true false)' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(prs)
_arguments "${_arguments_options[@]}" : \
'-e+[Enable or disable pull requests]:ENABLE:(true false)' \
'--enable=[Enable or disable pull requests]:ENABLE:(true false)' \
'--allow-fast-forward-only-merge=[Allow fast-forward only merging]:ALLOW_FAST_FORWARD_ONLY_MERGE:(true false)' \
'--allow-manual-merge=[Allow manual merging]:ALLOW_MANUAL_MERGE:(true false)' \
'--allow-merge-commits=[Allow merge commits]:ALLOW_MERGE_COMMITS:(true false)' \
'--allow-rebase=[Allow rebase merging]:ALLOW_REBASE:(true false)' \
'--allow-rebase-explicit=[Allow rebase merging with explicit merge commits]:ALLOW_REBASE_EXPLICIT:(true false)' \
'--allow-rebase-update=[Allow updating PR branches by rebase]:ALLOW_REBASE_UPDATE:(true false)' \
'--allow-squash-merge=[Allow squash merging]:ALLOW_SQUASH_MERGE:(true false)' \
'--autodetect-manual-merge=[Automatically detect manual merges]:AUTODETECT_MANUAL_MERGE:(true false)' \
'--default-allow-maintainer-edit=[Allow maintainer edits by default]:DEFAULT_ALLOW_MAINTAINER_EDIT:(true false)' \
'--default-delete-branch-after-merge=[Delete branch after merge by default]:DEFAULT_DELETE_BRANCH_AFTER_MERGE:(true false)' \
'--default-merge-style=[Default merge style]:DEFAULT_MERGE_STYLE:(merge rebase rebase-merge squash fast-forward-only)' \
'--default-update-style=[Default update style]:DEFAULT_UPDATE_STYLE:(rebase merge)' \
'--ignore-whitespace-conflicts=[Ignore whitespace merge conflicts]:IGNORE_WHITESPACE_CONFLICTS:(true false)' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(actions)
_arguments "${_arguments_options[@]}" : \
'-e+[Enable or disable actions]:ENABLE:(true false)' \
'--enable=[Enable or disable actions]:ENABLE:(true false)' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(wiki)
_arguments "${_arguments_options[@]}" : \
'-e+[Enable or disable the wiki]:ENABLE:(true false)' \
'--enable=[Enable or disable the wiki]:ENABLE:(true false)' \
'--branch=[Set the branch used for the wiki]:BRANCH:_default' \
'--external-url=[Set the URL for an external wiki. If no URL is given, the external wiki is instead disabled]:EXTERNAL_URL:_default' \
'--globally-editable=[Set the globally editable state of the wiki]:GLOBALLY_EDITABLE:(true false)' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(packages)
_arguments "${_arguments_options[@]}" : \
'-e+[Enable or disable the package registry]:ENABLE:(true false)' \
'--enable=[Enable or disable the package registry]:ENABLE:(true false)' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(projects)
_arguments "${_arguments_options[@]}" : \
'-e+[Enable or disable the project board]:ENABLE:(true false)' \
'--enable=[Enable or disable the project board]:ENABLE:(true false)' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(releases)
_arguments "${_arguments_options[@]}" : \
'-e+[Enable or disable the releases unit]:ENABLE:(true false)' \
'--enable=[Enable or disable the releases unit]:ENABLE:(true false)' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__repo__subcmd__units__subcmd__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-repo-units-help-command-$line[1]:"
        case $line[1] in
            (issues)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(prs)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(actions)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(wiki)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(packages)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(projects)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(releases)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__repo__subcmd__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-repo-help-command-$line[1]:"
        case $line[1] in
            (create)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(fork)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(migrate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(view)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(readme)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(clone)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(star)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(unstar)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(browse)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(labels)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__repo__subcmd__help__subcmd__labels_commands" \
"*::: :->labels" \
&& ret=0

    case $state in
    (labels)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-repo-help-labels-command-$line[1]:"
        case $line[1] in
            (view)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(create)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(edit)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(edit)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(units)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__repo__subcmd__help__subcmd__units_commands" \
"*::: :->units" \
&& ret=0

    case $state in
    (units)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-repo-help-units-command-$line[1]:"
        case $line[1] in
            (issues)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(prs)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(actions)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(wiki)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(packages)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(projects)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(releases)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(issue)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-h[Print help]' \
'--help[Print help]' \
":: :_fj__subcmd__issue_commands" \
"*::: :->issue" \
&& ret=0

    case $state in
    (issue)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-issue-command-$line[1]:"
        case $line[1] in
            (create)
_arguments "${_arguments_options[@]}" : \
'(--template)--body=[The text body of the issue]:BODY:_default' \
'(--body)--body-file=[The text body of the issue, to read from a file]:BODY_FILE:_files' \
'--template=[The template to use when creating an issue]:TEMPLATE:_default' \
'-r+[The repo to create this issue on]:REPO:_default' \
'--repo=[The repo to create this issue on]:REPO:_default' \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'(--template)--no-template[Don'\''t use a template for this issue]' \
'--web[Open the issue creation page in your web browser]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'::title -- Title of the issue:_default' \
&& ret=0
;;
(edit)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-h[Print help]' \
'--help[Print help]' \
':issue:_default' \
":: :_fj__subcmd__issue__subcmd__edit_commands" \
"*::: :->edit" \
&& ret=0

    case $state in
    (edit)
        words=($line[2] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-issue-edit-command-$line[2]:"
        case $line[2] in
            (title)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-h[Print help]' \
'--help[Print help]' \
'::new_title:_default' \
&& ret=0
;;
(body)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-h[Print help]' \
'--help[Print help]' \
'::new_body:_default' \
&& ret=0
;;
(comment)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-h[Print help]' \
'--help[Print help]' \
':idx:_default' \
'::new_body:_default' \
&& ret=0
;;
(labels)
_arguments "${_arguments_options[@]}" : \
'*-a+[The labels to add]:ADD:_default' \
'*--add=[The labels to add]:ADD:_default' \
'*-r+[The labels to remove]:RM:_default' \
'*--rm=[The labels to remove]:RM:_default' \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__issue__subcmd__edit__subcmd__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-issue-edit-help-command-$line[1]:"
        case $line[1] in
            (title)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(body)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(comment)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(labels)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(comment)
_arguments "${_arguments_options[@]}" : \
'()--body-file=[The text content of the comment, to read from a file]:BODY_FILE:_files' \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':issue:_default' \
'::body -- The text content of the comment:_default' \
&& ret=0
;;
(assign)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-h[Print help]' \
'--help[Print help]' \
':issue:_default' \
'*::users -- The usernames of the users to assign to this issue:_default' \
&& ret=0
;;
(unassign)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-h[Print help]' \
'--help[Print help]' \
':issue:_default' \
'*::users -- The usernames of the users to unassign from this issue:_default' \
&& ret=0
;;
(close)
_arguments "${_arguments_options[@]}" : \
'-w+[A comment to leave on the issue before closing it]::WITH_MSG:_default' \
'--with-msg=[A comment to leave on the issue before closing it]::WITH_MSG:_default' \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-h[Print help]' \
'--help[Print help]' \
':issue:_default' \
&& ret=0
;;
(search)
_arguments "${_arguments_options[@]}" : \
'-r+[The repo to search in]:REPO:_default' \
'--repo=[The repo to search in]:REPO:_default' \
'-l+[]:LABELS:_default' \
'--labels=[]:LABELS:_default' \
'-c+[]:CREATOR:_default' \
'--creator=[]:CREATOR:_default' \
'-a+[]:ASSIGNEE:_default' \
'--assignee=[]:ASSIGNEE:_default' \
'-s+[Filter issues by state. Default\: open]:STATE:(open closed all)' \
'--state=[Filter issues by state. Default\: open]:STATE:(open closed all)' \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-h[Print help]' \
'--help[Print help]' \
'::query:_default' \
&& ret=0
;;
(view)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-h[Print help]' \
'--help[Print help]' \
':id:_default' \
":: :_fj__subcmd__issue__subcmd__view_commands" \
"*::: :->view" \
&& ret=0

    case $state in
    (view)
        words=($line[2] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-issue-view-command-$line[2]:"
        case $line[2] in
            (body)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(comment)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-h[Print help]' \
'--help[Print help]' \
':idx:_default' \
&& ret=0
;;
(comments)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__issue__subcmd__view__subcmd__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-issue-view-help-command-$line[1]:"
        case $line[1] in
            (body)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(comment)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(comments)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(templates)
_arguments "${_arguments_options[@]}" : \
'-r+[The repo to view the templates of]:REPO:_default' \
'--repo=[The repo to view the templates of]:REPO:_default' \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(browse)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-h[Print help]' \
'--help[Print help]' \
':id:_default' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__issue__subcmd__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-issue-help-command-$line[1]:"
        case $line[1] in
            (create)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(edit)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__issue__subcmd__help__subcmd__edit_commands" \
"*::: :->edit" \
&& ret=0

    case $state in
    (edit)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-issue-help-edit-command-$line[1]:"
        case $line[1] in
            (title)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(body)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(comment)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(labels)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(comment)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(assign)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(unassign)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(close)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(search)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(view)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__issue__subcmd__help__subcmd__view_commands" \
"*::: :->view" \
&& ret=0

    case $state in
    (view)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-issue-help-view-command-$line[1]:"
        case $line[1] in
            (body)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(comment)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(comments)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(templates)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(browse)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(pr)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-h[Print help]' \
'--help[Print help]' \
":: :_fj__subcmd__pr_commands" \
"*::: :->pr" \
&& ret=0

    case $state in
    (pr)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-pr-command-$line[1]:"
        case $line[1] in
            (search)
_arguments "${_arguments_options[@]}" : \
'-l+[]:LABELS:_default' \
'--labels=[]:LABELS:_default' \
'-c+[]:CREATOR:_default' \
'--creator=[]:CREATOR:_default' \
'-a+[]:ASSIGNEE:_default' \
'--assignee=[]:ASSIGNEE:_default' \
'-s+[Filter PRs by state. Default\: open]:STATE:(open closed all)' \
'--state=[Filter PRs by state. Default\: open]:STATE:(open closed all)' \
'-r+[The repo to search in]:REPO:_default' \
'--repo=[The repo to search in]:REPO:_default' \
'-h[Print help]' \
'--help[Print help]' \
'::query:_default' \
&& ret=0
;;
(create)
_arguments "${_arguments_options[@]}" : \
'--base=[The branch to merge onto]:BASE:_default' \
'--head=[The branch to pull changes from]:HEAD:_default' \
'--body=[The text body of the pull request]:BODY:_default' \
'(--body)--body-file=[The text body of the issue, to read from a file]:BODY_FILE:_files' \
'-r+[The repo to create this pull request on]:REPO:_default' \
'--repo=[The repo to create this pull request on]:REPO:_default' \
'-A[Automatically populate the PR'\''s title and body from its commits]' \
'--autofill[Automatically populate the PR'\''s title and body from its commits]' \
'-w[Open the PR creation page in your web browser]' \
'--web[Open the PR creation page in your web browser]' \
'-a[Open the PR using AGit workflow]' \
'--agit[Open the PR using AGit workflow]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'::title -- What to name the new pull request:_default' \
&& ret=0
;;
(view)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
'::id -- The pull request to view:_default' \
":: :_fj__subcmd__pr__subcmd__view_commands" \
"*::: :->view" \
&& ret=0

    case $state in
    (view)
        words=($line[2] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-pr-view-command-$line[2]:"
        case $line[2] in
            (body)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(comment)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
':idx -- The index of the comment to view, 0-indexed:_default' \
&& ret=0
;;
(comments)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(labels)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(diff)
_arguments "${_arguments_options[@]}" : \
'-p[Get the diff in patch format]' \
'--patch[Get the diff in patch format]' \
'-e[View the diff in your text editor]' \
'--editor[View the diff in your text editor]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(files)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(commits)
_arguments "${_arguments_options[@]}" : \
'-o[View one commit per line]' \
'--oneline[View one commit per line]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__pr__subcmd__view__subcmd__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-pr-view-help-command-$line[1]:"
        case $line[1] in
            (body)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(comment)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(comments)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(labels)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(diff)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(files)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(commits)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(status)
_arguments "${_arguments_options[@]}" : \
'--wait[Wait for all checks to finish before exiting]' \
'-h[Print help]' \
'--help[Print help]' \
'::id -- The pull request to view:_default' \
&& ret=0
;;
(checkout)
_arguments "${_arguments_options[@]}" : \
'--branch-name=[The name to give the newly created branch]:NAME:_default' \
'-S+[Pull the commits using SSH instead of HTTP(S)]::SSH:(true false)' \
'--ssh=[Pull the commits using SSH instead of HTTP(S)]::SSH:(true false)' \
'-I+[An SSH key file to use when cloning over SSH]:IDENTITY_FILE:_files' \
'--identity-file=[An SSH key file to use when cloning over SSH]:IDENTITY_FILE:_files' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':ID -- The pull request to check out:_default' \
&& ret=0
;;
(comment)
_arguments "${_arguments_options[@]}" : \
'()--body-file=[The text content of the comment, to read from a file]:BODY_FILE:_files' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'::pr -- The pull request to comment on:_default' \
'::body -- The text content of the comment:_default' \
&& ret=0
;;
(assign)
_arguments "${_arguments_options[@]}" : \
'-p+[]:PR:_default' \
'--pr=[]:PR:_default' \
'-h[Print help]' \
'--help[Print help]' \
'*::users -- The usernames of the users to assign to this PR:_default' \
&& ret=0
;;
(unassign)
_arguments "${_arguments_options[@]}" : \
'-p+[]:PR:_default' \
'--pr=[]:PR:_default' \
'-h[Print help]' \
'--help[Print help]' \
'*::users -- The usernames of the users to unassign from this PR:_default' \
&& ret=0
;;
(edit)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
'::pr -- The pull request to edit:_default' \
":: :_fj__subcmd__pr__subcmd__edit_commands" \
"*::: :->edit" \
&& ret=0

    case $state in
    (edit)
        words=($line[2] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-pr-edit-command-$line[2]:"
        case $line[2] in
            (title)
_arguments "${_arguments_options[@]}" : \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'::new_title -- New PR title:_default' \
&& ret=0
;;
(body)
_arguments "${_arguments_options[@]}" : \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'::new_body -- New PR body:_default' \
&& ret=0
;;
(comment)
_arguments "${_arguments_options[@]}" : \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':idx -- The index of the comment to edit, 0-indexed:_default' \
'::new_body -- New comment body:_default' \
&& ret=0
;;
(labels)
_arguments "${_arguments_options[@]}" : \
'*-a+[The labels to add]:ADD:_default' \
'*--add=[The labels to add]:ADD:_default' \
'*-r+[The labels to remove]:RM:_default' \
'*--rm=[The labels to remove]:RM:_default' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__pr__subcmd__edit__subcmd__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-pr-edit-help-command-$line[1]:"
        case $line[1] in
            (title)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(body)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(comment)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(labels)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(close)
_arguments "${_arguments_options[@]}" : \
'-w+[A comment to add before closing]::WITH_MSG:_default' \
'--with-msg=[A comment to add before closing]::WITH_MSG:_default' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'::pr -- The pull request to close:_default' \
&& ret=0
;;
(merge)
_arguments "${_arguments_options[@]}" : \
'-M+[The merge style to use]:METHOD:(merge rebase rebase-merge squash manual)' \
'--method=[The merge style to use]:METHOD:(merge rebase rebase-merge squash manual)' \
'-t+[The title of the merge or squash commit to be created]:TITLE:_default' \
'--title=[The title of the merge or squash commit to be created]:TITLE:_default' \
'-m+[The body of the merge or squash commit to be created]::MESSAGE:_default' \
'--message=[The body of the merge or squash commit to be created]::MESSAGE:_default' \
'-d[Option to delete the corresponding branch afterwards]' \
'--delete[Option to delete the corresponding branch afterwards]' \
'-h[Print help]' \
'--help[Print help]' \
'::pr -- The pull request to merge:_default' \
&& ret=0
;;
(browse)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
'::id -- The pull request to open in your browser:_default' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__pr__subcmd__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-pr-help-command-$line[1]:"
        case $line[1] in
            (search)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(create)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(view)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__pr__subcmd__help__subcmd__view_commands" \
"*::: :->view" \
&& ret=0

    case $state in
    (view)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-pr-help-view-command-$line[1]:"
        case $line[1] in
            (body)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(comment)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(comments)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(labels)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(diff)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(files)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(commits)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(status)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(checkout)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(comment)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(assign)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(unassign)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(edit)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__pr__subcmd__help__subcmd__edit_commands" \
"*::: :->edit" \
&& ret=0

    case $state in
    (edit)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-pr-help-edit-command-$line[1]:"
        case $line[1] in
            (title)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(body)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(comment)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(labels)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(close)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(merge)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(browse)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(wiki)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-r+[The repo to operate on]:REPO:_default' \
'--repo=[The repo to operate on]:REPO:_default' \
'-h[Print help]' \
'--help[Print help]' \
":: :_fj__subcmd__wiki_commands" \
"*::: :->wiki" \
&& ret=0

    case $state in
    (wiki)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-wiki-command-$line[1]:"
        case $line[1] in
            (contents)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-r+[The repo to operate on]:REPO:_default' \
'--repo=[The repo to operate on]:REPO:_default' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(view)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-r+[The repo to operate on]:REPO:_default' \
'--repo=[The repo to operate on]:REPO:_default' \
'-h[Print help]' \
'--help[Print help]' \
':page:_default' \
&& ret=0
;;
(clone)
_arguments "${_arguments_options[@]}" : \
'-p+[]:PATH:_files' \
'--path=[]:PATH:_files' \
'-S+[Clone the repo over SSH instead of HTTP(S)]::SSH:(true false)' \
'--ssh=[Clone the repo over SSH instead of HTTP(S)]::SSH:(true false)' \
'-I+[An SSH key file to use when cloning over SSH]:IDENTITY_FILE:_files' \
'--identity-file=[An SSH key file to use when cloning over SSH]:IDENTITY_FILE:_files' \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-r+[The repo to operate on]:REPO:_default' \
'--repo=[The repo to operate on]:REPO:_default' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(browse)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-r+[The repo to operate on]:REPO:_default' \
'--repo=[The repo to operate on]:REPO:_default' \
'-h[Print help]' \
'--help[Print help]' \
':page:_default' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__wiki__subcmd__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-wiki-help-command-$line[1]:"
        case $line[1] in
            (contents)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(view)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(clone)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(browse)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(actions)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-r+[The repo to operate on]:REPO:_default' \
'--repo=[The repo to operate on]:REPO:_default' \
'-h[Print help]' \
'--help[Print help]' \
":: :_fj__subcmd__actions_commands" \
"*::: :->actions" \
&& ret=0

    case $state in
    (actions)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-actions-command-$line[1]:"
        case $line[1] in
            (tasks)
_arguments "${_arguments_options[@]}" : \
'-p+[The page to show. One page always includes up to 20 tasks]:PAGE:_default' \
'--page=[The page to show. One page always includes up to 20 tasks]:PAGE:_default' \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-r+[The repo to operate on]:REPO:_default' \
'--repo=[The repo to operate on]:REPO:_default' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(variables)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-r+[The repo to operate on]:REPO:_default' \
'--repo=[The repo to operate on]:REPO:_default' \
'-h[Print help]' \
'--help[Print help]' \
":: :_fj__subcmd__actions__subcmd__variables_commands" \
"*::: :->variables" \
&& ret=0

    case $state in
    (variables)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-actions-variables-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-r+[The repo to operate on]:REPO:_default' \
'--repo=[The repo to operate on]:REPO:_default' \
'-v[Also print owner_id and repo_id]' \
'--verbose[Also print owner_id and repo_id]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(create)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-r+[The repo to operate on]:REPO:_default' \
'--repo=[The repo to operate on]:REPO:_default' \
'-f[Override existing variables]' \
'--force[Override existing variables]' \
'-h[Print help]' \
'--help[Print help]' \
':name -- The name of the new variable:_default' \
'::data -- The data to save into the variable. Omit to invoke editor:_default' \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-r+[The repo to operate on]:REPO:_default' \
'--repo=[The repo to operate on]:REPO:_default' \
'-h[Print help]' \
'--help[Print help]' \
':name -- The variable to delete:_default' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__actions__subcmd__variables__subcmd__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-actions-variables-help-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(create)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(secrets)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-r+[The repo to operate on]:REPO:_default' \
'--repo=[The repo to operate on]:REPO:_default' \
'-h[Print help]' \
'--help[Print help]' \
":: :_fj__subcmd__actions__subcmd__secrets_commands" \
"*::: :->secrets" \
&& ret=0

    case $state in
    (secrets)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-actions-secrets-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-r+[The repo to operate on]:REPO:_default' \
'--repo=[The repo to operate on]:REPO:_default' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(create)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-r+[The repo to operate on]:REPO:_default' \
'--repo=[The repo to operate on]:REPO:_default' \
'-h[Print help]' \
'--help[Print help]' \
':name -- The name of the new secret:_default' \
':data -- The data to save into the secret:_default' \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-r+[The repo to operate on]:REPO:_default' \
'--repo=[The repo to operate on]:REPO:_default' \
'-h[Print help]' \
'--help[Print help]' \
':name -- The secret to delete:_default' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__actions__subcmd__secrets__subcmd__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-actions-secrets-help-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(create)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(dispatch)
_arguments "${_arguments_options[@]}" : \
'*-I+[]:INPUTS:_default' \
'*--inputs=[]:INPUTS:_default' \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-r+[The repo to operate on]:REPO:_default' \
'--repo=[The repo to operate on]:REPO:_default' \
'-h[Print help]' \
'--help[Print help]' \
':name -- Name of the workflow to dispatch:_default' \
':ref -- Git revision to dispatch the workflow on:_default' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__actions__subcmd__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-actions-help-command-$line[1]:"
        case $line[1] in
            (tasks)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(variables)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__actions__subcmd__help__subcmd__variables_commands" \
"*::: :->variables" \
&& ret=0

    case $state in
    (variables)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-actions-help-variables-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(create)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(secrets)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__actions__subcmd__help__subcmd__secrets_commands" \
"*::: :->secrets" \
&& ret=0

    case $state in
    (secrets)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-actions-help-secrets-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(create)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(dispatch)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(whoami)
_arguments "${_arguments_options[@]}" : \
'-r+[]:REMOTE:_default' \
'--remote=[]:REMOTE:_default' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(auth)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
":: :_fj__subcmd__auth_commands" \
"*::: :->auth" \
&& ret=0

    case $state in
    (auth)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-auth-command-$line[1]:"
        case $line[1] in
            (login)
_arguments "${_arguments_options[@]}" : \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(logout)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
':host:_default' \
&& ret=0
;;
(add-key)
_arguments "${_arguments_options[@]}" : \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':user -- The user that the key is associated with:_default' \
'::key -- The key to add. If not present, the key will be read in from stdin:_default' \
&& ret=0
;;
(use-ssh)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
'::use_ssh:(true false)' \
&& ret=0
;;
(list)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__auth__subcmd__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-auth-help-command-$line[1]:"
        case $line[1] in
            (login)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(logout)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add-key)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(use-ssh)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(release)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-r+[The name of the repository to operate on]:REPO:_default' \
'--repo=[The name of the repository to operate on]:REPO:_default' \
'-h[Print help]' \
'--help[Print help]' \
":: :_fj__subcmd__release_commands" \
"*::: :->release" \
&& ret=0

    case $state in
    (release)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-release-command-$line[1]:"
        case $line[1] in
            (create)
_arguments "${_arguments_options[@]}" : \
'-T+[Create a new cooresponding tag for this release. Defaults to release'\''s name]::CREATE_TAG:_default' \
'--create-tag=[Create a new cooresponding tag for this release. Defaults to release'\''s name]::CREATE_TAG:_default' \
'-t+[Pre-existing tag to use]:TAG:_default' \
'--tag=[Pre-existing tag to use]:TAG:_default' \
'*-a+[Include a file as an attachment]:ATTACH:_default' \
'*--attach=[Include a file as an attachment]:ATTACH:_default' \
'-b+[Text of the release body]::BODY:_default' \
'--body=[Text of the release body]::BODY:_default' \
'-B+[]:BRANCH:_default' \
'--branch=[]:BRANCH:_default' \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-r+[The name of the repository to operate on]:REPO:_default' \
'--repo=[The name of the repository to operate on]:REPO:_default' \
'-d[]' \
'--draft[]' \
'-p[]' \
'--prerelease[]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':name:_default' \
&& ret=0
;;
(edit)
_arguments "${_arguments_options[@]}" : \
'-n+[]:RENAME:_default' \
'--rename=[]:RENAME:_default' \
'-t+[Corresponding tag for this release]:TAG:_default' \
'--tag=[Corresponding tag for this release]:TAG:_default' \
'-b+[Text of the release body]::BODY:_default' \
'--body=[Text of the release body]::BODY:_default' \
'-d+[]:DRAFT:(true false)' \
'--draft=[]:DRAFT:(true false)' \
'-p+[]:PRERELEASE:(true false)' \
'--prerelease=[]:PRERELEASE:(true false)' \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-r+[The name of the repository to operate on]:REPO:_default' \
'--repo=[The name of the repository to operate on]:REPO:_default' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':name:_default' \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-r+[The name of the repository to operate on]:REPO:_default' \
'--repo=[The name of the repository to operate on]:REPO:_default' \
'-t[]' \
'--by-tag[]' \
'-h[Print help]' \
'--help[Print help]' \
':name:_default' \
&& ret=0
;;
(list)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-r+[The name of the repository to operate on]:REPO:_default' \
'--repo=[The name of the repository to operate on]:REPO:_default' \
'-p[]' \
'--include-prerelease[]' \
'-d[]' \
'--include-draft[]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(view)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-r+[The name of the repository to operate on]:REPO:_default' \
'--repo=[The name of the repository to operate on]:REPO:_default' \
'-t[]' \
'--by-tag[]' \
'-h[Print help]' \
'--help[Print help]' \
':name:_default' \
&& ret=0
;;
(browse)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-r+[The name of the repository to operate on]:REPO:_default' \
'--repo=[The name of the repository to operate on]:REPO:_default' \
'-h[Print help]' \
'--help[Print help]' \
'::name:_default' \
&& ret=0
;;
(asset)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-r+[The name of the repository to operate on]:REPO:_default' \
'--repo=[The name of the repository to operate on]:REPO:_default' \
'-h[Print help]' \
'--help[Print help]' \
":: :_fj__subcmd__release__subcmd__asset_commands" \
"*::: :->asset" \
&& ret=0

    case $state in
    (asset)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-release-asset-command-$line[1]:"
        case $line[1] in
            (create)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-r+[The name of the repository to operate on]:REPO:_default' \
'--repo=[The name of the repository to operate on]:REPO:_default' \
'-h[Print help]' \
'--help[Print help]' \
':release:_default' \
':path:_files' \
'::name:_default' \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-r+[The name of the repository to operate on]:REPO:_default' \
'--repo=[The name of the repository to operate on]:REPO:_default' \
'-h[Print help]' \
'--help[Print help]' \
':release:_default' \
':asset:_default' \
&& ret=0
;;
(download)
_arguments "${_arguments_options[@]}" : \
'-o+[]:OUTPUT:_files' \
'--output=[]:OUTPUT:_files' \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-r+[The name of the repository to operate on]:REPO:_default' \
'--repo=[The name of the repository to operate on]:REPO:_default' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':release:_default' \
':asset:_default' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__release__subcmd__asset__subcmd__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-release-asset-help-command-$line[1]:"
        case $line[1] in
            (create)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(download)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__release__subcmd__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-release-help-command-$line[1]:"
        case $line[1] in
            (create)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(edit)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(view)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(browse)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(asset)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__release__subcmd__help__subcmd__asset_commands" \
"*::: :->asset" \
&& ret=0

    case $state in
    (asset)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-release-help-asset-command-$line[1]:"
        case $line[1] in
            (create)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(download)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(tag)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-r+[The name of the repository to operate on]:REPO:_default' \
'--repo=[The name of the repository to operate on]:REPO:_default' \
'-h[Print help]' \
'--help[Print help]' \
":: :_fj__subcmd__tag_commands" \
"*::: :->tag" \
&& ret=0

    case $state in
    (tag)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-tag-command-$line[1]:"
        case $line[1] in
            (create)
_arguments "${_arguments_options[@]}" : \
'-b+[Text of the tag'\''s message]::BODY:_default' \
'--body=[Text of the tag'\''s message]::BODY:_default' \
'-B+[]:BRANCH:_default' \
'--branch=[]:BRANCH:_default' \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-r+[The name of the repository to operate on]:REPO:_default' \
'--repo=[The name of the repository to operate on]:REPO:_default' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':name:_default' \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-r+[The name of the repository to operate on]:REPO:_default' \
'--repo=[The name of the repository to operate on]:REPO:_default' \
'-h[Print help]' \
'--help[Print help]' \
':name:_default' \
&& ret=0
;;
(list)
_arguments "${_arguments_options[@]}" : \
'-p+[]:PAGE:_default' \
'--page=[]:PAGE:_default' \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-r+[The name of the repository to operate on]:REPO:_default' \
'--repo=[The name of the repository to operate on]:REPO:_default' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(view)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-r+[The name of the repository to operate on]:REPO:_default' \
'--repo=[The name of the repository to operate on]:REPO:_default' \
'-h[Print help]' \
'--help[Print help]' \
':name:_default' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__tag__subcmd__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-tag-help-command-$line[1]:"
        case $line[1] in
            (create)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(view)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(user)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-h[Print help]' \
'--help[Print help]' \
":: :_fj__subcmd__user_commands" \
"*::: :->user" \
&& ret=0

    case $state in
    (user)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-user-command-$line[1]:"
        case $line[1] in
            (search)
_arguments "${_arguments_options[@]}" : \
'-p+[]:PAGE:_default' \
'--page=[]:PAGE:_default' \
'-h[Print help]' \
'--help[Print help]' \
':query -- The name to search for:_default' \
&& ret=0
;;
(view)
_arguments "${_arguments_options[@]}" : \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'::user -- The name of the user to view:_default' \
&& ret=0
;;
(browse)
_arguments "${_arguments_options[@]}" : \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'::user -- The name of the user to open in your browser:_default' \
&& ret=0
;;
(follow)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
':user -- The name of the user to follow:_default' \
&& ret=0
;;
(unfollow)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
':user -- The name of the user to follow:_default' \
&& ret=0
;;
(following)
_arguments "${_arguments_options[@]}" : \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'::user -- The name of the user whose follows to list:_default' \
&& ret=0
;;
(followers)
_arguments "${_arguments_options[@]}" : \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'::user -- The name of the user whose followers to list:_default' \
&& ret=0
;;
(block)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
':user -- The name of the user to block:_default' \
&& ret=0
;;
(unblock)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
':user -- The name of the user to unblock:_default' \
&& ret=0
;;
(repos)
_arguments "${_arguments_options[@]}" : \
'--sort=[Method by which to sort the list]:SORT:(name modified created stars forks)' \
'--page=[Page of repos to get]:PAGE:_default' \
'--starred[List starred repos instead of owned repos]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'::user -- The name of the user whose repos to list:_default' \
&& ret=0
;;
(orgs)
_arguments "${_arguments_options[@]}" : \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'::user -- The name of the user to view org membership of:_default' \
&& ret=0
;;
(activity)
_arguments "${_arguments_options[@]}" : \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'::user -- The name of the user to view the activity of:_default' \
&& ret=0
;;
(edit)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
":: :_fj__subcmd__user__subcmd__edit_commands" \
"*::: :->edit" \
&& ret=0

    case $state in
    (edit)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-user-edit-command-$line[1]:"
        case $line[1] in
            (bio)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
'::content -- The new description. Leave this out to open your editor:_default' \
&& ret=0
;;
(name)
_arguments "${_arguments_options[@]}" : \
'-u[Remove your name from your profile]' \
'--unset[Remove your name from your profile]' \
'-h[Print help]' \
'--help[Print help]' \
'::name -- The new name:_default' \
&& ret=0
;;
(pronouns)
_arguments "${_arguments_options[@]}" : \
'-u[Remove your pronouns from your profile]' \
'--unset[Remove your pronouns from your profile]' \
'-h[Print help]' \
'--help[Print help]' \
'::pronouns -- The new pronouns:_default' \
&& ret=0
;;
(location)
_arguments "${_arguments_options[@]}" : \
'-u[Remove your location from your profile]' \
'--unset[Remove your location from your profile]' \
'-h[Print help]' \
'--help[Print help]' \
'::location -- The new location:_default' \
&& ret=0
;;
(activity)
_arguments "${_arguments_options[@]}" : \
'-v+[The visibility of your activity]:VISIBILITY:(hidden public)' \
'--visibility=[The visibility of your activity]:VISIBILITY:(hidden public)' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(email)
_arguments "${_arguments_options[@]}" : \
'-v+[Set the visibility of your email address]:VISIBILITY:(hidden public)' \
'--visibility=[Set the visibility of your email address]:VISIBILITY:(hidden public)' \
'*-a+[Add a new email address]:ADD:_default' \
'*--add=[Add a new email address]:ADD:_default' \
'*-r+[Remove an email address]:RM:_default' \
'*--rm=[Remove an email address]:RM:_default' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(website)
_arguments "${_arguments_options[@]}" : \
'-u[Remove your website from your profile]' \
'--unset[Remove your website from your profile]' \
'-h[Print help]' \
'--help[Print help]' \
'::url -- Your website URL:_default' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__user__subcmd__edit__subcmd__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-user-edit-help-command-$line[1]:"
        case $line[1] in
            (bio)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(name)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(pronouns)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(location)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(activity)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(email)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(website)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(key)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
":: :_fj__subcmd__user__subcmd__key_commands" \
"*::: :->key" \
&& ret=0

    case $state in
    (key)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-user-key-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
'-v[Show detailed information about every key]' \
'--verbose[Show detailed information about every key]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(view)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
':id:_default' \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
':id:_default' \
&& ret=0
;;
(upload)
_arguments "${_arguments_options[@]}" : \
'-t+[The title of the key. If omitted, will try to guess from the file content]:TITLE:_default' \
'--title=[The title of the key. If omitted, will try to guess from the file content]:TITLE:_default' \
'-f[If provided, will skip checks against accidentally uploading private keys]' \
'--force[If provided, will skip checks against accidentally uploading private keys]' \
'-r[If provided, the new key will only have read access]' \
'--read-only[If provided, the new key will only have read access]' \
'-h[Print help]' \
'--help[Print help]' \
'::keyfile -- Path to the key file or '\''-'\'' to read from stdin. If omitted, will try to guess:_default' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__user__subcmd__key__subcmd__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-user-key-help-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(view)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(upload)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(gpg)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
":: :_fj__subcmd__user__subcmd__gpg_commands" \
"*::: :->gpg" \
&& ret=0

    case $state in
    (gpg)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-user-gpg-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
'-v[Show detailed information about every key]' \
'--verbose[Show detailed information about every key]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(view)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
':id -- ID of the GPG key to show as shown in `user gpg list`:_default' \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
'-f[Don'\''t ask for confirmation]' \
'--force[Don'\''t ask for confirmation]' \
'-h[Print help]' \
'--help[Print help]' \
':id -- ID of the GPG key to delete as shown in `user gpg list`:_default' \
&& ret=0
;;
(upload)
_arguments "${_arguments_options[@]}" : \
'-n[Skip the verification step. With this disabled, you can only add keys with emails associated with your account]' \
'--no-verify[Skip the verification step. With this disabled, you can only add keys with emails associated with your account]' \
'-h[Print help]' \
'--help[Print help]' \
':key -- The key to add. This can be anything the GPG CLI recognizes such as an email associated with the key or the key ID:_default' \
&& ret=0
;;
(verify)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
':id -- ID of the GPG key to verify as shown in `user gpg list`:_default' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__user__subcmd__gpg__subcmd__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-user-gpg-help-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(view)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(upload)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(verify)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__user__subcmd__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-user-help-command-$line[1]:"
        case $line[1] in
            (search)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(view)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(browse)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(follow)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(unfollow)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(following)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(followers)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(block)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(unblock)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(repos)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(orgs)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(activity)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(edit)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__user__subcmd__help__subcmd__edit_commands" \
"*::: :->edit" \
&& ret=0

    case $state in
    (edit)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-user-help-edit-command-$line[1]:"
        case $line[1] in
            (bio)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(name)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(pronouns)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(location)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(activity)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(email)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(website)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(key)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__user__subcmd__help__subcmd__key_commands" \
"*::: :->key" \
&& ret=0

    case $state in
    (key)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-user-help-key-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(view)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(upload)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(gpg)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__user__subcmd__help__subcmd__gpg_commands" \
"*::: :->gpg" \
&& ret=0

    case $state in
    (gpg)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-user-help-gpg-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(view)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(upload)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(verify)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(org)
_arguments "${_arguments_options[@]}" : \
'-R+[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'--remote=[The local git remote that points to the repo to operate on]:REMOTE:_default' \
'-h[Print help]' \
'--help[Print help]' \
":: :_fj__subcmd__org_commands" \
"*::: :->org" \
&& ret=0

    case $state in
    (org)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-org-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
'-p+[Which page of the results to view]:PAGE:_default' \
'--page=[Which page of the results to view]:PAGE:_default' \
'(-p --page)-o[Only list organizations you are a member of]' \
'(-p --page)--only-member-of[Only list organizations you are a member of]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(view)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
':name -- The name of the organization to view:_default' \
&& ret=0
;;
(create)
_arguments "${_arguments_options[@]}" : \
'-f+[The display name for the organization]:FULL_NAME:_default' \
'--full-name=[The display name for the organization]:FULL_NAME:_default' \
'-d+[The organization'\''s description]:DESCRIPTION:_default' \
'--description=[The organization'\''s description]:DESCRIPTION:_default' \
'-e+[Contact email for the organization]:EMAIL:_default' \
'--email=[Contact email for the organization]:EMAIL:_default' \
'-l+[The organizations'\''s location]:LOCATION:_default' \
'--location=[The organizations'\''s location]:LOCATION:_default' \
'-w+[The organization'\''s website]:WEBSITE:_default' \
'--website=[The organization'\''s website]:WEBSITE:_default' \
'-v+[The visibility of the organization]:VISIBILITY:(private limited public)' \
'--visibility=[The visibility of the organization]:VISIBILITY:(private limited public)' \
'-a+[Whether the admin of a repo can change org teams'\'' access to it]:ADMIN_CAN_CHANGE_TEAM_ACCESS:(true false)' \
'--admin-can-change-team-access=[Whether the admin of a repo can change org teams'\'' access to it]:ADMIN_CAN_CHANGE_TEAM_ACCESS:(true false)' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':name -- The username for the organization:_default' \
&& ret=0
;;
(edit)
_arguments "${_arguments_options[@]}" : \
'-f+[The display name for the organization]:FULL_NAME:_default' \
'--full-name=[The display name for the organization]:FULL_NAME:_default' \
'-d+[The organization'\''s description]:DESCRIPTION:_default' \
'--description=[The organization'\''s description]:DESCRIPTION:_default' \
'-e+[Contact email for the organization]:EMAIL:_default' \
'--email=[Contact email for the organization]:EMAIL:_default' \
'-l+[The organizations'\''s location]:LOCATION:_default' \
'--location=[The organizations'\''s location]:LOCATION:_default' \
'-w+[The organization'\''s website]:WEBSITE:_default' \
'--website=[The organization'\''s website]:WEBSITE:_default' \
'-v+[The visibility of the organization]:VISIBILITY:(private limited public)' \
'--visibility=[The visibility of the organization]:VISIBILITY:(private limited public)' \
'-a+[Whether the admin of a repo can change org teams'\'' access to it]:ADMIN_CAN_CHANGE_TEAM_ACCESS:(true false)' \
'--admin-can-change-team-access=[Whether the admin of a repo can change org teams'\'' access to it]:ADMIN_CAN_CHANGE_TEAM_ACCESS:(true false)' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':name -- The name of the organization to edit:_default' \
&& ret=0
;;
(activity)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
':name -- The name of the organization to view activity for:_default' \
&& ret=0
;;
(members)
_arguments "${_arguments_options[@]}" : \
'-p+[Which page of the results to view]:PAGE:_default' \
'--page=[Which page of the results to view]:PAGE:_default' \
'-h[Print help]' \
'--help[Print help]' \
':org -- The name of the organization to view the members of:_default' \
&& ret=0
;;
(visibility)
_arguments "${_arguments_options[@]}" : \
'-s+[Set a new visibility for yourself]:SET:(private public)' \
'--set=[Set a new visibility for yourself]:SET:(private public)' \
'-h[Print help]' \
'--help[Print help]' \
':org -- The name of the organization to view your visibility in:_default' \
&& ret=0
;;
(team)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
":: :_fj__subcmd__org__subcmd__team_commands" \
"*::: :->team" \
&& ret=0

    case $state in
    (team)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-org-team-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
':org -- The name of the organization to list the teams in:_default' \
&& ret=0
;;
(view)
_arguments "${_arguments_options[@]}" : \
'-p[]' \
'--list-permissions[]' \
'-h[Print help]' \
'--help[Print help]' \
':org -- The name of the organization the team is part of:_default' \
':name -- The name of the new team:_default' \
&& ret=0
;;
(create)
_arguments "${_arguments_options[@]}" : \
'-d+[A description of what the team does]:DESCRIPTION:_default' \
'--description=[A description of what the team does]:DESCRIPTION:_default' \
'-r+[A comma-separated list of read permissions to give this team]:READ_PERMISSIONS:_default' \
'--read-permissions=[A comma-separated list of read permissions to give this team]:READ_PERMISSIONS:_default' \
'-w+[A comma-separated list of read+write permissions to give this team]:WRITE_PERMISSIONS:_default' \
'--write-permissions=[A comma-separated list of read+write permissions to give this team]:WRITE_PERMISSIONS:_default' \
'-c[Allow members of this team to create repos in the organization]' \
'--can-create-repos[Allow members of this team to create repos in the organization]' \
'-i[Give this team access to every repo]' \
'--include-all-repos[Give this team access to every repo]' \
'-A[Give this team administrator abilities in the organization]' \
'--admin[Give this team administrator abilities in the organization]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':org -- The name of the organization to create the team in:_default' \
':name -- The name of the new team:_default' \
&& ret=0
;;
(edit)
_arguments "${_arguments_options[@]}" : \
'-n+[Can members of this team to create repos in the organization?]:NEW_NAME:_default' \
'--new-name=[Can members of this team to create repos in the organization?]:NEW_NAME:_default' \
'-c+[Allow members of this team to create repos in the organization]:CAN_CREATE_REPOS:(true false)' \
'--can-create-repos=[Allow members of this team to create repos in the organization]:CAN_CREATE_REPOS:(true false)' \
'-i+[Give this team access to every repo]:INCLUDE_ALL_REPOS:(true false)' \
'--include-all-repos=[Give this team access to every repo]:INCLUDE_ALL_REPOS:(true false)' \
'-A+[Give this team administrator abilities in the organization]:ADMIN:(true false)' \
'--admin=[Give this team administrator abilities in the organization]:ADMIN:(true false)' \
'-d+[A description of what the team does]:DESCRIPTION:_default' \
'--description=[A description of what the team does]:DESCRIPTION:_default' \
'-r+[A comma-separated list of read permissions to give this team]:READ_PERMISSIONS:_default' \
'--read-permissions=[A comma-separated list of read permissions to give this team]:READ_PERMISSIONS:_default' \
'-w+[A comma-separated list of read+write permissions to give this team]:WRITE_PERMISSIONS:_default' \
'--write-permissions=[A comma-separated list of read+write permissions to give this team]:WRITE_PERMISSIONS:_default' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':org -- The name of the organization the team is in:_default' \
':name -- The name of the team to edit:_default' \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':org -- The name of the organization the team is in:_default' \
':name -- The name of the team to delete:_default' \
&& ret=0
;;
(repo)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
":: :_fj__subcmd__org__subcmd__team__subcmd__repo_commands" \
"*::: :->repo" \
&& ret=0

    case $state in
    (repo)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-org-team-repo-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
'-p+[Which page of the results to view]:PAGE:_default' \
'--page=[Which page of the results to view]:PAGE:_default' \
'-h[Print help]' \
'--help[Print help]' \
':org -- The name of the organization the team is in:_default' \
':team -- The name of the team to view the repos of:_default' \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
':org -- The name of the organization the team is in:_default' \
':team -- The name of the team to add a repo to:_default' \
':repo -- The name of the repo to add to the team:_default' \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':org -- The name of the organization the team is in:_default' \
':team -- The name of the team to remove the repo from:_default' \
':repo -- The name of the repo to remove from the team:_default' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__org__subcmd__team__subcmd__repo__subcmd__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-org-team-repo-help-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(member)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
":: :_fj__subcmd__org__subcmd__team__subcmd__member_commands" \
"*::: :->member" \
&& ret=0

    case $state in
    (member)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-org-team-member-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
'-p+[Which page of the results to view]:PAGE:_default' \
'--page=[Which page of the results to view]:PAGE:_default' \
'-h[Print help]' \
'--help[Print help]' \
':org -- The name of the organization the team is in:_default' \
':team -- The name of the team to view the members of:_default' \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
':org -- The name of the organization the team is in:_default' \
':team -- The name of the team to add a user to:_default' \
':user -- The name of the user to add to the team:_default' \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
':org -- The name of the organization the team is in:_default' \
':team -- The name of the team to remove the user from:_default' \
':user -- The name of the user to remove from the team:_default' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__org__subcmd__team__subcmd__member__subcmd__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-org-team-member-help-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__org__subcmd__team__subcmd__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-org-team-help-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(view)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(create)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(edit)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(repo)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__org__subcmd__team__subcmd__help__subcmd__repo_commands" \
"*::: :->repo" \
&& ret=0

    case $state in
    (repo)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-org-team-help-repo-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(member)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__org__subcmd__team__subcmd__help__subcmd__member_commands" \
"*::: :->member" \
&& ret=0

    case $state in
    (member)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-org-team-help-member-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(label)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
":: :_fj__subcmd__org__subcmd__label_commands" \
"*::: :->label" \
&& ret=0

    case $state in
    (label)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-org-label-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
':org -- The name of the organization to list the labels of:_default' \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
'-d+[A description of what the label is for]:DESCRIPTION:_default' \
'--description=[A description of what the label is for]:DESCRIPTION:_default' \
'-e[If this label is named \`{scope}/{name}\`, make it exclusive with other labels with the same scope]' \
'--exclusive[If this label is named \`{scope}/{name}\`, make it exclusive with other labels with the same scope]' \
'-h[Print help]' \
'--help[Print help]' \
':org -- The name of the organization the label should be added to:_default' \
':name -- The name of the label to add:_default' \
':color -- The hexcode of the label to add:_default' \
&& ret=0
;;
(edit)
_arguments "${_arguments_options[@]}" : \
'-n+[Set a new name for the label]:NEW_NAME:_default' \
'--new-name=[Set a new name for the label]:NEW_NAME:_default' \
'-c+[Set a new hexcode for the label]:COLOR:_default' \
'--color=[Set a new hexcode for the label]:COLOR:_default' \
'-d+[Set a description of what the label is for]:DESCRIPTION:_default' \
'--description=[Set a description of what the label is for]:DESCRIPTION:_default' \
'-a+[Set whether this label is archived]:ARCHIVED:(true false)' \
'--archived=[Set whether this label is archived]:ARCHIVED:(true false)' \
'-e[Set whether this label is exclusive with others of the same scope]' \
'--exclusive[Set whether this label is exclusive with others of the same scope]' \
'-h[Print help]' \
'--help[Print help]' \
':org -- The name of the organization the label is in:_default' \
':name -- The name of the label to edit:_default' \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
':org -- The name of the organization the label is in:_default' \
':label -- The name of the label to remove from the organization:_default' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__org__subcmd__label__subcmd__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-org-label-help-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(edit)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(repo)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
":: :_fj__subcmd__org__subcmd__repo_commands" \
"*::: :->repo" \
&& ret=0

    case $state in
    (repo)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-org-repo-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
'-p+[Which page of the results to view]:PAGE:_default' \
'--page=[Which page of the results to view]:PAGE:_default' \
'-h[Print help]' \
'--help[Print help]' \
':org -- The name of the organization to list the repos of:_default' \
&& ret=0
;;
(create)
_arguments "${_arguments_options[@]}" : \
'-d+[]:DESCRIPTION:_default' \
'--description=[]:DESCRIPTION:_default' \
'-r+[Creates a new remote with the given name for the new repo]:REMOTE:_default' \
'--remote=[Creates a new remote with the given name for the new repo]:REMOTE:_default' \
'-S+[Use SSH for the new remote instead of HTTP(S)]::SSH:(true false)' \
'--ssh=[Use SSH for the new remote instead of HTTP(S)]::SSH:(true false)' \
'-P[]' \
'--private[]' \
'-p[Pushes the current branch to the default branch on the new repo. Implies \`--remote=origin\` (setting remote manually overrides this)]' \
'--push[Pushes the current branch to the default branch on the new repo. Implies \`--remote=origin\` (setting remote manually overrides this)]' \
'-h[Print help]' \
'--help[Print help]' \
':org -- The name of the organization to create the repo in:_default' \
':repo:_default' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__org__subcmd__repo__subcmd__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-org-repo-help-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(create)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__org__subcmd__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-org-help-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(view)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(create)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(edit)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(activity)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(members)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(visibility)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(team)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__org__subcmd__help__subcmd__team_commands" \
"*::: :->team" \
&& ret=0

    case $state in
    (team)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-org-help-team-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(view)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(create)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(edit)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(repo)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__org__subcmd__help__subcmd__team__subcmd__repo_commands" \
"*::: :->repo" \
&& ret=0

    case $state in
    (repo)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-org-help-team-repo-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(member)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__org__subcmd__help__subcmd__team__subcmd__member_commands" \
"*::: :->member" \
&& ret=0

    case $state in
    (member)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-org-help-team-member-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(label)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__org__subcmd__help__subcmd__label_commands" \
"*::: :->label" \
&& ret=0

    case $state in
    (label)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-org-help-label-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(edit)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(repo)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__org__subcmd__help__subcmd__repo_commands" \
"*::: :->repo" \
&& ret=0

    case $state in
    (repo)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-org-help-repo-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(create)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(version)
_arguments "${_arguments_options[@]}" : \
'--check[Checks for updates]' \
'-v[]' \
'--verbose[]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(completion)
_arguments "${_arguments_options[@]}" : \
'--bin-name=[]:BIN_NAME:_default' \
'-h[Print help]' \
'--help[Print help]' \
':shell:(bash elvish fish power-shell zsh nushell)' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-help-command-$line[1]:"
        case $line[1] in
            (repo)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__help__subcmd__repo_commands" \
"*::: :->repo" \
&& ret=0

    case $state in
    (repo)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-help-repo-command-$line[1]:"
        case $line[1] in
            (create)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(fork)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(migrate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(view)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(readme)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(clone)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(star)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(unstar)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(browse)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(labels)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__help__subcmd__repo__subcmd__labels_commands" \
"*::: :->labels" \
&& ret=0

    case $state in
    (labels)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-help-repo-labels-command-$line[1]:"
        case $line[1] in
            (view)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(create)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(edit)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(edit)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(units)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__help__subcmd__repo__subcmd__units_commands" \
"*::: :->units" \
&& ret=0

    case $state in
    (units)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-help-repo-units-command-$line[1]:"
        case $line[1] in
            (issues)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(prs)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(actions)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(wiki)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(packages)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(projects)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(releases)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(issue)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__help__subcmd__issue_commands" \
"*::: :->issue" \
&& ret=0

    case $state in
    (issue)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-help-issue-command-$line[1]:"
        case $line[1] in
            (create)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(edit)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__help__subcmd__issue__subcmd__edit_commands" \
"*::: :->edit" \
&& ret=0

    case $state in
    (edit)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-help-issue-edit-command-$line[1]:"
        case $line[1] in
            (title)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(body)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(comment)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(labels)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(comment)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(assign)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(unassign)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(close)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(search)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(view)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__help__subcmd__issue__subcmd__view_commands" \
"*::: :->view" \
&& ret=0

    case $state in
    (view)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-help-issue-view-command-$line[1]:"
        case $line[1] in
            (body)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(comment)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(comments)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(templates)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(browse)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(pr)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__help__subcmd__pr_commands" \
"*::: :->pr" \
&& ret=0

    case $state in
    (pr)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-help-pr-command-$line[1]:"
        case $line[1] in
            (search)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(create)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(view)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__help__subcmd__pr__subcmd__view_commands" \
"*::: :->view" \
&& ret=0

    case $state in
    (view)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-help-pr-view-command-$line[1]:"
        case $line[1] in
            (body)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(comment)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(comments)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(labels)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(diff)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(files)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(commits)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(status)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(checkout)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(comment)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(assign)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(unassign)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(edit)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__help__subcmd__pr__subcmd__edit_commands" \
"*::: :->edit" \
&& ret=0

    case $state in
    (edit)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-help-pr-edit-command-$line[1]:"
        case $line[1] in
            (title)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(body)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(comment)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(labels)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(close)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(merge)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(browse)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(wiki)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__help__subcmd__wiki_commands" \
"*::: :->wiki" \
&& ret=0

    case $state in
    (wiki)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-help-wiki-command-$line[1]:"
        case $line[1] in
            (contents)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(view)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(clone)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(browse)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(actions)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__help__subcmd__actions_commands" \
"*::: :->actions" \
&& ret=0

    case $state in
    (actions)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-help-actions-command-$line[1]:"
        case $line[1] in
            (tasks)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(variables)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__help__subcmd__actions__subcmd__variables_commands" \
"*::: :->variables" \
&& ret=0

    case $state in
    (variables)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-help-actions-variables-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(create)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(secrets)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__help__subcmd__actions__subcmd__secrets_commands" \
"*::: :->secrets" \
&& ret=0

    case $state in
    (secrets)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-help-actions-secrets-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(create)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(dispatch)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(whoami)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(auth)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__help__subcmd__auth_commands" \
"*::: :->auth" \
&& ret=0

    case $state in
    (auth)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-help-auth-command-$line[1]:"
        case $line[1] in
            (login)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(logout)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add-key)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(use-ssh)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(release)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__help__subcmd__release_commands" \
"*::: :->release" \
&& ret=0

    case $state in
    (release)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-help-release-command-$line[1]:"
        case $line[1] in
            (create)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(edit)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(view)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(browse)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(asset)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__help__subcmd__release__subcmd__asset_commands" \
"*::: :->asset" \
&& ret=0

    case $state in
    (asset)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-help-release-asset-command-$line[1]:"
        case $line[1] in
            (create)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(download)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(tag)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__help__subcmd__tag_commands" \
"*::: :->tag" \
&& ret=0

    case $state in
    (tag)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-help-tag-command-$line[1]:"
        case $line[1] in
            (create)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(view)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(user)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__help__subcmd__user_commands" \
"*::: :->user" \
&& ret=0

    case $state in
    (user)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-help-user-command-$line[1]:"
        case $line[1] in
            (search)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(view)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(browse)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(follow)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(unfollow)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(following)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(followers)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(block)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(unblock)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(repos)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(orgs)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(activity)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(edit)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__help__subcmd__user__subcmd__edit_commands" \
"*::: :->edit" \
&& ret=0

    case $state in
    (edit)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-help-user-edit-command-$line[1]:"
        case $line[1] in
            (bio)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(name)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(pronouns)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(location)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(activity)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(email)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(website)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(key)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__help__subcmd__user__subcmd__key_commands" \
"*::: :->key" \
&& ret=0

    case $state in
    (key)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-help-user-key-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(view)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(upload)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(gpg)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__help__subcmd__user__subcmd__gpg_commands" \
"*::: :->gpg" \
&& ret=0

    case $state in
    (gpg)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-help-user-gpg-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(view)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(upload)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(verify)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(org)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__help__subcmd__org_commands" \
"*::: :->org" \
&& ret=0

    case $state in
    (org)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-help-org-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(view)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(create)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(edit)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(activity)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(members)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(visibility)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(team)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__help__subcmd__org__subcmd__team_commands" \
"*::: :->team" \
&& ret=0

    case $state in
    (team)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-help-org-team-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(view)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(create)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(edit)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(repo)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__help__subcmd__org__subcmd__team__subcmd__repo_commands" \
"*::: :->repo" \
&& ret=0

    case $state in
    (repo)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-help-org-team-repo-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(member)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__help__subcmd__org__subcmd__team__subcmd__member_commands" \
"*::: :->member" \
&& ret=0

    case $state in
    (member)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-help-org-team-member-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(label)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__help__subcmd__org__subcmd__label_commands" \
"*::: :->label" \
&& ret=0

    case $state in
    (label)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-help-org-label-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(edit)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(repo)
_arguments "${_arguments_options[@]}" : \
":: :_fj__subcmd__help__subcmd__org__subcmd__repo_commands" \
"*::: :->repo" \
&& ret=0

    case $state in
    (repo)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:fj-help-org-repo-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(create)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(version)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(completion)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
}

(( $+functions[_fj_commands] )) ||
_fj_commands() {
    local commands; commands=(
'repo:' \
'issue:' \
'pr:' \
'wiki:' \
'actions:' \
'whoami:' \
'auth:' \
'release:' \
'tag:' \
'user:' \
'org:' \
'version:' \
'completion:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj commands' commands "$@"
}
(( $+functions[_fj__subcmd__actions_commands] )) ||
_fj__subcmd__actions_commands() {
    local commands; commands=(
'tasks:List the tasks on a repo' \
'variables:List and manage variables' \
'secrets:' \
'dispatch:Dispatch a workflow' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj actions commands' commands "$@"
}
(( $+functions[_fj__subcmd__actions__subcmd__dispatch_commands] )) ||
_fj__subcmd__actions__subcmd__dispatch_commands() {
    local commands; commands=()
    _describe -t commands 'fj actions dispatch commands' commands "$@"
}
(( $+functions[_fj__subcmd__actions__subcmd__help_commands] )) ||
_fj__subcmd__actions__subcmd__help_commands() {
    local commands; commands=(
'tasks:List the tasks on a repo' \
'variables:List and manage variables' \
'secrets:' \
'dispatch:Dispatch a workflow' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj actions help commands' commands "$@"
}
(( $+functions[_fj__subcmd__actions__subcmd__help__subcmd__dispatch_commands] )) ||
_fj__subcmd__actions__subcmd__help__subcmd__dispatch_commands() {
    local commands; commands=()
    _describe -t commands 'fj actions help dispatch commands' commands "$@"
}
(( $+functions[_fj__subcmd__actions__subcmd__help__subcmd__help_commands] )) ||
_fj__subcmd__actions__subcmd__help__subcmd__help_commands() {
    local commands; commands=()
    _describe -t commands 'fj actions help help commands' commands "$@"
}
(( $+functions[_fj__subcmd__actions__subcmd__help__subcmd__secrets_commands] )) ||
_fj__subcmd__actions__subcmd__help__subcmd__secrets_commands() {
    local commands; commands=(
'list:List secrets' \
'create:Create a new secret' \
'delete:' \
    )
    _describe -t commands 'fj actions help secrets commands' commands "$@"
}
(( $+functions[_fj__subcmd__actions__subcmd__help__subcmd__secrets__subcmd__create_commands] )) ||
_fj__subcmd__actions__subcmd__help__subcmd__secrets__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj actions help secrets create commands' commands "$@"
}
(( $+functions[_fj__subcmd__actions__subcmd__help__subcmd__secrets__subcmd__delete_commands] )) ||
_fj__subcmd__actions__subcmd__help__subcmd__secrets__subcmd__delete_commands() {
    local commands; commands=()
    _describe -t commands 'fj actions help secrets delete commands' commands "$@"
}
(( $+functions[_fj__subcmd__actions__subcmd__help__subcmd__secrets__subcmd__list_commands] )) ||
_fj__subcmd__actions__subcmd__help__subcmd__secrets__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj actions help secrets list commands' commands "$@"
}
(( $+functions[_fj__subcmd__actions__subcmd__help__subcmd__tasks_commands] )) ||
_fj__subcmd__actions__subcmd__help__subcmd__tasks_commands() {
    local commands; commands=()
    _describe -t commands 'fj actions help tasks commands' commands "$@"
}
(( $+functions[_fj__subcmd__actions__subcmd__help__subcmd__variables_commands] )) ||
_fj__subcmd__actions__subcmd__help__subcmd__variables_commands() {
    local commands; commands=(
'list:List variables' \
'create:Create a new variable' \
'delete:' \
    )
    _describe -t commands 'fj actions help variables commands' commands "$@"
}
(( $+functions[_fj__subcmd__actions__subcmd__help__subcmd__variables__subcmd__create_commands] )) ||
_fj__subcmd__actions__subcmd__help__subcmd__variables__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj actions help variables create commands' commands "$@"
}
(( $+functions[_fj__subcmd__actions__subcmd__help__subcmd__variables__subcmd__delete_commands] )) ||
_fj__subcmd__actions__subcmd__help__subcmd__variables__subcmd__delete_commands() {
    local commands; commands=()
    _describe -t commands 'fj actions help variables delete commands' commands "$@"
}
(( $+functions[_fj__subcmd__actions__subcmd__help__subcmd__variables__subcmd__list_commands] )) ||
_fj__subcmd__actions__subcmd__help__subcmd__variables__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj actions help variables list commands' commands "$@"
}
(( $+functions[_fj__subcmd__actions__subcmd__secrets_commands] )) ||
_fj__subcmd__actions__subcmd__secrets_commands() {
    local commands; commands=(
'list:List secrets' \
'create:Create a new secret' \
'delete:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj actions secrets commands' commands "$@"
}
(( $+functions[_fj__subcmd__actions__subcmd__secrets__subcmd__create_commands] )) ||
_fj__subcmd__actions__subcmd__secrets__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj actions secrets create commands' commands "$@"
}
(( $+functions[_fj__subcmd__actions__subcmd__secrets__subcmd__delete_commands] )) ||
_fj__subcmd__actions__subcmd__secrets__subcmd__delete_commands() {
    local commands; commands=()
    _describe -t commands 'fj actions secrets delete commands' commands "$@"
}
(( $+functions[_fj__subcmd__actions__subcmd__secrets__subcmd__help_commands] )) ||
_fj__subcmd__actions__subcmd__secrets__subcmd__help_commands() {
    local commands; commands=(
'list:List secrets' \
'create:Create a new secret' \
'delete:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj actions secrets help commands' commands "$@"
}
(( $+functions[_fj__subcmd__actions__subcmd__secrets__subcmd__help__subcmd__create_commands] )) ||
_fj__subcmd__actions__subcmd__secrets__subcmd__help__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj actions secrets help create commands' commands "$@"
}
(( $+functions[_fj__subcmd__actions__subcmd__secrets__subcmd__help__subcmd__delete_commands] )) ||
_fj__subcmd__actions__subcmd__secrets__subcmd__help__subcmd__delete_commands() {
    local commands; commands=()
    _describe -t commands 'fj actions secrets help delete commands' commands "$@"
}
(( $+functions[_fj__subcmd__actions__subcmd__secrets__subcmd__help__subcmd__help_commands] )) ||
_fj__subcmd__actions__subcmd__secrets__subcmd__help__subcmd__help_commands() {
    local commands; commands=()
    _describe -t commands 'fj actions secrets help help commands' commands "$@"
}
(( $+functions[_fj__subcmd__actions__subcmd__secrets__subcmd__help__subcmd__list_commands] )) ||
_fj__subcmd__actions__subcmd__secrets__subcmd__help__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj actions secrets help list commands' commands "$@"
}
(( $+functions[_fj__subcmd__actions__subcmd__secrets__subcmd__list_commands] )) ||
_fj__subcmd__actions__subcmd__secrets__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj actions secrets list commands' commands "$@"
}
(( $+functions[_fj__subcmd__actions__subcmd__tasks_commands] )) ||
_fj__subcmd__actions__subcmd__tasks_commands() {
    local commands; commands=()
    _describe -t commands 'fj actions tasks commands' commands "$@"
}
(( $+functions[_fj__subcmd__actions__subcmd__variables_commands] )) ||
_fj__subcmd__actions__subcmd__variables_commands() {
    local commands; commands=(
'list:List variables' \
'create:Create a new variable' \
'delete:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj actions variables commands' commands "$@"
}
(( $+functions[_fj__subcmd__actions__subcmd__variables__subcmd__create_commands] )) ||
_fj__subcmd__actions__subcmd__variables__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj actions variables create commands' commands "$@"
}
(( $+functions[_fj__subcmd__actions__subcmd__variables__subcmd__delete_commands] )) ||
_fj__subcmd__actions__subcmd__variables__subcmd__delete_commands() {
    local commands; commands=()
    _describe -t commands 'fj actions variables delete commands' commands "$@"
}
(( $+functions[_fj__subcmd__actions__subcmd__variables__subcmd__help_commands] )) ||
_fj__subcmd__actions__subcmd__variables__subcmd__help_commands() {
    local commands; commands=(
'list:List variables' \
'create:Create a new variable' \
'delete:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj actions variables help commands' commands "$@"
}
(( $+functions[_fj__subcmd__actions__subcmd__variables__subcmd__help__subcmd__create_commands] )) ||
_fj__subcmd__actions__subcmd__variables__subcmd__help__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj actions variables help create commands' commands "$@"
}
(( $+functions[_fj__subcmd__actions__subcmd__variables__subcmd__help__subcmd__delete_commands] )) ||
_fj__subcmd__actions__subcmd__variables__subcmd__help__subcmd__delete_commands() {
    local commands; commands=()
    _describe -t commands 'fj actions variables help delete commands' commands "$@"
}
(( $+functions[_fj__subcmd__actions__subcmd__variables__subcmd__help__subcmd__help_commands] )) ||
_fj__subcmd__actions__subcmd__variables__subcmd__help__subcmd__help_commands() {
    local commands; commands=()
    _describe -t commands 'fj actions variables help help commands' commands "$@"
}
(( $+functions[_fj__subcmd__actions__subcmd__variables__subcmd__help__subcmd__list_commands] )) ||
_fj__subcmd__actions__subcmd__variables__subcmd__help__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj actions variables help list commands' commands "$@"
}
(( $+functions[_fj__subcmd__actions__subcmd__variables__subcmd__list_commands] )) ||
_fj__subcmd__actions__subcmd__variables__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj actions variables list commands' commands "$@"
}
(( $+functions[_fj__subcmd__auth_commands] )) ||
_fj__subcmd__auth_commands() {
    local commands; commands=(
'login:Log in to an instance' \
'logout:Deletes login info for an instance' \
'add-key:Add an application token for an instance' \
'use-ssh:' \
'list:List all instances you'\''re currently logged into' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj auth commands' commands "$@"
}
(( $+functions[_fj__subcmd__auth__subcmd__add-key_commands] )) ||
_fj__subcmd__auth__subcmd__add-key_commands() {
    local commands; commands=()
    _describe -t commands 'fj auth add-key commands' commands "$@"
}
(( $+functions[_fj__subcmd__auth__subcmd__help_commands] )) ||
_fj__subcmd__auth__subcmd__help_commands() {
    local commands; commands=(
'login:Log in to an instance' \
'logout:Deletes login info for an instance' \
'add-key:Add an application token for an instance' \
'use-ssh:' \
'list:List all instances you'\''re currently logged into' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj auth help commands' commands "$@"
}
(( $+functions[_fj__subcmd__auth__subcmd__help__subcmd__add-key_commands] )) ||
_fj__subcmd__auth__subcmd__help__subcmd__add-key_commands() {
    local commands; commands=()
    _describe -t commands 'fj auth help add-key commands' commands "$@"
}
(( $+functions[_fj__subcmd__auth__subcmd__help__subcmd__help_commands] )) ||
_fj__subcmd__auth__subcmd__help__subcmd__help_commands() {
    local commands; commands=()
    _describe -t commands 'fj auth help help commands' commands "$@"
}
(( $+functions[_fj__subcmd__auth__subcmd__help__subcmd__list_commands] )) ||
_fj__subcmd__auth__subcmd__help__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj auth help list commands' commands "$@"
}
(( $+functions[_fj__subcmd__auth__subcmd__help__subcmd__login_commands] )) ||
_fj__subcmd__auth__subcmd__help__subcmd__login_commands() {
    local commands; commands=()
    _describe -t commands 'fj auth help login commands' commands "$@"
}
(( $+functions[_fj__subcmd__auth__subcmd__help__subcmd__logout_commands] )) ||
_fj__subcmd__auth__subcmd__help__subcmd__logout_commands() {
    local commands; commands=()
    _describe -t commands 'fj auth help logout commands' commands "$@"
}
(( $+functions[_fj__subcmd__auth__subcmd__help__subcmd__use-ssh_commands] )) ||
_fj__subcmd__auth__subcmd__help__subcmd__use-ssh_commands() {
    local commands; commands=()
    _describe -t commands 'fj auth help use-ssh commands' commands "$@"
}
(( $+functions[_fj__subcmd__auth__subcmd__list_commands] )) ||
_fj__subcmd__auth__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj auth list commands' commands "$@"
}
(( $+functions[_fj__subcmd__auth__subcmd__login_commands] )) ||
_fj__subcmd__auth__subcmd__login_commands() {
    local commands; commands=()
    _describe -t commands 'fj auth login commands' commands "$@"
}
(( $+functions[_fj__subcmd__auth__subcmd__logout_commands] )) ||
_fj__subcmd__auth__subcmd__logout_commands() {
    local commands; commands=()
    _describe -t commands 'fj auth logout commands' commands "$@"
}
(( $+functions[_fj__subcmd__auth__subcmd__use-ssh_commands] )) ||
_fj__subcmd__auth__subcmd__use-ssh_commands() {
    local commands; commands=()
    _describe -t commands 'fj auth use-ssh commands' commands "$@"
}
(( $+functions[_fj__subcmd__completion_commands] )) ||
_fj__subcmd__completion_commands() {
    local commands; commands=()
    _describe -t commands 'fj completion commands' commands "$@"
}
(( $+functions[_fj__subcmd__help_commands] )) ||
_fj__subcmd__help_commands() {
    local commands; commands=(
'repo:' \
'issue:' \
'pr:' \
'wiki:' \
'actions:' \
'whoami:' \
'auth:' \
'release:' \
'tag:' \
'user:' \
'org:' \
'version:' \
'completion:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj help commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__actions_commands] )) ||
_fj__subcmd__help__subcmd__actions_commands() {
    local commands; commands=(
'tasks:List the tasks on a repo' \
'variables:List and manage variables' \
'secrets:' \
'dispatch:Dispatch a workflow' \
    )
    _describe -t commands 'fj help actions commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__actions__subcmd__dispatch_commands] )) ||
_fj__subcmd__help__subcmd__actions__subcmd__dispatch_commands() {
    local commands; commands=()
    _describe -t commands 'fj help actions dispatch commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__actions__subcmd__secrets_commands] )) ||
_fj__subcmd__help__subcmd__actions__subcmd__secrets_commands() {
    local commands; commands=(
'list:List secrets' \
'create:Create a new secret' \
'delete:' \
    )
    _describe -t commands 'fj help actions secrets commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__actions__subcmd__secrets__subcmd__create_commands] )) ||
_fj__subcmd__help__subcmd__actions__subcmd__secrets__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj help actions secrets create commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__actions__subcmd__secrets__subcmd__delete_commands] )) ||
_fj__subcmd__help__subcmd__actions__subcmd__secrets__subcmd__delete_commands() {
    local commands; commands=()
    _describe -t commands 'fj help actions secrets delete commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__actions__subcmd__secrets__subcmd__list_commands] )) ||
_fj__subcmd__help__subcmd__actions__subcmd__secrets__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj help actions secrets list commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__actions__subcmd__tasks_commands] )) ||
_fj__subcmd__help__subcmd__actions__subcmd__tasks_commands() {
    local commands; commands=()
    _describe -t commands 'fj help actions tasks commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__actions__subcmd__variables_commands] )) ||
_fj__subcmd__help__subcmd__actions__subcmd__variables_commands() {
    local commands; commands=(
'list:List variables' \
'create:Create a new variable' \
'delete:' \
    )
    _describe -t commands 'fj help actions variables commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__actions__subcmd__variables__subcmd__create_commands] )) ||
_fj__subcmd__help__subcmd__actions__subcmd__variables__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj help actions variables create commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__actions__subcmd__variables__subcmd__delete_commands] )) ||
_fj__subcmd__help__subcmd__actions__subcmd__variables__subcmd__delete_commands() {
    local commands; commands=()
    _describe -t commands 'fj help actions variables delete commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__actions__subcmd__variables__subcmd__list_commands] )) ||
_fj__subcmd__help__subcmd__actions__subcmd__variables__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj help actions variables list commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__auth_commands] )) ||
_fj__subcmd__help__subcmd__auth_commands() {
    local commands; commands=(
'login:Log in to an instance' \
'logout:Deletes login info for an instance' \
'add-key:Add an application token for an instance' \
'use-ssh:' \
'list:List all instances you'\''re currently logged into' \
    )
    _describe -t commands 'fj help auth commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__auth__subcmd__add-key_commands] )) ||
_fj__subcmd__help__subcmd__auth__subcmd__add-key_commands() {
    local commands; commands=()
    _describe -t commands 'fj help auth add-key commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__auth__subcmd__list_commands] )) ||
_fj__subcmd__help__subcmd__auth__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj help auth list commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__auth__subcmd__login_commands] )) ||
_fj__subcmd__help__subcmd__auth__subcmd__login_commands() {
    local commands; commands=()
    _describe -t commands 'fj help auth login commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__auth__subcmd__logout_commands] )) ||
_fj__subcmd__help__subcmd__auth__subcmd__logout_commands() {
    local commands; commands=()
    _describe -t commands 'fj help auth logout commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__auth__subcmd__use-ssh_commands] )) ||
_fj__subcmd__help__subcmd__auth__subcmd__use-ssh_commands() {
    local commands; commands=()
    _describe -t commands 'fj help auth use-ssh commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__completion_commands] )) ||
_fj__subcmd__help__subcmd__completion_commands() {
    local commands; commands=()
    _describe -t commands 'fj help completion commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__help_commands] )) ||
_fj__subcmd__help__subcmd__help_commands() {
    local commands; commands=()
    _describe -t commands 'fj help help commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__issue_commands] )) ||
_fj__subcmd__help__subcmd__issue_commands() {
    local commands; commands=(
'create:Create a new issue on a repo' \
'edit:Edit an issue' \
'comment:Add a comment on an issue' \
'assign:Assign users to an issue' \
'unassign:Unassign users from an issue' \
'close:Close an issue' \
'search:Search for an issue in a repo' \
'view:View an issue'\''s info' \
'templates:List the issue templates in a repo' \
'browse:Open an issue in your browser' \
    )
    _describe -t commands 'fj help issue commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__issue__subcmd__assign_commands] )) ||
_fj__subcmd__help__subcmd__issue__subcmd__assign_commands() {
    local commands; commands=()
    _describe -t commands 'fj help issue assign commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__issue__subcmd__browse_commands] )) ||
_fj__subcmd__help__subcmd__issue__subcmd__browse_commands() {
    local commands; commands=()
    _describe -t commands 'fj help issue browse commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__issue__subcmd__close_commands] )) ||
_fj__subcmd__help__subcmd__issue__subcmd__close_commands() {
    local commands; commands=()
    _describe -t commands 'fj help issue close commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__issue__subcmd__comment_commands] )) ||
_fj__subcmd__help__subcmd__issue__subcmd__comment_commands() {
    local commands; commands=()
    _describe -t commands 'fj help issue comment commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__issue__subcmd__create_commands] )) ||
_fj__subcmd__help__subcmd__issue__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj help issue create commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__issue__subcmd__edit_commands] )) ||
_fj__subcmd__help__subcmd__issue__subcmd__edit_commands() {
    local commands; commands=(
'title:Edit an issue'\''s title' \
'body:Edit an issue'\''s text content' \
'comment:Edit a comment on an issue' \
'labels:Edit an issue'\''s labels' \
    )
    _describe -t commands 'fj help issue edit commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__issue__subcmd__edit__subcmd__body_commands] )) ||
_fj__subcmd__help__subcmd__issue__subcmd__edit__subcmd__body_commands() {
    local commands; commands=()
    _describe -t commands 'fj help issue edit body commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__issue__subcmd__edit__subcmd__comment_commands] )) ||
_fj__subcmd__help__subcmd__issue__subcmd__edit__subcmd__comment_commands() {
    local commands; commands=()
    _describe -t commands 'fj help issue edit comment commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__issue__subcmd__edit__subcmd__labels_commands] )) ||
_fj__subcmd__help__subcmd__issue__subcmd__edit__subcmd__labels_commands() {
    local commands; commands=()
    _describe -t commands 'fj help issue edit labels commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__issue__subcmd__edit__subcmd__title_commands] )) ||
_fj__subcmd__help__subcmd__issue__subcmd__edit__subcmd__title_commands() {
    local commands; commands=()
    _describe -t commands 'fj help issue edit title commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__issue__subcmd__search_commands] )) ||
_fj__subcmd__help__subcmd__issue__subcmd__search_commands() {
    local commands; commands=()
    _describe -t commands 'fj help issue search commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__issue__subcmd__templates_commands] )) ||
_fj__subcmd__help__subcmd__issue__subcmd__templates_commands() {
    local commands; commands=()
    _describe -t commands 'fj help issue templates commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__issue__subcmd__unassign_commands] )) ||
_fj__subcmd__help__subcmd__issue__subcmd__unassign_commands() {
    local commands; commands=()
    _describe -t commands 'fj help issue unassign commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__issue__subcmd__view_commands] )) ||
_fj__subcmd__help__subcmd__issue__subcmd__view_commands() {
    local commands; commands=(
'body:View an issue'\''s title and body. The default' \
'comment:View a specific' \
'comments:List every comment' \
    )
    _describe -t commands 'fj help issue view commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__issue__subcmd__view__subcmd__body_commands] )) ||
_fj__subcmd__help__subcmd__issue__subcmd__view__subcmd__body_commands() {
    local commands; commands=()
    _describe -t commands 'fj help issue view body commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__issue__subcmd__view__subcmd__comment_commands] )) ||
_fj__subcmd__help__subcmd__issue__subcmd__view__subcmd__comment_commands() {
    local commands; commands=()
    _describe -t commands 'fj help issue view comment commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__issue__subcmd__view__subcmd__comments_commands] )) ||
_fj__subcmd__help__subcmd__issue__subcmd__view__subcmd__comments_commands() {
    local commands; commands=()
    _describe -t commands 'fj help issue view comments commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__org_commands] )) ||
_fj__subcmd__help__subcmd__org_commands() {
    local commands; commands=(
'list:List all organizations' \
'view:View info about an organization' \
'create:Create a new organization' \
'edit:Edit an organization'\''s information' \
'activity:View the activity in an organization' \
'members:List the members of an organization' \
'visibility:View and change the visibility of your membership in an organization' \
'team:' \
'label:' \
'repo:' \
    )
    _describe -t commands 'fj help org commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__org__subcmd__activity_commands] )) ||
_fj__subcmd__help__subcmd__org__subcmd__activity_commands() {
    local commands; commands=()
    _describe -t commands 'fj help org activity commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__org__subcmd__create_commands] )) ||
_fj__subcmd__help__subcmd__org__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj help org create commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__org__subcmd__edit_commands] )) ||
_fj__subcmd__help__subcmd__org__subcmd__edit_commands() {
    local commands; commands=()
    _describe -t commands 'fj help org edit commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__org__subcmd__label_commands] )) ||
_fj__subcmd__help__subcmd__org__subcmd__label_commands() {
    local commands; commands=(
'list:List all the issue labels an organization uses' \
'add:Add a new issue label to an organization' \
'edit:Edit an issue label an organization uses' \
'rm:Remove an issue label from an organization' \
    )
    _describe -t commands 'fj help org label commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__org__subcmd__label__subcmd__add_commands] )) ||
_fj__subcmd__help__subcmd__org__subcmd__label__subcmd__add_commands() {
    local commands; commands=()
    _describe -t commands 'fj help org label add commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__org__subcmd__label__subcmd__edit_commands] )) ||
_fj__subcmd__help__subcmd__org__subcmd__label__subcmd__edit_commands() {
    local commands; commands=()
    _describe -t commands 'fj help org label edit commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__org__subcmd__label__subcmd__list_commands] )) ||
_fj__subcmd__help__subcmd__org__subcmd__label__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj help org label list commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__org__subcmd__label__subcmd__rm_commands] )) ||
_fj__subcmd__help__subcmd__org__subcmd__label__subcmd__rm_commands() {
    local commands; commands=()
    _describe -t commands 'fj help org label rm commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__org__subcmd__list_commands] )) ||
_fj__subcmd__help__subcmd__org__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj help org list commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__org__subcmd__members_commands] )) ||
_fj__subcmd__help__subcmd__org__subcmd__members_commands() {
    local commands; commands=()
    _describe -t commands 'fj help org members commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__org__subcmd__repo_commands] )) ||
_fj__subcmd__help__subcmd__org__subcmd__repo_commands() {
    local commands; commands=(
'list:List all the repos owned by this organization' \
'create:Create a new repository in this organization' \
    )
    _describe -t commands 'fj help org repo commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__org__subcmd__repo__subcmd__create_commands] )) ||
_fj__subcmd__help__subcmd__org__subcmd__repo__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj help org repo create commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__org__subcmd__repo__subcmd__list_commands] )) ||
_fj__subcmd__help__subcmd__org__subcmd__repo__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj help org repo list commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__org__subcmd__team_commands] )) ||
_fj__subcmd__help__subcmd__org__subcmd__team_commands() {
    local commands; commands=(
'list:View all the teams in an organization' \
'view:View info about a single team' \
'create:Create a new team' \
'edit:Edit a team'\''s information and permissions' \
'delete:Delete a team from an organization' \
'repo:' \
'member:' \
    )
    _describe -t commands 'fj help org team commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__org__subcmd__team__subcmd__create_commands] )) ||
_fj__subcmd__help__subcmd__org__subcmd__team__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj help org team create commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__org__subcmd__team__subcmd__delete_commands] )) ||
_fj__subcmd__help__subcmd__org__subcmd__team__subcmd__delete_commands() {
    local commands; commands=()
    _describe -t commands 'fj help org team delete commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__org__subcmd__team__subcmd__edit_commands] )) ||
_fj__subcmd__help__subcmd__org__subcmd__team__subcmd__edit_commands() {
    local commands; commands=()
    _describe -t commands 'fj help org team edit commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__org__subcmd__team__subcmd__list_commands] )) ||
_fj__subcmd__help__subcmd__org__subcmd__team__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj help org team list commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__org__subcmd__team__subcmd__member_commands] )) ||
_fj__subcmd__help__subcmd__org__subcmd__team__subcmd__member_commands() {
    local commands; commands=(
'list:List all the members of a team' \
'add:Add someone to a team' \
'rm:Remove someone from a team' \
    )
    _describe -t commands 'fj help org team member commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__org__subcmd__team__subcmd__member__subcmd__add_commands] )) ||
_fj__subcmd__help__subcmd__org__subcmd__team__subcmd__member__subcmd__add_commands() {
    local commands; commands=()
    _describe -t commands 'fj help org team member add commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__org__subcmd__team__subcmd__member__subcmd__list_commands] )) ||
_fj__subcmd__help__subcmd__org__subcmd__team__subcmd__member__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj help org team member list commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__org__subcmd__team__subcmd__member__subcmd__rm_commands] )) ||
_fj__subcmd__help__subcmd__org__subcmd__team__subcmd__member__subcmd__rm_commands() {
    local commands; commands=()
    _describe -t commands 'fj help org team member rm commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__org__subcmd__team__subcmd__repo_commands] )) ||
_fj__subcmd__help__subcmd__org__subcmd__team__subcmd__repo_commands() {
    local commands; commands=(
'list:List all the repos this team can access' \
'add:Add access to an existing repo to a team' \
'rm:Remove access to a repo from a team' \
    )
    _describe -t commands 'fj help org team repo commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__org__subcmd__team__subcmd__repo__subcmd__add_commands] )) ||
_fj__subcmd__help__subcmd__org__subcmd__team__subcmd__repo__subcmd__add_commands() {
    local commands; commands=()
    _describe -t commands 'fj help org team repo add commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__org__subcmd__team__subcmd__repo__subcmd__list_commands] )) ||
_fj__subcmd__help__subcmd__org__subcmd__team__subcmd__repo__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj help org team repo list commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__org__subcmd__team__subcmd__repo__subcmd__rm_commands] )) ||
_fj__subcmd__help__subcmd__org__subcmd__team__subcmd__repo__subcmd__rm_commands() {
    local commands; commands=()
    _describe -t commands 'fj help org team repo rm commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__org__subcmd__team__subcmd__view_commands] )) ||
_fj__subcmd__help__subcmd__org__subcmd__team__subcmd__view_commands() {
    local commands; commands=()
    _describe -t commands 'fj help org team view commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__org__subcmd__view_commands] )) ||
_fj__subcmd__help__subcmd__org__subcmd__view_commands() {
    local commands; commands=()
    _describe -t commands 'fj help org view commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__org__subcmd__visibility_commands] )) ||
_fj__subcmd__help__subcmd__org__subcmd__visibility_commands() {
    local commands; commands=()
    _describe -t commands 'fj help org visibility commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__pr_commands] )) ||
_fj__subcmd__help__subcmd__pr_commands() {
    local commands; commands=(
'search:Search a repository'\''s pull requests' \
'create:Create a new pull request' \
'view:View the contents of a pull request' \
'status:View the mergability and CI status of a pull request' \
'checkout:Checkout a pull request in a new branch' \
'comment:Add a comment on a pull request' \
'assign:Assign users to a pull request' \
'unassign:Unassign users from an issue' \
'edit:Edit the contents of a pull request' \
'close:Close a pull request, without merging' \
'merge:Merge a pull request' \
'browse:Open a pull request in your browser' \
    )
    _describe -t commands 'fj help pr commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__pr__subcmd__assign_commands] )) ||
_fj__subcmd__help__subcmd__pr__subcmd__assign_commands() {
    local commands; commands=()
    _describe -t commands 'fj help pr assign commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__pr__subcmd__browse_commands] )) ||
_fj__subcmd__help__subcmd__pr__subcmd__browse_commands() {
    local commands; commands=()
    _describe -t commands 'fj help pr browse commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__pr__subcmd__checkout_commands] )) ||
_fj__subcmd__help__subcmd__pr__subcmd__checkout_commands() {
    local commands; commands=()
    _describe -t commands 'fj help pr checkout commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__pr__subcmd__close_commands] )) ||
_fj__subcmd__help__subcmd__pr__subcmd__close_commands() {
    local commands; commands=()
    _describe -t commands 'fj help pr close commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__pr__subcmd__comment_commands] )) ||
_fj__subcmd__help__subcmd__pr__subcmd__comment_commands() {
    local commands; commands=()
    _describe -t commands 'fj help pr comment commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__pr__subcmd__create_commands] )) ||
_fj__subcmd__help__subcmd__pr__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj help pr create commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__pr__subcmd__edit_commands] )) ||
_fj__subcmd__help__subcmd__pr__subcmd__edit_commands() {
    local commands; commands=(
'title:Edit the title' \
'body:Edit the text body' \
'comment:Edit a comment' \
'labels:' \
    )
    _describe -t commands 'fj help pr edit commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__pr__subcmd__edit__subcmd__body_commands] )) ||
_fj__subcmd__help__subcmd__pr__subcmd__edit__subcmd__body_commands() {
    local commands; commands=()
    _describe -t commands 'fj help pr edit body commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__pr__subcmd__edit__subcmd__comment_commands] )) ||
_fj__subcmd__help__subcmd__pr__subcmd__edit__subcmd__comment_commands() {
    local commands; commands=()
    _describe -t commands 'fj help pr edit comment commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__pr__subcmd__edit__subcmd__labels_commands] )) ||
_fj__subcmd__help__subcmd__pr__subcmd__edit__subcmd__labels_commands() {
    local commands; commands=()
    _describe -t commands 'fj help pr edit labels commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__pr__subcmd__edit__subcmd__title_commands] )) ||
_fj__subcmd__help__subcmd__pr__subcmd__edit__subcmd__title_commands() {
    local commands; commands=()
    _describe -t commands 'fj help pr edit title commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__pr__subcmd__merge_commands] )) ||
_fj__subcmd__help__subcmd__pr__subcmd__merge_commands() {
    local commands; commands=()
    _describe -t commands 'fj help pr merge commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__pr__subcmd__search_commands] )) ||
_fj__subcmd__help__subcmd__pr__subcmd__search_commands() {
    local commands; commands=()
    _describe -t commands 'fj help pr search commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__pr__subcmd__status_commands] )) ||
_fj__subcmd__help__subcmd__pr__subcmd__status_commands() {
    local commands; commands=()
    _describe -t commands 'fj help pr status commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__pr__subcmd__unassign_commands] )) ||
_fj__subcmd__help__subcmd__pr__subcmd__unassign_commands() {
    local commands; commands=()
    _describe -t commands 'fj help pr unassign commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__pr__subcmd__view_commands] )) ||
_fj__subcmd__help__subcmd__pr__subcmd__view_commands() {
    local commands; commands=(
'body:View the title and body of a pull request' \
'comment:View a comment on a pull request' \
'comments:View all comments on a pull request' \
'labels:View the labels applied to a pull request' \
'diff:View the diff between the base and head branches of a pull request' \
'files:View the files changed in a pull request' \
'commits:View the commits in a pull request' \
    )
    _describe -t commands 'fj help pr view commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__pr__subcmd__view__subcmd__body_commands] )) ||
_fj__subcmd__help__subcmd__pr__subcmd__view__subcmd__body_commands() {
    local commands; commands=()
    _describe -t commands 'fj help pr view body commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__pr__subcmd__view__subcmd__comment_commands] )) ||
_fj__subcmd__help__subcmd__pr__subcmd__view__subcmd__comment_commands() {
    local commands; commands=()
    _describe -t commands 'fj help pr view comment commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__pr__subcmd__view__subcmd__comments_commands] )) ||
_fj__subcmd__help__subcmd__pr__subcmd__view__subcmd__comments_commands() {
    local commands; commands=()
    _describe -t commands 'fj help pr view comments commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__pr__subcmd__view__subcmd__commits_commands] )) ||
_fj__subcmd__help__subcmd__pr__subcmd__view__subcmd__commits_commands() {
    local commands; commands=()
    _describe -t commands 'fj help pr view commits commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__pr__subcmd__view__subcmd__diff_commands] )) ||
_fj__subcmd__help__subcmd__pr__subcmd__view__subcmd__diff_commands() {
    local commands; commands=()
    _describe -t commands 'fj help pr view diff commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__pr__subcmd__view__subcmd__files_commands] )) ||
_fj__subcmd__help__subcmd__pr__subcmd__view__subcmd__files_commands() {
    local commands; commands=()
    _describe -t commands 'fj help pr view files commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__pr__subcmd__view__subcmd__labels_commands] )) ||
_fj__subcmd__help__subcmd__pr__subcmd__view__subcmd__labels_commands() {
    local commands; commands=()
    _describe -t commands 'fj help pr view labels commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__release_commands] )) ||
_fj__subcmd__help__subcmd__release_commands() {
    local commands; commands=(
'create:Create a new release' \
'edit:Edit a release'\''s info' \
'delete:Delete a release' \
'list:List all the releases on a repo' \
'view:View a release'\''s info' \
'browse:Open a release in your browser' \
'asset:Commands on a release'\''s attached files' \
    )
    _describe -t commands 'fj help release commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__release__subcmd__asset_commands] )) ||
_fj__subcmd__help__subcmd__release__subcmd__asset_commands() {
    local commands; commands=(
'create:Create a new attachment on a release' \
'delete:Remove an attachment from a release' \
'download:Download an attached file' \
    )
    _describe -t commands 'fj help release asset commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__release__subcmd__asset__subcmd__create_commands] )) ||
_fj__subcmd__help__subcmd__release__subcmd__asset__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj help release asset create commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__release__subcmd__asset__subcmd__delete_commands] )) ||
_fj__subcmd__help__subcmd__release__subcmd__asset__subcmd__delete_commands() {
    local commands; commands=()
    _describe -t commands 'fj help release asset delete commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__release__subcmd__asset__subcmd__download_commands] )) ||
_fj__subcmd__help__subcmd__release__subcmd__asset__subcmd__download_commands() {
    local commands; commands=()
    _describe -t commands 'fj help release asset download commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__release__subcmd__browse_commands] )) ||
_fj__subcmd__help__subcmd__release__subcmd__browse_commands() {
    local commands; commands=()
    _describe -t commands 'fj help release browse commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__release__subcmd__create_commands] )) ||
_fj__subcmd__help__subcmd__release__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj help release create commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__release__subcmd__delete_commands] )) ||
_fj__subcmd__help__subcmd__release__subcmd__delete_commands() {
    local commands; commands=()
    _describe -t commands 'fj help release delete commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__release__subcmd__edit_commands] )) ||
_fj__subcmd__help__subcmd__release__subcmd__edit_commands() {
    local commands; commands=()
    _describe -t commands 'fj help release edit commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__release__subcmd__list_commands] )) ||
_fj__subcmd__help__subcmd__release__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj help release list commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__release__subcmd__view_commands] )) ||
_fj__subcmd__help__subcmd__release__subcmd__view_commands() {
    local commands; commands=()
    _describe -t commands 'fj help release view commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__repo_commands] )) ||
_fj__subcmd__help__subcmd__repo_commands() {
    local commands; commands=(
'create:Creates a new repository' \
'fork:Fork a repository onto your account' \
'migrate:' \
'view:View a repo'\''s info' \
'readme:View a repo'\''s README' \
'clone:Clone a repo'\''s code locally' \
'star:Add a star to a repo' \
'unstar:Take away a star from a repo' \
'delete:Delete a repository' \
'browse:Open a repository'\''s page in your browser' \
'labels:Manage a repo'\''s issue labels' \
'edit:Edit a repository'\''s properties' \
'units:Manage a repo'\''s units' \
    )
    _describe -t commands 'fj help repo commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__repo__subcmd__browse_commands] )) ||
_fj__subcmd__help__subcmd__repo__subcmd__browse_commands() {
    local commands; commands=()
    _describe -t commands 'fj help repo browse commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__repo__subcmd__clone_commands] )) ||
_fj__subcmd__help__subcmd__repo__subcmd__clone_commands() {
    local commands; commands=()
    _describe -t commands 'fj help repo clone commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__repo__subcmd__create_commands] )) ||
_fj__subcmd__help__subcmd__repo__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj help repo create commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__repo__subcmd__delete_commands] )) ||
_fj__subcmd__help__subcmd__repo__subcmd__delete_commands() {
    local commands; commands=()
    _describe -t commands 'fj help repo delete commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__repo__subcmd__edit_commands] )) ||
_fj__subcmd__help__subcmd__repo__subcmd__edit_commands() {
    local commands; commands=()
    _describe -t commands 'fj help repo edit commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__repo__subcmd__fork_commands] )) ||
_fj__subcmd__help__subcmd__repo__subcmd__fork_commands() {
    local commands; commands=()
    _describe -t commands 'fj help repo fork commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__repo__subcmd__labels_commands] )) ||
_fj__subcmd__help__subcmd__repo__subcmd__labels_commands() {
    local commands; commands=(
'view:Show a repo'\''s labels' \
'create:Create a new label' \
'delete:Delete a label' \
'edit:Edit a label' \
    )
    _describe -t commands 'fj help repo labels commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__repo__subcmd__labels__subcmd__create_commands] )) ||
_fj__subcmd__help__subcmd__repo__subcmd__labels__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj help repo labels create commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__repo__subcmd__labels__subcmd__delete_commands] )) ||
_fj__subcmd__help__subcmd__repo__subcmd__labels__subcmd__delete_commands() {
    local commands; commands=()
    _describe -t commands 'fj help repo labels delete commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__repo__subcmd__labels__subcmd__edit_commands] )) ||
_fj__subcmd__help__subcmd__repo__subcmd__labels__subcmd__edit_commands() {
    local commands; commands=()
    _describe -t commands 'fj help repo labels edit commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__repo__subcmd__labels__subcmd__view_commands] )) ||
_fj__subcmd__help__subcmd__repo__subcmd__labels__subcmd__view_commands() {
    local commands; commands=()
    _describe -t commands 'fj help repo labels view commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__repo__subcmd__migrate_commands] )) ||
_fj__subcmd__help__subcmd__repo__subcmd__migrate_commands() {
    local commands; commands=()
    _describe -t commands 'fj help repo migrate commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__repo__subcmd__readme_commands] )) ||
_fj__subcmd__help__subcmd__repo__subcmd__readme_commands() {
    local commands; commands=()
    _describe -t commands 'fj help repo readme commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__repo__subcmd__star_commands] )) ||
_fj__subcmd__help__subcmd__repo__subcmd__star_commands() {
    local commands; commands=()
    _describe -t commands 'fj help repo star commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__repo__subcmd__units_commands] )) ||
_fj__subcmd__help__subcmd__repo__subcmd__units_commands() {
    local commands; commands=(
'issues:Manage the issues unit' \
'prs:Manage the pull requests unit' \
'actions:Manage the actions unit' \
'wiki:Manage the wiki unit' \
'packages:Manage the packages unit' \
'projects:Manage the projects unit' \
'releases:Manage the releases unit' \
    )
    _describe -t commands 'fj help repo units commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__repo__subcmd__units__subcmd__actions_commands] )) ||
_fj__subcmd__help__subcmd__repo__subcmd__units__subcmd__actions_commands() {
    local commands; commands=()
    _describe -t commands 'fj help repo units actions commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__repo__subcmd__units__subcmd__issues_commands] )) ||
_fj__subcmd__help__subcmd__repo__subcmd__units__subcmd__issues_commands() {
    local commands; commands=()
    _describe -t commands 'fj help repo units issues commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__repo__subcmd__units__subcmd__packages_commands] )) ||
_fj__subcmd__help__subcmd__repo__subcmd__units__subcmd__packages_commands() {
    local commands; commands=()
    _describe -t commands 'fj help repo units packages commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__repo__subcmd__units__subcmd__projects_commands] )) ||
_fj__subcmd__help__subcmd__repo__subcmd__units__subcmd__projects_commands() {
    local commands; commands=()
    _describe -t commands 'fj help repo units projects commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__repo__subcmd__units__subcmd__prs_commands] )) ||
_fj__subcmd__help__subcmd__repo__subcmd__units__subcmd__prs_commands() {
    local commands; commands=()
    _describe -t commands 'fj help repo units prs commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__repo__subcmd__units__subcmd__releases_commands] )) ||
_fj__subcmd__help__subcmd__repo__subcmd__units__subcmd__releases_commands() {
    local commands; commands=()
    _describe -t commands 'fj help repo units releases commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__repo__subcmd__units__subcmd__wiki_commands] )) ||
_fj__subcmd__help__subcmd__repo__subcmd__units__subcmd__wiki_commands() {
    local commands; commands=()
    _describe -t commands 'fj help repo units wiki commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__repo__subcmd__unstar_commands] )) ||
_fj__subcmd__help__subcmd__repo__subcmd__unstar_commands() {
    local commands; commands=()
    _describe -t commands 'fj help repo unstar commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__repo__subcmd__view_commands] )) ||
_fj__subcmd__help__subcmd__repo__subcmd__view_commands() {
    local commands; commands=()
    _describe -t commands 'fj help repo view commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__tag_commands] )) ||
_fj__subcmd__help__subcmd__tag_commands() {
    local commands; commands=(
'create:Create a new tag' \
'delete:Delete a tag' \
'list:List all the tags on a repo' \
'view:View a tag'\''s info' \
    )
    _describe -t commands 'fj help tag commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__tag__subcmd__create_commands] )) ||
_fj__subcmd__help__subcmd__tag__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj help tag create commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__tag__subcmd__delete_commands] )) ||
_fj__subcmd__help__subcmd__tag__subcmd__delete_commands() {
    local commands; commands=()
    _describe -t commands 'fj help tag delete commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__tag__subcmd__list_commands] )) ||
_fj__subcmd__help__subcmd__tag__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj help tag list commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__tag__subcmd__view_commands] )) ||
_fj__subcmd__help__subcmd__tag__subcmd__view_commands() {
    local commands; commands=()
    _describe -t commands 'fj help tag view commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__user_commands] )) ||
_fj__subcmd__help__subcmd__user_commands() {
    local commands; commands=(
'search:Search for a user by username' \
'view:View a user'\''s profile page' \
'browse:Open a user'\''s profile page in your browser' \
'follow:Follow a user' \
'unfollow:Unfollow a user' \
'following:List everyone a user'\''s follows' \
'followers:List a user'\''s followers' \
'block:Block a user' \
'unblock:Unblock a user' \
'repos:List a user'\''s repositories' \
'orgs:List the organizations a user is a member of' \
'activity:List a user'\''s recent activity' \
'edit:Edit your user settings' \
'key:Manage SSH keys' \
'gpg:Manage GPG keys' \
    )
    _describe -t commands 'fj help user commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__user__subcmd__activity_commands] )) ||
_fj__subcmd__help__subcmd__user__subcmd__activity_commands() {
    local commands; commands=()
    _describe -t commands 'fj help user activity commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__user__subcmd__block_commands] )) ||
_fj__subcmd__help__subcmd__user__subcmd__block_commands() {
    local commands; commands=()
    _describe -t commands 'fj help user block commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__user__subcmd__browse_commands] )) ||
_fj__subcmd__help__subcmd__user__subcmd__browse_commands() {
    local commands; commands=()
    _describe -t commands 'fj help user browse commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__user__subcmd__edit_commands] )) ||
_fj__subcmd__help__subcmd__user__subcmd__edit_commands() {
    local commands; commands=(
'bio:Set your bio' \
'name:Set your full name' \
'pronouns:Set your pronouns' \
'location:Set your activity visibility' \
'activity:Set your activity visibility' \
'email:Manage the email addresses associated with your account' \
'website:Set your linked website' \
    )
    _describe -t commands 'fj help user edit commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__user__subcmd__edit__subcmd__activity_commands] )) ||
_fj__subcmd__help__subcmd__user__subcmd__edit__subcmd__activity_commands() {
    local commands; commands=()
    _describe -t commands 'fj help user edit activity commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__user__subcmd__edit__subcmd__bio_commands] )) ||
_fj__subcmd__help__subcmd__user__subcmd__edit__subcmd__bio_commands() {
    local commands; commands=()
    _describe -t commands 'fj help user edit bio commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__user__subcmd__edit__subcmd__email_commands] )) ||
_fj__subcmd__help__subcmd__user__subcmd__edit__subcmd__email_commands() {
    local commands; commands=()
    _describe -t commands 'fj help user edit email commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__user__subcmd__edit__subcmd__location_commands] )) ||
_fj__subcmd__help__subcmd__user__subcmd__edit__subcmd__location_commands() {
    local commands; commands=()
    _describe -t commands 'fj help user edit location commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__user__subcmd__edit__subcmd__name_commands] )) ||
_fj__subcmd__help__subcmd__user__subcmd__edit__subcmd__name_commands() {
    local commands; commands=()
    _describe -t commands 'fj help user edit name commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__user__subcmd__edit__subcmd__pronouns_commands] )) ||
_fj__subcmd__help__subcmd__user__subcmd__edit__subcmd__pronouns_commands() {
    local commands; commands=()
    _describe -t commands 'fj help user edit pronouns commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__user__subcmd__edit__subcmd__website_commands] )) ||
_fj__subcmd__help__subcmd__user__subcmd__edit__subcmd__website_commands() {
    local commands; commands=()
    _describe -t commands 'fj help user edit website commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__user__subcmd__follow_commands] )) ||
_fj__subcmd__help__subcmd__user__subcmd__follow_commands() {
    local commands; commands=()
    _describe -t commands 'fj help user follow commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__user__subcmd__followers_commands] )) ||
_fj__subcmd__help__subcmd__user__subcmd__followers_commands() {
    local commands; commands=()
    _describe -t commands 'fj help user followers commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__user__subcmd__following_commands] )) ||
_fj__subcmd__help__subcmd__user__subcmd__following_commands() {
    local commands; commands=()
    _describe -t commands 'fj help user following commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__user__subcmd__gpg_commands] )) ||
_fj__subcmd__help__subcmd__user__subcmd__gpg_commands() {
    local commands; commands=(
'list:List your GPG keys' \
'view:Show details about a GPG key' \
'delete:Deletes a GPG key. This will un-verify all commits signed with that key!' \
'upload:Upload a new GPG key from your local keyring. This command requires \`gpg\` to be installed' \
'verify:Verifies a GPG key. You need to have the to-be-verified key installed locally in order to sign some data with it. This command requires \`gpg\` to be installed' \
    )
    _describe -t commands 'fj help user gpg commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__user__subcmd__gpg__subcmd__delete_commands] )) ||
_fj__subcmd__help__subcmd__user__subcmd__gpg__subcmd__delete_commands() {
    local commands; commands=()
    _describe -t commands 'fj help user gpg delete commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__user__subcmd__gpg__subcmd__list_commands] )) ||
_fj__subcmd__help__subcmd__user__subcmd__gpg__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj help user gpg list commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__user__subcmd__gpg__subcmd__upload_commands] )) ||
_fj__subcmd__help__subcmd__user__subcmd__gpg__subcmd__upload_commands() {
    local commands; commands=()
    _describe -t commands 'fj help user gpg upload commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__user__subcmd__gpg__subcmd__verify_commands] )) ||
_fj__subcmd__help__subcmd__user__subcmd__gpg__subcmd__verify_commands() {
    local commands; commands=()
    _describe -t commands 'fj help user gpg verify commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__user__subcmd__gpg__subcmd__view_commands] )) ||
_fj__subcmd__help__subcmd__user__subcmd__gpg__subcmd__view_commands() {
    local commands; commands=()
    _describe -t commands 'fj help user gpg view commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__user__subcmd__key_commands] )) ||
_fj__subcmd__help__subcmd__user__subcmd__key_commands() {
    local commands; commands=(
'list:List your SSH keys' \
'view:View an SSH key' \
'delete:Delete an SSH key' \
'upload:Upload an SSH key' \
    )
    _describe -t commands 'fj help user key commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__user__subcmd__key__subcmd__delete_commands] )) ||
_fj__subcmd__help__subcmd__user__subcmd__key__subcmd__delete_commands() {
    local commands; commands=()
    _describe -t commands 'fj help user key delete commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__user__subcmd__key__subcmd__list_commands] )) ||
_fj__subcmd__help__subcmd__user__subcmd__key__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj help user key list commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__user__subcmd__key__subcmd__upload_commands] )) ||
_fj__subcmd__help__subcmd__user__subcmd__key__subcmd__upload_commands() {
    local commands; commands=()
    _describe -t commands 'fj help user key upload commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__user__subcmd__key__subcmd__view_commands] )) ||
_fj__subcmd__help__subcmd__user__subcmd__key__subcmd__view_commands() {
    local commands; commands=()
    _describe -t commands 'fj help user key view commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__user__subcmd__orgs_commands] )) ||
_fj__subcmd__help__subcmd__user__subcmd__orgs_commands() {
    local commands; commands=()
    _describe -t commands 'fj help user orgs commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__user__subcmd__repos_commands] )) ||
_fj__subcmd__help__subcmd__user__subcmd__repos_commands() {
    local commands; commands=()
    _describe -t commands 'fj help user repos commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__user__subcmd__search_commands] )) ||
_fj__subcmd__help__subcmd__user__subcmd__search_commands() {
    local commands; commands=()
    _describe -t commands 'fj help user search commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__user__subcmd__unblock_commands] )) ||
_fj__subcmd__help__subcmd__user__subcmd__unblock_commands() {
    local commands; commands=()
    _describe -t commands 'fj help user unblock commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__user__subcmd__unfollow_commands] )) ||
_fj__subcmd__help__subcmd__user__subcmd__unfollow_commands() {
    local commands; commands=()
    _describe -t commands 'fj help user unfollow commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__user__subcmd__view_commands] )) ||
_fj__subcmd__help__subcmd__user__subcmd__view_commands() {
    local commands; commands=()
    _describe -t commands 'fj help user view commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__version_commands] )) ||
_fj__subcmd__help__subcmd__version_commands() {
    local commands; commands=()
    _describe -t commands 'fj help version commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__whoami_commands] )) ||
_fj__subcmd__help__subcmd__whoami_commands() {
    local commands; commands=()
    _describe -t commands 'fj help whoami commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__wiki_commands] )) ||
_fj__subcmd__help__subcmd__wiki_commands() {
    local commands; commands=(
'contents:' \
'view:' \
'clone:' \
'browse:' \
    )
    _describe -t commands 'fj help wiki commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__wiki__subcmd__browse_commands] )) ||
_fj__subcmd__help__subcmd__wiki__subcmd__browse_commands() {
    local commands; commands=()
    _describe -t commands 'fj help wiki browse commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__wiki__subcmd__clone_commands] )) ||
_fj__subcmd__help__subcmd__wiki__subcmd__clone_commands() {
    local commands; commands=()
    _describe -t commands 'fj help wiki clone commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__wiki__subcmd__contents_commands] )) ||
_fj__subcmd__help__subcmd__wiki__subcmd__contents_commands() {
    local commands; commands=()
    _describe -t commands 'fj help wiki contents commands' commands "$@"
}
(( $+functions[_fj__subcmd__help__subcmd__wiki__subcmd__view_commands] )) ||
_fj__subcmd__help__subcmd__wiki__subcmd__view_commands() {
    local commands; commands=()
    _describe -t commands 'fj help wiki view commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue_commands] )) ||
_fj__subcmd__issue_commands() {
    local commands; commands=(
'create:Create a new issue on a repo' \
'edit:Edit an issue' \
'comment:Add a comment on an issue' \
'assign:Assign users to an issue' \
'unassign:Unassign users from an issue' \
'close:Close an issue' \
'search:Search for an issue in a repo' \
'view:View an issue'\''s info' \
'templates:List the issue templates in a repo' \
'browse:Open an issue in your browser' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj issue commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__assign_commands] )) ||
_fj__subcmd__issue__subcmd__assign_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue assign commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__browse_commands] )) ||
_fj__subcmd__issue__subcmd__browse_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue browse commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__close_commands] )) ||
_fj__subcmd__issue__subcmd__close_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue close commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__comment_commands] )) ||
_fj__subcmd__issue__subcmd__comment_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue comment commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__create_commands] )) ||
_fj__subcmd__issue__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue create commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__edit_commands] )) ||
_fj__subcmd__issue__subcmd__edit_commands() {
    local commands; commands=(
'title:Edit an issue'\''s title' \
'body:Edit an issue'\''s text content' \
'comment:Edit a comment on an issue' \
'labels:Edit an issue'\''s labels' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj issue edit commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__edit__subcmd__body_commands] )) ||
_fj__subcmd__issue__subcmd__edit__subcmd__body_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue edit body commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__edit__subcmd__comment_commands] )) ||
_fj__subcmd__issue__subcmd__edit__subcmd__comment_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue edit comment commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__edit__subcmd__help_commands] )) ||
_fj__subcmd__issue__subcmd__edit__subcmd__help_commands() {
    local commands; commands=(
'title:Edit an issue'\''s title' \
'body:Edit an issue'\''s text content' \
'comment:Edit a comment on an issue' \
'labels:Edit an issue'\''s labels' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj issue edit help commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__edit__subcmd__help__subcmd__body_commands] )) ||
_fj__subcmd__issue__subcmd__edit__subcmd__help__subcmd__body_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue edit help body commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__edit__subcmd__help__subcmd__comment_commands] )) ||
_fj__subcmd__issue__subcmd__edit__subcmd__help__subcmd__comment_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue edit help comment commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__edit__subcmd__help__subcmd__help_commands] )) ||
_fj__subcmd__issue__subcmd__edit__subcmd__help__subcmd__help_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue edit help help commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__edit__subcmd__help__subcmd__labels_commands] )) ||
_fj__subcmd__issue__subcmd__edit__subcmd__help__subcmd__labels_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue edit help labels commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__edit__subcmd__help__subcmd__title_commands] )) ||
_fj__subcmd__issue__subcmd__edit__subcmd__help__subcmd__title_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue edit help title commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__edit__subcmd__labels_commands] )) ||
_fj__subcmd__issue__subcmd__edit__subcmd__labels_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue edit labels commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__edit__subcmd__title_commands] )) ||
_fj__subcmd__issue__subcmd__edit__subcmd__title_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue edit title commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__help_commands] )) ||
_fj__subcmd__issue__subcmd__help_commands() {
    local commands; commands=(
'create:Create a new issue on a repo' \
'edit:Edit an issue' \
'comment:Add a comment on an issue' \
'assign:Assign users to an issue' \
'unassign:Unassign users from an issue' \
'close:Close an issue' \
'search:Search for an issue in a repo' \
'view:View an issue'\''s info' \
'templates:List the issue templates in a repo' \
'browse:Open an issue in your browser' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj issue help commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__help__subcmd__assign_commands] )) ||
_fj__subcmd__issue__subcmd__help__subcmd__assign_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue help assign commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__help__subcmd__browse_commands] )) ||
_fj__subcmd__issue__subcmd__help__subcmd__browse_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue help browse commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__help__subcmd__close_commands] )) ||
_fj__subcmd__issue__subcmd__help__subcmd__close_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue help close commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__help__subcmd__comment_commands] )) ||
_fj__subcmd__issue__subcmd__help__subcmd__comment_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue help comment commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__help__subcmd__create_commands] )) ||
_fj__subcmd__issue__subcmd__help__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue help create commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__help__subcmd__edit_commands] )) ||
_fj__subcmd__issue__subcmd__help__subcmd__edit_commands() {
    local commands; commands=(
'title:Edit an issue'\''s title' \
'body:Edit an issue'\''s text content' \
'comment:Edit a comment on an issue' \
'labels:Edit an issue'\''s labels' \
    )
    _describe -t commands 'fj issue help edit commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__help__subcmd__edit__subcmd__body_commands] )) ||
_fj__subcmd__issue__subcmd__help__subcmd__edit__subcmd__body_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue help edit body commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__help__subcmd__edit__subcmd__comment_commands] )) ||
_fj__subcmd__issue__subcmd__help__subcmd__edit__subcmd__comment_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue help edit comment commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__help__subcmd__edit__subcmd__labels_commands] )) ||
_fj__subcmd__issue__subcmd__help__subcmd__edit__subcmd__labels_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue help edit labels commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__help__subcmd__edit__subcmd__title_commands] )) ||
_fj__subcmd__issue__subcmd__help__subcmd__edit__subcmd__title_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue help edit title commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__help__subcmd__help_commands] )) ||
_fj__subcmd__issue__subcmd__help__subcmd__help_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue help help commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__help__subcmd__search_commands] )) ||
_fj__subcmd__issue__subcmd__help__subcmd__search_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue help search commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__help__subcmd__templates_commands] )) ||
_fj__subcmd__issue__subcmd__help__subcmd__templates_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue help templates commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__help__subcmd__unassign_commands] )) ||
_fj__subcmd__issue__subcmd__help__subcmd__unassign_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue help unassign commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__help__subcmd__view_commands] )) ||
_fj__subcmd__issue__subcmd__help__subcmd__view_commands() {
    local commands; commands=(
'body:View an issue'\''s title and body. The default' \
'comment:View a specific' \
'comments:List every comment' \
    )
    _describe -t commands 'fj issue help view commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__help__subcmd__view__subcmd__body_commands] )) ||
_fj__subcmd__issue__subcmd__help__subcmd__view__subcmd__body_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue help view body commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__help__subcmd__view__subcmd__comment_commands] )) ||
_fj__subcmd__issue__subcmd__help__subcmd__view__subcmd__comment_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue help view comment commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__help__subcmd__view__subcmd__comments_commands] )) ||
_fj__subcmd__issue__subcmd__help__subcmd__view__subcmd__comments_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue help view comments commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__search_commands] )) ||
_fj__subcmd__issue__subcmd__search_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue search commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__templates_commands] )) ||
_fj__subcmd__issue__subcmd__templates_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue templates commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__unassign_commands] )) ||
_fj__subcmd__issue__subcmd__unassign_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue unassign commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__view_commands] )) ||
_fj__subcmd__issue__subcmd__view_commands() {
    local commands; commands=(
'body:View an issue'\''s title and body. The default' \
'comment:View a specific' \
'comments:List every comment' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj issue view commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__view__subcmd__body_commands] )) ||
_fj__subcmd__issue__subcmd__view__subcmd__body_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue view body commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__view__subcmd__comment_commands] )) ||
_fj__subcmd__issue__subcmd__view__subcmd__comment_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue view comment commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__view__subcmd__comments_commands] )) ||
_fj__subcmd__issue__subcmd__view__subcmd__comments_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue view comments commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__view__subcmd__help_commands] )) ||
_fj__subcmd__issue__subcmd__view__subcmd__help_commands() {
    local commands; commands=(
'body:View an issue'\''s title and body. The default' \
'comment:View a specific' \
'comments:List every comment' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj issue view help commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__view__subcmd__help__subcmd__body_commands] )) ||
_fj__subcmd__issue__subcmd__view__subcmd__help__subcmd__body_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue view help body commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__view__subcmd__help__subcmd__comment_commands] )) ||
_fj__subcmd__issue__subcmd__view__subcmd__help__subcmd__comment_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue view help comment commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__view__subcmd__help__subcmd__comments_commands] )) ||
_fj__subcmd__issue__subcmd__view__subcmd__help__subcmd__comments_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue view help comments commands' commands "$@"
}
(( $+functions[_fj__subcmd__issue__subcmd__view__subcmd__help__subcmd__help_commands] )) ||
_fj__subcmd__issue__subcmd__view__subcmd__help__subcmd__help_commands() {
    local commands; commands=()
    _describe -t commands 'fj issue view help help commands' commands "$@"
}
(( $+functions[_fj__subcmd__org_commands] )) ||
_fj__subcmd__org_commands() {
    local commands; commands=(
'list:List all organizations' \
'view:View info about an organization' \
'create:Create a new organization' \
'edit:Edit an organization'\''s information' \
'activity:View the activity in an organization' \
'members:List the members of an organization' \
'visibility:View and change the visibility of your membership in an organization' \
'team:' \
'label:' \
'repo:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj org commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__activity_commands] )) ||
_fj__subcmd__org__subcmd__activity_commands() {
    local commands; commands=()
    _describe -t commands 'fj org activity commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__create_commands] )) ||
_fj__subcmd__org__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj org create commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__edit_commands] )) ||
_fj__subcmd__org__subcmd__edit_commands() {
    local commands; commands=()
    _describe -t commands 'fj org edit commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__help_commands] )) ||
_fj__subcmd__org__subcmd__help_commands() {
    local commands; commands=(
'list:List all organizations' \
'view:View info about an organization' \
'create:Create a new organization' \
'edit:Edit an organization'\''s information' \
'activity:View the activity in an organization' \
'members:List the members of an organization' \
'visibility:View and change the visibility of your membership in an organization' \
'team:' \
'label:' \
'repo:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj org help commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__help__subcmd__activity_commands] )) ||
_fj__subcmd__org__subcmd__help__subcmd__activity_commands() {
    local commands; commands=()
    _describe -t commands 'fj org help activity commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__help__subcmd__create_commands] )) ||
_fj__subcmd__org__subcmd__help__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj org help create commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__help__subcmd__edit_commands] )) ||
_fj__subcmd__org__subcmd__help__subcmd__edit_commands() {
    local commands; commands=()
    _describe -t commands 'fj org help edit commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__help__subcmd__help_commands] )) ||
_fj__subcmd__org__subcmd__help__subcmd__help_commands() {
    local commands; commands=()
    _describe -t commands 'fj org help help commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__help__subcmd__label_commands] )) ||
_fj__subcmd__org__subcmd__help__subcmd__label_commands() {
    local commands; commands=(
'list:List all the issue labels an organization uses' \
'add:Add a new issue label to an organization' \
'edit:Edit an issue label an organization uses' \
'rm:Remove an issue label from an organization' \
    )
    _describe -t commands 'fj org help label commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__help__subcmd__label__subcmd__add_commands] )) ||
_fj__subcmd__org__subcmd__help__subcmd__label__subcmd__add_commands() {
    local commands; commands=()
    _describe -t commands 'fj org help label add commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__help__subcmd__label__subcmd__edit_commands] )) ||
_fj__subcmd__org__subcmd__help__subcmd__label__subcmd__edit_commands() {
    local commands; commands=()
    _describe -t commands 'fj org help label edit commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__help__subcmd__label__subcmd__list_commands] )) ||
_fj__subcmd__org__subcmd__help__subcmd__label__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj org help label list commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__help__subcmd__label__subcmd__rm_commands] )) ||
_fj__subcmd__org__subcmd__help__subcmd__label__subcmd__rm_commands() {
    local commands; commands=()
    _describe -t commands 'fj org help label rm commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__help__subcmd__list_commands] )) ||
_fj__subcmd__org__subcmd__help__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj org help list commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__help__subcmd__members_commands] )) ||
_fj__subcmd__org__subcmd__help__subcmd__members_commands() {
    local commands; commands=()
    _describe -t commands 'fj org help members commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__help__subcmd__repo_commands] )) ||
_fj__subcmd__org__subcmd__help__subcmd__repo_commands() {
    local commands; commands=(
'list:List all the repos owned by this organization' \
'create:Create a new repository in this organization' \
    )
    _describe -t commands 'fj org help repo commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__help__subcmd__repo__subcmd__create_commands] )) ||
_fj__subcmd__org__subcmd__help__subcmd__repo__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj org help repo create commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__help__subcmd__repo__subcmd__list_commands] )) ||
_fj__subcmd__org__subcmd__help__subcmd__repo__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj org help repo list commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__help__subcmd__team_commands] )) ||
_fj__subcmd__org__subcmd__help__subcmd__team_commands() {
    local commands; commands=(
'list:View all the teams in an organization' \
'view:View info about a single team' \
'create:Create a new team' \
'edit:Edit a team'\''s information and permissions' \
'delete:Delete a team from an organization' \
'repo:' \
'member:' \
    )
    _describe -t commands 'fj org help team commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__help__subcmd__team__subcmd__create_commands] )) ||
_fj__subcmd__org__subcmd__help__subcmd__team__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj org help team create commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__help__subcmd__team__subcmd__delete_commands] )) ||
_fj__subcmd__org__subcmd__help__subcmd__team__subcmd__delete_commands() {
    local commands; commands=()
    _describe -t commands 'fj org help team delete commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__help__subcmd__team__subcmd__edit_commands] )) ||
_fj__subcmd__org__subcmd__help__subcmd__team__subcmd__edit_commands() {
    local commands; commands=()
    _describe -t commands 'fj org help team edit commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__help__subcmd__team__subcmd__list_commands] )) ||
_fj__subcmd__org__subcmd__help__subcmd__team__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj org help team list commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__help__subcmd__team__subcmd__member_commands] )) ||
_fj__subcmd__org__subcmd__help__subcmd__team__subcmd__member_commands() {
    local commands; commands=(
'list:List all the members of a team' \
'add:Add someone to a team' \
'rm:Remove someone from a team' \
    )
    _describe -t commands 'fj org help team member commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__help__subcmd__team__subcmd__member__subcmd__add_commands] )) ||
_fj__subcmd__org__subcmd__help__subcmd__team__subcmd__member__subcmd__add_commands() {
    local commands; commands=()
    _describe -t commands 'fj org help team member add commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__help__subcmd__team__subcmd__member__subcmd__list_commands] )) ||
_fj__subcmd__org__subcmd__help__subcmd__team__subcmd__member__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj org help team member list commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__help__subcmd__team__subcmd__member__subcmd__rm_commands] )) ||
_fj__subcmd__org__subcmd__help__subcmd__team__subcmd__member__subcmd__rm_commands() {
    local commands; commands=()
    _describe -t commands 'fj org help team member rm commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__help__subcmd__team__subcmd__repo_commands] )) ||
_fj__subcmd__org__subcmd__help__subcmd__team__subcmd__repo_commands() {
    local commands; commands=(
'list:List all the repos this team can access' \
'add:Add access to an existing repo to a team' \
'rm:Remove access to a repo from a team' \
    )
    _describe -t commands 'fj org help team repo commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__help__subcmd__team__subcmd__repo__subcmd__add_commands] )) ||
_fj__subcmd__org__subcmd__help__subcmd__team__subcmd__repo__subcmd__add_commands() {
    local commands; commands=()
    _describe -t commands 'fj org help team repo add commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__help__subcmd__team__subcmd__repo__subcmd__list_commands] )) ||
_fj__subcmd__org__subcmd__help__subcmd__team__subcmd__repo__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj org help team repo list commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__help__subcmd__team__subcmd__repo__subcmd__rm_commands] )) ||
_fj__subcmd__org__subcmd__help__subcmd__team__subcmd__repo__subcmd__rm_commands() {
    local commands; commands=()
    _describe -t commands 'fj org help team repo rm commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__help__subcmd__team__subcmd__view_commands] )) ||
_fj__subcmd__org__subcmd__help__subcmd__team__subcmd__view_commands() {
    local commands; commands=()
    _describe -t commands 'fj org help team view commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__help__subcmd__view_commands] )) ||
_fj__subcmd__org__subcmd__help__subcmd__view_commands() {
    local commands; commands=()
    _describe -t commands 'fj org help view commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__help__subcmd__visibility_commands] )) ||
_fj__subcmd__org__subcmd__help__subcmd__visibility_commands() {
    local commands; commands=()
    _describe -t commands 'fj org help visibility commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__label_commands] )) ||
_fj__subcmd__org__subcmd__label_commands() {
    local commands; commands=(
'list:List all the issue labels an organization uses' \
'add:Add a new issue label to an organization' \
'edit:Edit an issue label an organization uses' \
'rm:Remove an issue label from an organization' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj org label commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__label__subcmd__add_commands] )) ||
_fj__subcmd__org__subcmd__label__subcmd__add_commands() {
    local commands; commands=()
    _describe -t commands 'fj org label add commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__label__subcmd__edit_commands] )) ||
_fj__subcmd__org__subcmd__label__subcmd__edit_commands() {
    local commands; commands=()
    _describe -t commands 'fj org label edit commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__label__subcmd__help_commands] )) ||
_fj__subcmd__org__subcmd__label__subcmd__help_commands() {
    local commands; commands=(
'list:List all the issue labels an organization uses' \
'add:Add a new issue label to an organization' \
'edit:Edit an issue label an organization uses' \
'rm:Remove an issue label from an organization' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj org label help commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__label__subcmd__help__subcmd__add_commands] )) ||
_fj__subcmd__org__subcmd__label__subcmd__help__subcmd__add_commands() {
    local commands; commands=()
    _describe -t commands 'fj org label help add commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__label__subcmd__help__subcmd__edit_commands] )) ||
_fj__subcmd__org__subcmd__label__subcmd__help__subcmd__edit_commands() {
    local commands; commands=()
    _describe -t commands 'fj org label help edit commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__label__subcmd__help__subcmd__help_commands] )) ||
_fj__subcmd__org__subcmd__label__subcmd__help__subcmd__help_commands() {
    local commands; commands=()
    _describe -t commands 'fj org label help help commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__label__subcmd__help__subcmd__list_commands] )) ||
_fj__subcmd__org__subcmd__label__subcmd__help__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj org label help list commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__label__subcmd__help__subcmd__rm_commands] )) ||
_fj__subcmd__org__subcmd__label__subcmd__help__subcmd__rm_commands() {
    local commands; commands=()
    _describe -t commands 'fj org label help rm commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__label__subcmd__list_commands] )) ||
_fj__subcmd__org__subcmd__label__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj org label list commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__label__subcmd__rm_commands] )) ||
_fj__subcmd__org__subcmd__label__subcmd__rm_commands() {
    local commands; commands=()
    _describe -t commands 'fj org label rm commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__list_commands] )) ||
_fj__subcmd__org__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj org list commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__members_commands] )) ||
_fj__subcmd__org__subcmd__members_commands() {
    local commands; commands=()
    _describe -t commands 'fj org members commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__repo_commands] )) ||
_fj__subcmd__org__subcmd__repo_commands() {
    local commands; commands=(
'list:List all the repos owned by this organization' \
'create:Create a new repository in this organization' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj org repo commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__repo__subcmd__create_commands] )) ||
_fj__subcmd__org__subcmd__repo__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj org repo create commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__repo__subcmd__help_commands] )) ||
_fj__subcmd__org__subcmd__repo__subcmd__help_commands() {
    local commands; commands=(
'list:List all the repos owned by this organization' \
'create:Create a new repository in this organization' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj org repo help commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__repo__subcmd__help__subcmd__create_commands] )) ||
_fj__subcmd__org__subcmd__repo__subcmd__help__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj org repo help create commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__repo__subcmd__help__subcmd__help_commands] )) ||
_fj__subcmd__org__subcmd__repo__subcmd__help__subcmd__help_commands() {
    local commands; commands=()
    _describe -t commands 'fj org repo help help commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__repo__subcmd__help__subcmd__list_commands] )) ||
_fj__subcmd__org__subcmd__repo__subcmd__help__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj org repo help list commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__repo__subcmd__list_commands] )) ||
_fj__subcmd__org__subcmd__repo__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj org repo list commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team_commands] )) ||
_fj__subcmd__org__subcmd__team_commands() {
    local commands; commands=(
'list:View all the teams in an organization' \
'view:View info about a single team' \
'create:Create a new team' \
'edit:Edit a team'\''s information and permissions' \
'delete:Delete a team from an organization' \
'repo:' \
'member:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj org team commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__create_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj org team create commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__delete_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__delete_commands() {
    local commands; commands=()
    _describe -t commands 'fj org team delete commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__edit_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__edit_commands() {
    local commands; commands=()
    _describe -t commands 'fj org team edit commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__help_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__help_commands() {
    local commands; commands=(
'list:View all the teams in an organization' \
'view:View info about a single team' \
'create:Create a new team' \
'edit:Edit a team'\''s information and permissions' \
'delete:Delete a team from an organization' \
'repo:' \
'member:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj org team help commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__help__subcmd__create_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__help__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj org team help create commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__help__subcmd__delete_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__help__subcmd__delete_commands() {
    local commands; commands=()
    _describe -t commands 'fj org team help delete commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__help__subcmd__edit_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__help__subcmd__edit_commands() {
    local commands; commands=()
    _describe -t commands 'fj org team help edit commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__help__subcmd__help_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__help__subcmd__help_commands() {
    local commands; commands=()
    _describe -t commands 'fj org team help help commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__help__subcmd__list_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__help__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj org team help list commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__help__subcmd__member_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__help__subcmd__member_commands() {
    local commands; commands=(
'list:List all the members of a team' \
'add:Add someone to a team' \
'rm:Remove someone from a team' \
    )
    _describe -t commands 'fj org team help member commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__help__subcmd__member__subcmd__add_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__help__subcmd__member__subcmd__add_commands() {
    local commands; commands=()
    _describe -t commands 'fj org team help member add commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__help__subcmd__member__subcmd__list_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__help__subcmd__member__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj org team help member list commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__help__subcmd__member__subcmd__rm_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__help__subcmd__member__subcmd__rm_commands() {
    local commands; commands=()
    _describe -t commands 'fj org team help member rm commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__help__subcmd__repo_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__help__subcmd__repo_commands() {
    local commands; commands=(
'list:List all the repos this team can access' \
'add:Add access to an existing repo to a team' \
'rm:Remove access to a repo from a team' \
    )
    _describe -t commands 'fj org team help repo commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__help__subcmd__repo__subcmd__add_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__help__subcmd__repo__subcmd__add_commands() {
    local commands; commands=()
    _describe -t commands 'fj org team help repo add commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__help__subcmd__repo__subcmd__list_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__help__subcmd__repo__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj org team help repo list commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__help__subcmd__repo__subcmd__rm_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__help__subcmd__repo__subcmd__rm_commands() {
    local commands; commands=()
    _describe -t commands 'fj org team help repo rm commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__help__subcmd__view_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__help__subcmd__view_commands() {
    local commands; commands=()
    _describe -t commands 'fj org team help view commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__list_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj org team list commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__member_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__member_commands() {
    local commands; commands=(
'list:List all the members of a team' \
'add:Add someone to a team' \
'rm:Remove someone from a team' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj org team member commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__member__subcmd__add_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__member__subcmd__add_commands() {
    local commands; commands=()
    _describe -t commands 'fj org team member add commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__member__subcmd__help_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__member__subcmd__help_commands() {
    local commands; commands=(
'list:List all the members of a team' \
'add:Add someone to a team' \
'rm:Remove someone from a team' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj org team member help commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__member__subcmd__help__subcmd__add_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__member__subcmd__help__subcmd__add_commands() {
    local commands; commands=()
    _describe -t commands 'fj org team member help add commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__member__subcmd__help__subcmd__help_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__member__subcmd__help__subcmd__help_commands() {
    local commands; commands=()
    _describe -t commands 'fj org team member help help commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__member__subcmd__help__subcmd__list_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__member__subcmd__help__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj org team member help list commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__member__subcmd__help__subcmd__rm_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__member__subcmd__help__subcmd__rm_commands() {
    local commands; commands=()
    _describe -t commands 'fj org team member help rm commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__member__subcmd__list_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__member__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj org team member list commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__member__subcmd__rm_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__member__subcmd__rm_commands() {
    local commands; commands=()
    _describe -t commands 'fj org team member rm commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__repo_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__repo_commands() {
    local commands; commands=(
'list:List all the repos this team can access' \
'add:Add access to an existing repo to a team' \
'rm:Remove access to a repo from a team' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj org team repo commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__repo__subcmd__add_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__repo__subcmd__add_commands() {
    local commands; commands=()
    _describe -t commands 'fj org team repo add commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__repo__subcmd__help_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__repo__subcmd__help_commands() {
    local commands; commands=(
'list:List all the repos this team can access' \
'add:Add access to an existing repo to a team' \
'rm:Remove access to a repo from a team' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj org team repo help commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__repo__subcmd__help__subcmd__add_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__repo__subcmd__help__subcmd__add_commands() {
    local commands; commands=()
    _describe -t commands 'fj org team repo help add commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__repo__subcmd__help__subcmd__help_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__repo__subcmd__help__subcmd__help_commands() {
    local commands; commands=()
    _describe -t commands 'fj org team repo help help commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__repo__subcmd__help__subcmd__list_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__repo__subcmd__help__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj org team repo help list commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__repo__subcmd__help__subcmd__rm_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__repo__subcmd__help__subcmd__rm_commands() {
    local commands; commands=()
    _describe -t commands 'fj org team repo help rm commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__repo__subcmd__list_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__repo__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj org team repo list commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__repo__subcmd__rm_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__repo__subcmd__rm_commands() {
    local commands; commands=()
    _describe -t commands 'fj org team repo rm commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__team__subcmd__view_commands] )) ||
_fj__subcmd__org__subcmd__team__subcmd__view_commands() {
    local commands; commands=()
    _describe -t commands 'fj org team view commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__view_commands] )) ||
_fj__subcmd__org__subcmd__view_commands() {
    local commands; commands=()
    _describe -t commands 'fj org view commands' commands "$@"
}
(( $+functions[_fj__subcmd__org__subcmd__visibility_commands] )) ||
_fj__subcmd__org__subcmd__visibility_commands() {
    local commands; commands=()
    _describe -t commands 'fj org visibility commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr_commands] )) ||
_fj__subcmd__pr_commands() {
    local commands; commands=(
'search:Search a repository'\''s pull requests' \
'create:Create a new pull request' \
'view:View the contents of a pull request' \
'status:View the mergability and CI status of a pull request' \
'checkout:Checkout a pull request in a new branch' \
'comment:Add a comment on a pull request' \
'assign:Assign users to a pull request' \
'unassign:Unassign users from an issue' \
'edit:Edit the contents of a pull request' \
'close:Close a pull request, without merging' \
'merge:Merge a pull request' \
'browse:Open a pull request in your browser' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj pr commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__assign_commands] )) ||
_fj__subcmd__pr__subcmd__assign_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr assign commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__browse_commands] )) ||
_fj__subcmd__pr__subcmd__browse_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr browse commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__checkout_commands] )) ||
_fj__subcmd__pr__subcmd__checkout_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr checkout commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__close_commands] )) ||
_fj__subcmd__pr__subcmd__close_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr close commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__comment_commands] )) ||
_fj__subcmd__pr__subcmd__comment_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr comment commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__create_commands] )) ||
_fj__subcmd__pr__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr create commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__edit_commands] )) ||
_fj__subcmd__pr__subcmd__edit_commands() {
    local commands; commands=(
'title:Edit the title' \
'body:Edit the text body' \
'comment:Edit a comment' \
'labels:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj pr edit commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__edit__subcmd__body_commands] )) ||
_fj__subcmd__pr__subcmd__edit__subcmd__body_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr edit body commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__edit__subcmd__comment_commands] )) ||
_fj__subcmd__pr__subcmd__edit__subcmd__comment_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr edit comment commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__edit__subcmd__help_commands] )) ||
_fj__subcmd__pr__subcmd__edit__subcmd__help_commands() {
    local commands; commands=(
'title:Edit the title' \
'body:Edit the text body' \
'comment:Edit a comment' \
'labels:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj pr edit help commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__edit__subcmd__help__subcmd__body_commands] )) ||
_fj__subcmd__pr__subcmd__edit__subcmd__help__subcmd__body_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr edit help body commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__edit__subcmd__help__subcmd__comment_commands] )) ||
_fj__subcmd__pr__subcmd__edit__subcmd__help__subcmd__comment_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr edit help comment commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__edit__subcmd__help__subcmd__help_commands] )) ||
_fj__subcmd__pr__subcmd__edit__subcmd__help__subcmd__help_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr edit help help commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__edit__subcmd__help__subcmd__labels_commands] )) ||
_fj__subcmd__pr__subcmd__edit__subcmd__help__subcmd__labels_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr edit help labels commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__edit__subcmd__help__subcmd__title_commands] )) ||
_fj__subcmd__pr__subcmd__edit__subcmd__help__subcmd__title_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr edit help title commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__edit__subcmd__labels_commands] )) ||
_fj__subcmd__pr__subcmd__edit__subcmd__labels_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr edit labels commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__edit__subcmd__title_commands] )) ||
_fj__subcmd__pr__subcmd__edit__subcmd__title_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr edit title commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__help_commands] )) ||
_fj__subcmd__pr__subcmd__help_commands() {
    local commands; commands=(
'search:Search a repository'\''s pull requests' \
'create:Create a new pull request' \
'view:View the contents of a pull request' \
'status:View the mergability and CI status of a pull request' \
'checkout:Checkout a pull request in a new branch' \
'comment:Add a comment on a pull request' \
'assign:Assign users to a pull request' \
'unassign:Unassign users from an issue' \
'edit:Edit the contents of a pull request' \
'close:Close a pull request, without merging' \
'merge:Merge a pull request' \
'browse:Open a pull request in your browser' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj pr help commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__help__subcmd__assign_commands] )) ||
_fj__subcmd__pr__subcmd__help__subcmd__assign_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr help assign commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__help__subcmd__browse_commands] )) ||
_fj__subcmd__pr__subcmd__help__subcmd__browse_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr help browse commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__help__subcmd__checkout_commands] )) ||
_fj__subcmd__pr__subcmd__help__subcmd__checkout_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr help checkout commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__help__subcmd__close_commands] )) ||
_fj__subcmd__pr__subcmd__help__subcmd__close_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr help close commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__help__subcmd__comment_commands] )) ||
_fj__subcmd__pr__subcmd__help__subcmd__comment_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr help comment commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__help__subcmd__create_commands] )) ||
_fj__subcmd__pr__subcmd__help__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr help create commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__help__subcmd__edit_commands] )) ||
_fj__subcmd__pr__subcmd__help__subcmd__edit_commands() {
    local commands; commands=(
'title:Edit the title' \
'body:Edit the text body' \
'comment:Edit a comment' \
'labels:' \
    )
    _describe -t commands 'fj pr help edit commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__help__subcmd__edit__subcmd__body_commands] )) ||
_fj__subcmd__pr__subcmd__help__subcmd__edit__subcmd__body_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr help edit body commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__help__subcmd__edit__subcmd__comment_commands] )) ||
_fj__subcmd__pr__subcmd__help__subcmd__edit__subcmd__comment_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr help edit comment commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__help__subcmd__edit__subcmd__labels_commands] )) ||
_fj__subcmd__pr__subcmd__help__subcmd__edit__subcmd__labels_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr help edit labels commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__help__subcmd__edit__subcmd__title_commands] )) ||
_fj__subcmd__pr__subcmd__help__subcmd__edit__subcmd__title_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr help edit title commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__help__subcmd__help_commands] )) ||
_fj__subcmd__pr__subcmd__help__subcmd__help_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr help help commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__help__subcmd__merge_commands] )) ||
_fj__subcmd__pr__subcmd__help__subcmd__merge_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr help merge commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__help__subcmd__search_commands] )) ||
_fj__subcmd__pr__subcmd__help__subcmd__search_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr help search commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__help__subcmd__status_commands] )) ||
_fj__subcmd__pr__subcmd__help__subcmd__status_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr help status commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__help__subcmd__unassign_commands] )) ||
_fj__subcmd__pr__subcmd__help__subcmd__unassign_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr help unassign commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__help__subcmd__view_commands] )) ||
_fj__subcmd__pr__subcmd__help__subcmd__view_commands() {
    local commands; commands=(
'body:View the title and body of a pull request' \
'comment:View a comment on a pull request' \
'comments:View all comments on a pull request' \
'labels:View the labels applied to a pull request' \
'diff:View the diff between the base and head branches of a pull request' \
'files:View the files changed in a pull request' \
'commits:View the commits in a pull request' \
    )
    _describe -t commands 'fj pr help view commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__help__subcmd__view__subcmd__body_commands] )) ||
_fj__subcmd__pr__subcmd__help__subcmd__view__subcmd__body_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr help view body commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__help__subcmd__view__subcmd__comment_commands] )) ||
_fj__subcmd__pr__subcmd__help__subcmd__view__subcmd__comment_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr help view comment commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__help__subcmd__view__subcmd__comments_commands] )) ||
_fj__subcmd__pr__subcmd__help__subcmd__view__subcmd__comments_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr help view comments commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__help__subcmd__view__subcmd__commits_commands] )) ||
_fj__subcmd__pr__subcmd__help__subcmd__view__subcmd__commits_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr help view commits commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__help__subcmd__view__subcmd__diff_commands] )) ||
_fj__subcmd__pr__subcmd__help__subcmd__view__subcmd__diff_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr help view diff commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__help__subcmd__view__subcmd__files_commands] )) ||
_fj__subcmd__pr__subcmd__help__subcmd__view__subcmd__files_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr help view files commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__help__subcmd__view__subcmd__labels_commands] )) ||
_fj__subcmd__pr__subcmd__help__subcmd__view__subcmd__labels_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr help view labels commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__merge_commands] )) ||
_fj__subcmd__pr__subcmd__merge_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr merge commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__search_commands] )) ||
_fj__subcmd__pr__subcmd__search_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr search commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__status_commands] )) ||
_fj__subcmd__pr__subcmd__status_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr status commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__unassign_commands] )) ||
_fj__subcmd__pr__subcmd__unassign_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr unassign commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__view_commands] )) ||
_fj__subcmd__pr__subcmd__view_commands() {
    local commands; commands=(
'body:View the title and body of a pull request' \
'comment:View a comment on a pull request' \
'comments:View all comments on a pull request' \
'labels:View the labels applied to a pull request' \
'diff:View the diff between the base and head branches of a pull request' \
'files:View the files changed in a pull request' \
'commits:View the commits in a pull request' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj pr view commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__view__subcmd__body_commands] )) ||
_fj__subcmd__pr__subcmd__view__subcmd__body_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr view body commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__view__subcmd__comment_commands] )) ||
_fj__subcmd__pr__subcmd__view__subcmd__comment_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr view comment commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__view__subcmd__comments_commands] )) ||
_fj__subcmd__pr__subcmd__view__subcmd__comments_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr view comments commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__view__subcmd__commits_commands] )) ||
_fj__subcmd__pr__subcmd__view__subcmd__commits_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr view commits commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__view__subcmd__diff_commands] )) ||
_fj__subcmd__pr__subcmd__view__subcmd__diff_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr view diff commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__view__subcmd__files_commands] )) ||
_fj__subcmd__pr__subcmd__view__subcmd__files_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr view files commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__view__subcmd__help_commands] )) ||
_fj__subcmd__pr__subcmd__view__subcmd__help_commands() {
    local commands; commands=(
'body:View the title and body of a pull request' \
'comment:View a comment on a pull request' \
'comments:View all comments on a pull request' \
'labels:View the labels applied to a pull request' \
'diff:View the diff between the base and head branches of a pull request' \
'files:View the files changed in a pull request' \
'commits:View the commits in a pull request' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj pr view help commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__view__subcmd__help__subcmd__body_commands] )) ||
_fj__subcmd__pr__subcmd__view__subcmd__help__subcmd__body_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr view help body commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__view__subcmd__help__subcmd__comment_commands] )) ||
_fj__subcmd__pr__subcmd__view__subcmd__help__subcmd__comment_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr view help comment commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__view__subcmd__help__subcmd__comments_commands] )) ||
_fj__subcmd__pr__subcmd__view__subcmd__help__subcmd__comments_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr view help comments commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__view__subcmd__help__subcmd__commits_commands] )) ||
_fj__subcmd__pr__subcmd__view__subcmd__help__subcmd__commits_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr view help commits commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__view__subcmd__help__subcmd__diff_commands] )) ||
_fj__subcmd__pr__subcmd__view__subcmd__help__subcmd__diff_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr view help diff commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__view__subcmd__help__subcmd__files_commands] )) ||
_fj__subcmd__pr__subcmd__view__subcmd__help__subcmd__files_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr view help files commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__view__subcmd__help__subcmd__help_commands] )) ||
_fj__subcmd__pr__subcmd__view__subcmd__help__subcmd__help_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr view help help commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__view__subcmd__help__subcmd__labels_commands] )) ||
_fj__subcmd__pr__subcmd__view__subcmd__help__subcmd__labels_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr view help labels commands' commands "$@"
}
(( $+functions[_fj__subcmd__pr__subcmd__view__subcmd__labels_commands] )) ||
_fj__subcmd__pr__subcmd__view__subcmd__labels_commands() {
    local commands; commands=()
    _describe -t commands 'fj pr view labels commands' commands "$@"
}
(( $+functions[_fj__subcmd__release_commands] )) ||
_fj__subcmd__release_commands() {
    local commands; commands=(
'create:Create a new release' \
'edit:Edit a release'\''s info' \
'delete:Delete a release' \
'list:List all the releases on a repo' \
'view:View a release'\''s info' \
'browse:Open a release in your browser' \
'asset:Commands on a release'\''s attached files' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj release commands' commands "$@"
}
(( $+functions[_fj__subcmd__release__subcmd__asset_commands] )) ||
_fj__subcmd__release__subcmd__asset_commands() {
    local commands; commands=(
'create:Create a new attachment on a release' \
'delete:Remove an attachment from a release' \
'download:Download an attached file' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj release asset commands' commands "$@"
}
(( $+functions[_fj__subcmd__release__subcmd__asset__subcmd__create_commands] )) ||
_fj__subcmd__release__subcmd__asset__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj release asset create commands' commands "$@"
}
(( $+functions[_fj__subcmd__release__subcmd__asset__subcmd__delete_commands] )) ||
_fj__subcmd__release__subcmd__asset__subcmd__delete_commands() {
    local commands; commands=()
    _describe -t commands 'fj release asset delete commands' commands "$@"
}
(( $+functions[_fj__subcmd__release__subcmd__asset__subcmd__download_commands] )) ||
_fj__subcmd__release__subcmd__asset__subcmd__download_commands() {
    local commands; commands=()
    _describe -t commands 'fj release asset download commands' commands "$@"
}
(( $+functions[_fj__subcmd__release__subcmd__asset__subcmd__help_commands] )) ||
_fj__subcmd__release__subcmd__asset__subcmd__help_commands() {
    local commands; commands=(
'create:Create a new attachment on a release' \
'delete:Remove an attachment from a release' \
'download:Download an attached file' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj release asset help commands' commands "$@"
}
(( $+functions[_fj__subcmd__release__subcmd__asset__subcmd__help__subcmd__create_commands] )) ||
_fj__subcmd__release__subcmd__asset__subcmd__help__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj release asset help create commands' commands "$@"
}
(( $+functions[_fj__subcmd__release__subcmd__asset__subcmd__help__subcmd__delete_commands] )) ||
_fj__subcmd__release__subcmd__asset__subcmd__help__subcmd__delete_commands() {
    local commands; commands=()
    _describe -t commands 'fj release asset help delete commands' commands "$@"
}
(( $+functions[_fj__subcmd__release__subcmd__asset__subcmd__help__subcmd__download_commands] )) ||
_fj__subcmd__release__subcmd__asset__subcmd__help__subcmd__download_commands() {
    local commands; commands=()
    _describe -t commands 'fj release asset help download commands' commands "$@"
}
(( $+functions[_fj__subcmd__release__subcmd__asset__subcmd__help__subcmd__help_commands] )) ||
_fj__subcmd__release__subcmd__asset__subcmd__help__subcmd__help_commands() {
    local commands; commands=()
    _describe -t commands 'fj release asset help help commands' commands "$@"
}
(( $+functions[_fj__subcmd__release__subcmd__browse_commands] )) ||
_fj__subcmd__release__subcmd__browse_commands() {
    local commands; commands=()
    _describe -t commands 'fj release browse commands' commands "$@"
}
(( $+functions[_fj__subcmd__release__subcmd__create_commands] )) ||
_fj__subcmd__release__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj release create commands' commands "$@"
}
(( $+functions[_fj__subcmd__release__subcmd__delete_commands] )) ||
_fj__subcmd__release__subcmd__delete_commands() {
    local commands; commands=()
    _describe -t commands 'fj release delete commands' commands "$@"
}
(( $+functions[_fj__subcmd__release__subcmd__edit_commands] )) ||
_fj__subcmd__release__subcmd__edit_commands() {
    local commands; commands=()
    _describe -t commands 'fj release edit commands' commands "$@"
}
(( $+functions[_fj__subcmd__release__subcmd__help_commands] )) ||
_fj__subcmd__release__subcmd__help_commands() {
    local commands; commands=(
'create:Create a new release' \
'edit:Edit a release'\''s info' \
'delete:Delete a release' \
'list:List all the releases on a repo' \
'view:View a release'\''s info' \
'browse:Open a release in your browser' \
'asset:Commands on a release'\''s attached files' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj release help commands' commands "$@"
}
(( $+functions[_fj__subcmd__release__subcmd__help__subcmd__asset_commands] )) ||
_fj__subcmd__release__subcmd__help__subcmd__asset_commands() {
    local commands; commands=(
'create:Create a new attachment on a release' \
'delete:Remove an attachment from a release' \
'download:Download an attached file' \
    )
    _describe -t commands 'fj release help asset commands' commands "$@"
}
(( $+functions[_fj__subcmd__release__subcmd__help__subcmd__asset__subcmd__create_commands] )) ||
_fj__subcmd__release__subcmd__help__subcmd__asset__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj release help asset create commands' commands "$@"
}
(( $+functions[_fj__subcmd__release__subcmd__help__subcmd__asset__subcmd__delete_commands] )) ||
_fj__subcmd__release__subcmd__help__subcmd__asset__subcmd__delete_commands() {
    local commands; commands=()
    _describe -t commands 'fj release help asset delete commands' commands "$@"
}
(( $+functions[_fj__subcmd__release__subcmd__help__subcmd__asset__subcmd__download_commands] )) ||
_fj__subcmd__release__subcmd__help__subcmd__asset__subcmd__download_commands() {
    local commands; commands=()
    _describe -t commands 'fj release help asset download commands' commands "$@"
}
(( $+functions[_fj__subcmd__release__subcmd__help__subcmd__browse_commands] )) ||
_fj__subcmd__release__subcmd__help__subcmd__browse_commands() {
    local commands; commands=()
    _describe -t commands 'fj release help browse commands' commands "$@"
}
(( $+functions[_fj__subcmd__release__subcmd__help__subcmd__create_commands] )) ||
_fj__subcmd__release__subcmd__help__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj release help create commands' commands "$@"
}
(( $+functions[_fj__subcmd__release__subcmd__help__subcmd__delete_commands] )) ||
_fj__subcmd__release__subcmd__help__subcmd__delete_commands() {
    local commands; commands=()
    _describe -t commands 'fj release help delete commands' commands "$@"
}
(( $+functions[_fj__subcmd__release__subcmd__help__subcmd__edit_commands] )) ||
_fj__subcmd__release__subcmd__help__subcmd__edit_commands() {
    local commands; commands=()
    _describe -t commands 'fj release help edit commands' commands "$@"
}
(( $+functions[_fj__subcmd__release__subcmd__help__subcmd__help_commands] )) ||
_fj__subcmd__release__subcmd__help__subcmd__help_commands() {
    local commands; commands=()
    _describe -t commands 'fj release help help commands' commands "$@"
}
(( $+functions[_fj__subcmd__release__subcmd__help__subcmd__list_commands] )) ||
_fj__subcmd__release__subcmd__help__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj release help list commands' commands "$@"
}
(( $+functions[_fj__subcmd__release__subcmd__help__subcmd__view_commands] )) ||
_fj__subcmd__release__subcmd__help__subcmd__view_commands() {
    local commands; commands=()
    _describe -t commands 'fj release help view commands' commands "$@"
}
(( $+functions[_fj__subcmd__release__subcmd__list_commands] )) ||
_fj__subcmd__release__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj release list commands' commands "$@"
}
(( $+functions[_fj__subcmd__release__subcmd__view_commands] )) ||
_fj__subcmd__release__subcmd__view_commands() {
    local commands; commands=()
    _describe -t commands 'fj release view commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo_commands] )) ||
_fj__subcmd__repo_commands() {
    local commands; commands=(
'create:Creates a new repository' \
'fork:Fork a repository onto your account' \
'migrate:' \
'view:View a repo'\''s info' \
'readme:View a repo'\''s README' \
'clone:Clone a repo'\''s code locally' \
'star:Add a star to a repo' \
'unstar:Take away a star from a repo' \
'delete:Delete a repository' \
'browse:Open a repository'\''s page in your browser' \
'labels:Manage a repo'\''s issue labels' \
'edit:Edit a repository'\''s properties' \
'units:Manage a repo'\''s units' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj repo commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__browse_commands] )) ||
_fj__subcmd__repo__subcmd__browse_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo browse commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__clone_commands] )) ||
_fj__subcmd__repo__subcmd__clone_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo clone commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__create_commands] )) ||
_fj__subcmd__repo__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo create commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__delete_commands] )) ||
_fj__subcmd__repo__subcmd__delete_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo delete commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__edit_commands] )) ||
_fj__subcmd__repo__subcmd__edit_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo edit commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__fork_commands] )) ||
_fj__subcmd__repo__subcmd__fork_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo fork commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__help_commands] )) ||
_fj__subcmd__repo__subcmd__help_commands() {
    local commands; commands=(
'create:Creates a new repository' \
'fork:Fork a repository onto your account' \
'migrate:' \
'view:View a repo'\''s info' \
'readme:View a repo'\''s README' \
'clone:Clone a repo'\''s code locally' \
'star:Add a star to a repo' \
'unstar:Take away a star from a repo' \
'delete:Delete a repository' \
'browse:Open a repository'\''s page in your browser' \
'labels:Manage a repo'\''s issue labels' \
'edit:Edit a repository'\''s properties' \
'units:Manage a repo'\''s units' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj repo help commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__help__subcmd__browse_commands] )) ||
_fj__subcmd__repo__subcmd__help__subcmd__browse_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo help browse commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__help__subcmd__clone_commands] )) ||
_fj__subcmd__repo__subcmd__help__subcmd__clone_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo help clone commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__help__subcmd__create_commands] )) ||
_fj__subcmd__repo__subcmd__help__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo help create commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__help__subcmd__delete_commands] )) ||
_fj__subcmd__repo__subcmd__help__subcmd__delete_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo help delete commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__help__subcmd__edit_commands] )) ||
_fj__subcmd__repo__subcmd__help__subcmd__edit_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo help edit commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__help__subcmd__fork_commands] )) ||
_fj__subcmd__repo__subcmd__help__subcmd__fork_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo help fork commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__help__subcmd__help_commands] )) ||
_fj__subcmd__repo__subcmd__help__subcmd__help_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo help help commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__help__subcmd__labels_commands] )) ||
_fj__subcmd__repo__subcmd__help__subcmd__labels_commands() {
    local commands; commands=(
'view:Show a repo'\''s labels' \
'create:Create a new label' \
'delete:Delete a label' \
'edit:Edit a label' \
    )
    _describe -t commands 'fj repo help labels commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__help__subcmd__labels__subcmd__create_commands] )) ||
_fj__subcmd__repo__subcmd__help__subcmd__labels__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo help labels create commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__help__subcmd__labels__subcmd__delete_commands] )) ||
_fj__subcmd__repo__subcmd__help__subcmd__labels__subcmd__delete_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo help labels delete commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__help__subcmd__labels__subcmd__edit_commands] )) ||
_fj__subcmd__repo__subcmd__help__subcmd__labels__subcmd__edit_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo help labels edit commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__help__subcmd__labels__subcmd__view_commands] )) ||
_fj__subcmd__repo__subcmd__help__subcmd__labels__subcmd__view_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo help labels view commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__help__subcmd__migrate_commands] )) ||
_fj__subcmd__repo__subcmd__help__subcmd__migrate_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo help migrate commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__help__subcmd__readme_commands] )) ||
_fj__subcmd__repo__subcmd__help__subcmd__readme_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo help readme commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__help__subcmd__star_commands] )) ||
_fj__subcmd__repo__subcmd__help__subcmd__star_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo help star commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__help__subcmd__units_commands] )) ||
_fj__subcmd__repo__subcmd__help__subcmd__units_commands() {
    local commands; commands=(
'issues:Manage the issues unit' \
'prs:Manage the pull requests unit' \
'actions:Manage the actions unit' \
'wiki:Manage the wiki unit' \
'packages:Manage the packages unit' \
'projects:Manage the projects unit' \
'releases:Manage the releases unit' \
    )
    _describe -t commands 'fj repo help units commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__help__subcmd__units__subcmd__actions_commands] )) ||
_fj__subcmd__repo__subcmd__help__subcmd__units__subcmd__actions_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo help units actions commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__help__subcmd__units__subcmd__issues_commands] )) ||
_fj__subcmd__repo__subcmd__help__subcmd__units__subcmd__issues_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo help units issues commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__help__subcmd__units__subcmd__packages_commands] )) ||
_fj__subcmd__repo__subcmd__help__subcmd__units__subcmd__packages_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo help units packages commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__help__subcmd__units__subcmd__projects_commands] )) ||
_fj__subcmd__repo__subcmd__help__subcmd__units__subcmd__projects_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo help units projects commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__help__subcmd__units__subcmd__prs_commands] )) ||
_fj__subcmd__repo__subcmd__help__subcmd__units__subcmd__prs_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo help units prs commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__help__subcmd__units__subcmd__releases_commands] )) ||
_fj__subcmd__repo__subcmd__help__subcmd__units__subcmd__releases_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo help units releases commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__help__subcmd__units__subcmd__wiki_commands] )) ||
_fj__subcmd__repo__subcmd__help__subcmd__units__subcmd__wiki_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo help units wiki commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__help__subcmd__unstar_commands] )) ||
_fj__subcmd__repo__subcmd__help__subcmd__unstar_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo help unstar commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__help__subcmd__view_commands] )) ||
_fj__subcmd__repo__subcmd__help__subcmd__view_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo help view commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__labels_commands] )) ||
_fj__subcmd__repo__subcmd__labels_commands() {
    local commands; commands=(
'view:Show a repo'\''s labels' \
'create:Create a new label' \
'delete:Delete a label' \
'edit:Edit a label' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj repo labels commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__labels__subcmd__create_commands] )) ||
_fj__subcmd__repo__subcmd__labels__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo labels create commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__labels__subcmd__delete_commands] )) ||
_fj__subcmd__repo__subcmd__labels__subcmd__delete_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo labels delete commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__labels__subcmd__edit_commands] )) ||
_fj__subcmd__repo__subcmd__labels__subcmd__edit_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo labels edit commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__labels__subcmd__help_commands] )) ||
_fj__subcmd__repo__subcmd__labels__subcmd__help_commands() {
    local commands; commands=(
'view:Show a repo'\''s labels' \
'create:Create a new label' \
'delete:Delete a label' \
'edit:Edit a label' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj repo labels help commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__labels__subcmd__help__subcmd__create_commands] )) ||
_fj__subcmd__repo__subcmd__labels__subcmd__help__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo labels help create commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__labels__subcmd__help__subcmd__delete_commands] )) ||
_fj__subcmd__repo__subcmd__labels__subcmd__help__subcmd__delete_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo labels help delete commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__labels__subcmd__help__subcmd__edit_commands] )) ||
_fj__subcmd__repo__subcmd__labels__subcmd__help__subcmd__edit_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo labels help edit commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__labels__subcmd__help__subcmd__help_commands] )) ||
_fj__subcmd__repo__subcmd__labels__subcmd__help__subcmd__help_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo labels help help commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__labels__subcmd__help__subcmd__view_commands] )) ||
_fj__subcmd__repo__subcmd__labels__subcmd__help__subcmd__view_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo labels help view commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__labels__subcmd__view_commands] )) ||
_fj__subcmd__repo__subcmd__labels__subcmd__view_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo labels view commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__migrate_commands] )) ||
_fj__subcmd__repo__subcmd__migrate_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo migrate commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__readme_commands] )) ||
_fj__subcmd__repo__subcmd__readme_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo readme commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__star_commands] )) ||
_fj__subcmd__repo__subcmd__star_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo star commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__units_commands] )) ||
_fj__subcmd__repo__subcmd__units_commands() {
    local commands; commands=(
'issues:Manage the issues unit' \
'prs:Manage the pull requests unit' \
'actions:Manage the actions unit' \
'wiki:Manage the wiki unit' \
'packages:Manage the packages unit' \
'projects:Manage the projects unit' \
'releases:Manage the releases unit' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj repo units commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__units__subcmd__actions_commands] )) ||
_fj__subcmd__repo__subcmd__units__subcmd__actions_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo units actions commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__units__subcmd__help_commands] )) ||
_fj__subcmd__repo__subcmd__units__subcmd__help_commands() {
    local commands; commands=(
'issues:Manage the issues unit' \
'prs:Manage the pull requests unit' \
'actions:Manage the actions unit' \
'wiki:Manage the wiki unit' \
'packages:Manage the packages unit' \
'projects:Manage the projects unit' \
'releases:Manage the releases unit' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj repo units help commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__units__subcmd__help__subcmd__actions_commands] )) ||
_fj__subcmd__repo__subcmd__units__subcmd__help__subcmd__actions_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo units help actions commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__units__subcmd__help__subcmd__help_commands] )) ||
_fj__subcmd__repo__subcmd__units__subcmd__help__subcmd__help_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo units help help commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__units__subcmd__help__subcmd__issues_commands] )) ||
_fj__subcmd__repo__subcmd__units__subcmd__help__subcmd__issues_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo units help issues commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__units__subcmd__help__subcmd__packages_commands] )) ||
_fj__subcmd__repo__subcmd__units__subcmd__help__subcmd__packages_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo units help packages commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__units__subcmd__help__subcmd__projects_commands] )) ||
_fj__subcmd__repo__subcmd__units__subcmd__help__subcmd__projects_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo units help projects commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__units__subcmd__help__subcmd__prs_commands] )) ||
_fj__subcmd__repo__subcmd__units__subcmd__help__subcmd__prs_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo units help prs commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__units__subcmd__help__subcmd__releases_commands] )) ||
_fj__subcmd__repo__subcmd__units__subcmd__help__subcmd__releases_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo units help releases commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__units__subcmd__help__subcmd__wiki_commands] )) ||
_fj__subcmd__repo__subcmd__units__subcmd__help__subcmd__wiki_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo units help wiki commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__units__subcmd__issues_commands] )) ||
_fj__subcmd__repo__subcmd__units__subcmd__issues_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo units issues commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__units__subcmd__packages_commands] )) ||
_fj__subcmd__repo__subcmd__units__subcmd__packages_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo units packages commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__units__subcmd__projects_commands] )) ||
_fj__subcmd__repo__subcmd__units__subcmd__projects_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo units projects commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__units__subcmd__prs_commands] )) ||
_fj__subcmd__repo__subcmd__units__subcmd__prs_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo units prs commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__units__subcmd__releases_commands] )) ||
_fj__subcmd__repo__subcmd__units__subcmd__releases_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo units releases commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__units__subcmd__wiki_commands] )) ||
_fj__subcmd__repo__subcmd__units__subcmd__wiki_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo units wiki commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__unstar_commands] )) ||
_fj__subcmd__repo__subcmd__unstar_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo unstar commands' commands "$@"
}
(( $+functions[_fj__subcmd__repo__subcmd__view_commands] )) ||
_fj__subcmd__repo__subcmd__view_commands() {
    local commands; commands=()
    _describe -t commands 'fj repo view commands' commands "$@"
}
(( $+functions[_fj__subcmd__tag_commands] )) ||
_fj__subcmd__tag_commands() {
    local commands; commands=(
'create:Create a new tag' \
'delete:Delete a tag' \
'list:List all the tags on a repo' \
'view:View a tag'\''s info' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj tag commands' commands "$@"
}
(( $+functions[_fj__subcmd__tag__subcmd__create_commands] )) ||
_fj__subcmd__tag__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj tag create commands' commands "$@"
}
(( $+functions[_fj__subcmd__tag__subcmd__delete_commands] )) ||
_fj__subcmd__tag__subcmd__delete_commands() {
    local commands; commands=()
    _describe -t commands 'fj tag delete commands' commands "$@"
}
(( $+functions[_fj__subcmd__tag__subcmd__help_commands] )) ||
_fj__subcmd__tag__subcmd__help_commands() {
    local commands; commands=(
'create:Create a new tag' \
'delete:Delete a tag' \
'list:List all the tags on a repo' \
'view:View a tag'\''s info' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj tag help commands' commands "$@"
}
(( $+functions[_fj__subcmd__tag__subcmd__help__subcmd__create_commands] )) ||
_fj__subcmd__tag__subcmd__help__subcmd__create_commands() {
    local commands; commands=()
    _describe -t commands 'fj tag help create commands' commands "$@"
}
(( $+functions[_fj__subcmd__tag__subcmd__help__subcmd__delete_commands] )) ||
_fj__subcmd__tag__subcmd__help__subcmd__delete_commands() {
    local commands; commands=()
    _describe -t commands 'fj tag help delete commands' commands "$@"
}
(( $+functions[_fj__subcmd__tag__subcmd__help__subcmd__help_commands] )) ||
_fj__subcmd__tag__subcmd__help__subcmd__help_commands() {
    local commands; commands=()
    _describe -t commands 'fj tag help help commands' commands "$@"
}
(( $+functions[_fj__subcmd__tag__subcmd__help__subcmd__list_commands] )) ||
_fj__subcmd__tag__subcmd__help__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj tag help list commands' commands "$@"
}
(( $+functions[_fj__subcmd__tag__subcmd__help__subcmd__view_commands] )) ||
_fj__subcmd__tag__subcmd__help__subcmd__view_commands() {
    local commands; commands=()
    _describe -t commands 'fj tag help view commands' commands "$@"
}
(( $+functions[_fj__subcmd__tag__subcmd__list_commands] )) ||
_fj__subcmd__tag__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj tag list commands' commands "$@"
}
(( $+functions[_fj__subcmd__tag__subcmd__view_commands] )) ||
_fj__subcmd__tag__subcmd__view_commands() {
    local commands; commands=()
    _describe -t commands 'fj tag view commands' commands "$@"
}
(( $+functions[_fj__subcmd__user_commands] )) ||
_fj__subcmd__user_commands() {
    local commands; commands=(
'search:Search for a user by username' \
'view:View a user'\''s profile page' \
'browse:Open a user'\''s profile page in your browser' \
'follow:Follow a user' \
'unfollow:Unfollow a user' \
'following:List everyone a user'\''s follows' \
'followers:List a user'\''s followers' \
'block:Block a user' \
'unblock:Unblock a user' \
'repos:List a user'\''s repositories' \
'orgs:List the organizations a user is a member of' \
'activity:List a user'\''s recent activity' \
'edit:Edit your user settings' \
'key:Manage SSH keys' \
'gpg:Manage GPG keys' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj user commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__activity_commands] )) ||
_fj__subcmd__user__subcmd__activity_commands() {
    local commands; commands=()
    _describe -t commands 'fj user activity commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__block_commands] )) ||
_fj__subcmd__user__subcmd__block_commands() {
    local commands; commands=()
    _describe -t commands 'fj user block commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__browse_commands] )) ||
_fj__subcmd__user__subcmd__browse_commands() {
    local commands; commands=()
    _describe -t commands 'fj user browse commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__edit_commands] )) ||
_fj__subcmd__user__subcmd__edit_commands() {
    local commands; commands=(
'bio:Set your bio' \
'name:Set your full name' \
'pronouns:Set your pronouns' \
'location:Set your activity visibility' \
'activity:Set your activity visibility' \
'email:Manage the email addresses associated with your account' \
'website:Set your linked website' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj user edit commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__edit__subcmd__activity_commands] )) ||
_fj__subcmd__user__subcmd__edit__subcmd__activity_commands() {
    local commands; commands=()
    _describe -t commands 'fj user edit activity commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__edit__subcmd__bio_commands] )) ||
_fj__subcmd__user__subcmd__edit__subcmd__bio_commands() {
    local commands; commands=()
    _describe -t commands 'fj user edit bio commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__edit__subcmd__email_commands] )) ||
_fj__subcmd__user__subcmd__edit__subcmd__email_commands() {
    local commands; commands=()
    _describe -t commands 'fj user edit email commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__edit__subcmd__help_commands] )) ||
_fj__subcmd__user__subcmd__edit__subcmd__help_commands() {
    local commands; commands=(
'bio:Set your bio' \
'name:Set your full name' \
'pronouns:Set your pronouns' \
'location:Set your activity visibility' \
'activity:Set your activity visibility' \
'email:Manage the email addresses associated with your account' \
'website:Set your linked website' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj user edit help commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__edit__subcmd__help__subcmd__activity_commands] )) ||
_fj__subcmd__user__subcmd__edit__subcmd__help__subcmd__activity_commands() {
    local commands; commands=()
    _describe -t commands 'fj user edit help activity commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__edit__subcmd__help__subcmd__bio_commands] )) ||
_fj__subcmd__user__subcmd__edit__subcmd__help__subcmd__bio_commands() {
    local commands; commands=()
    _describe -t commands 'fj user edit help bio commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__edit__subcmd__help__subcmd__email_commands] )) ||
_fj__subcmd__user__subcmd__edit__subcmd__help__subcmd__email_commands() {
    local commands; commands=()
    _describe -t commands 'fj user edit help email commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__edit__subcmd__help__subcmd__help_commands] )) ||
_fj__subcmd__user__subcmd__edit__subcmd__help__subcmd__help_commands() {
    local commands; commands=()
    _describe -t commands 'fj user edit help help commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__edit__subcmd__help__subcmd__location_commands] )) ||
_fj__subcmd__user__subcmd__edit__subcmd__help__subcmd__location_commands() {
    local commands; commands=()
    _describe -t commands 'fj user edit help location commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__edit__subcmd__help__subcmd__name_commands] )) ||
_fj__subcmd__user__subcmd__edit__subcmd__help__subcmd__name_commands() {
    local commands; commands=()
    _describe -t commands 'fj user edit help name commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__edit__subcmd__help__subcmd__pronouns_commands] )) ||
_fj__subcmd__user__subcmd__edit__subcmd__help__subcmd__pronouns_commands() {
    local commands; commands=()
    _describe -t commands 'fj user edit help pronouns commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__edit__subcmd__help__subcmd__website_commands] )) ||
_fj__subcmd__user__subcmd__edit__subcmd__help__subcmd__website_commands() {
    local commands; commands=()
    _describe -t commands 'fj user edit help website commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__edit__subcmd__location_commands] )) ||
_fj__subcmd__user__subcmd__edit__subcmd__location_commands() {
    local commands; commands=()
    _describe -t commands 'fj user edit location commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__edit__subcmd__name_commands] )) ||
_fj__subcmd__user__subcmd__edit__subcmd__name_commands() {
    local commands; commands=()
    _describe -t commands 'fj user edit name commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__edit__subcmd__pronouns_commands] )) ||
_fj__subcmd__user__subcmd__edit__subcmd__pronouns_commands() {
    local commands; commands=()
    _describe -t commands 'fj user edit pronouns commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__edit__subcmd__website_commands] )) ||
_fj__subcmd__user__subcmd__edit__subcmd__website_commands() {
    local commands; commands=()
    _describe -t commands 'fj user edit website commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__follow_commands] )) ||
_fj__subcmd__user__subcmd__follow_commands() {
    local commands; commands=()
    _describe -t commands 'fj user follow commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__followers_commands] )) ||
_fj__subcmd__user__subcmd__followers_commands() {
    local commands; commands=()
    _describe -t commands 'fj user followers commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__following_commands] )) ||
_fj__subcmd__user__subcmd__following_commands() {
    local commands; commands=()
    _describe -t commands 'fj user following commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__gpg_commands] )) ||
_fj__subcmd__user__subcmd__gpg_commands() {
    local commands; commands=(
'list:List your GPG keys' \
'view:Show details about a GPG key' \
'delete:Deletes a GPG key. This will un-verify all commits signed with that key!' \
'upload:Upload a new GPG key from your local keyring. This command requires \`gpg\` to be installed' \
'verify:Verifies a GPG key. You need to have the to-be-verified key installed locally in order to sign some data with it. This command requires \`gpg\` to be installed' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj user gpg commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__gpg__subcmd__delete_commands] )) ||
_fj__subcmd__user__subcmd__gpg__subcmd__delete_commands() {
    local commands; commands=()
    _describe -t commands 'fj user gpg delete commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__gpg__subcmd__help_commands] )) ||
_fj__subcmd__user__subcmd__gpg__subcmd__help_commands() {
    local commands; commands=(
'list:List your GPG keys' \
'view:Show details about a GPG key' \
'delete:Deletes a GPG key. This will un-verify all commits signed with that key!' \
'upload:Upload a new GPG key from your local keyring. This command requires \`gpg\` to be installed' \
'verify:Verifies a GPG key. You need to have the to-be-verified key installed locally in order to sign some data with it. This command requires \`gpg\` to be installed' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj user gpg help commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__gpg__subcmd__help__subcmd__delete_commands] )) ||
_fj__subcmd__user__subcmd__gpg__subcmd__help__subcmd__delete_commands() {
    local commands; commands=()
    _describe -t commands 'fj user gpg help delete commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__gpg__subcmd__help__subcmd__help_commands] )) ||
_fj__subcmd__user__subcmd__gpg__subcmd__help__subcmd__help_commands() {
    local commands; commands=()
    _describe -t commands 'fj user gpg help help commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__gpg__subcmd__help__subcmd__list_commands] )) ||
_fj__subcmd__user__subcmd__gpg__subcmd__help__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj user gpg help list commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__gpg__subcmd__help__subcmd__upload_commands] )) ||
_fj__subcmd__user__subcmd__gpg__subcmd__help__subcmd__upload_commands() {
    local commands; commands=()
    _describe -t commands 'fj user gpg help upload commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__gpg__subcmd__help__subcmd__verify_commands] )) ||
_fj__subcmd__user__subcmd__gpg__subcmd__help__subcmd__verify_commands() {
    local commands; commands=()
    _describe -t commands 'fj user gpg help verify commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__gpg__subcmd__help__subcmd__view_commands] )) ||
_fj__subcmd__user__subcmd__gpg__subcmd__help__subcmd__view_commands() {
    local commands; commands=()
    _describe -t commands 'fj user gpg help view commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__gpg__subcmd__list_commands] )) ||
_fj__subcmd__user__subcmd__gpg__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj user gpg list commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__gpg__subcmd__upload_commands] )) ||
_fj__subcmd__user__subcmd__gpg__subcmd__upload_commands() {
    local commands; commands=()
    _describe -t commands 'fj user gpg upload commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__gpg__subcmd__verify_commands] )) ||
_fj__subcmd__user__subcmd__gpg__subcmd__verify_commands() {
    local commands; commands=()
    _describe -t commands 'fj user gpg verify commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__gpg__subcmd__view_commands] )) ||
_fj__subcmd__user__subcmd__gpg__subcmd__view_commands() {
    local commands; commands=()
    _describe -t commands 'fj user gpg view commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__help_commands] )) ||
_fj__subcmd__user__subcmd__help_commands() {
    local commands; commands=(
'search:Search for a user by username' \
'view:View a user'\''s profile page' \
'browse:Open a user'\''s profile page in your browser' \
'follow:Follow a user' \
'unfollow:Unfollow a user' \
'following:List everyone a user'\''s follows' \
'followers:List a user'\''s followers' \
'block:Block a user' \
'unblock:Unblock a user' \
'repos:List a user'\''s repositories' \
'orgs:List the organizations a user is a member of' \
'activity:List a user'\''s recent activity' \
'edit:Edit your user settings' \
'key:Manage SSH keys' \
'gpg:Manage GPG keys' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj user help commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__help__subcmd__activity_commands] )) ||
_fj__subcmd__user__subcmd__help__subcmd__activity_commands() {
    local commands; commands=()
    _describe -t commands 'fj user help activity commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__help__subcmd__block_commands] )) ||
_fj__subcmd__user__subcmd__help__subcmd__block_commands() {
    local commands; commands=()
    _describe -t commands 'fj user help block commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__help__subcmd__browse_commands] )) ||
_fj__subcmd__user__subcmd__help__subcmd__browse_commands() {
    local commands; commands=()
    _describe -t commands 'fj user help browse commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__help__subcmd__edit_commands] )) ||
_fj__subcmd__user__subcmd__help__subcmd__edit_commands() {
    local commands; commands=(
'bio:Set your bio' \
'name:Set your full name' \
'pronouns:Set your pronouns' \
'location:Set your activity visibility' \
'activity:Set your activity visibility' \
'email:Manage the email addresses associated with your account' \
'website:Set your linked website' \
    )
    _describe -t commands 'fj user help edit commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__help__subcmd__edit__subcmd__activity_commands] )) ||
_fj__subcmd__user__subcmd__help__subcmd__edit__subcmd__activity_commands() {
    local commands; commands=()
    _describe -t commands 'fj user help edit activity commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__help__subcmd__edit__subcmd__bio_commands] )) ||
_fj__subcmd__user__subcmd__help__subcmd__edit__subcmd__bio_commands() {
    local commands; commands=()
    _describe -t commands 'fj user help edit bio commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__help__subcmd__edit__subcmd__email_commands] )) ||
_fj__subcmd__user__subcmd__help__subcmd__edit__subcmd__email_commands() {
    local commands; commands=()
    _describe -t commands 'fj user help edit email commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__help__subcmd__edit__subcmd__location_commands] )) ||
_fj__subcmd__user__subcmd__help__subcmd__edit__subcmd__location_commands() {
    local commands; commands=()
    _describe -t commands 'fj user help edit location commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__help__subcmd__edit__subcmd__name_commands] )) ||
_fj__subcmd__user__subcmd__help__subcmd__edit__subcmd__name_commands() {
    local commands; commands=()
    _describe -t commands 'fj user help edit name commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__help__subcmd__edit__subcmd__pronouns_commands] )) ||
_fj__subcmd__user__subcmd__help__subcmd__edit__subcmd__pronouns_commands() {
    local commands; commands=()
    _describe -t commands 'fj user help edit pronouns commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__help__subcmd__edit__subcmd__website_commands] )) ||
_fj__subcmd__user__subcmd__help__subcmd__edit__subcmd__website_commands() {
    local commands; commands=()
    _describe -t commands 'fj user help edit website commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__help__subcmd__follow_commands] )) ||
_fj__subcmd__user__subcmd__help__subcmd__follow_commands() {
    local commands; commands=()
    _describe -t commands 'fj user help follow commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__help__subcmd__followers_commands] )) ||
_fj__subcmd__user__subcmd__help__subcmd__followers_commands() {
    local commands; commands=()
    _describe -t commands 'fj user help followers commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__help__subcmd__following_commands] )) ||
_fj__subcmd__user__subcmd__help__subcmd__following_commands() {
    local commands; commands=()
    _describe -t commands 'fj user help following commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__help__subcmd__gpg_commands] )) ||
_fj__subcmd__user__subcmd__help__subcmd__gpg_commands() {
    local commands; commands=(
'list:List your GPG keys' \
'view:Show details about a GPG key' \
'delete:Deletes a GPG key. This will un-verify all commits signed with that key!' \
'upload:Upload a new GPG key from your local keyring. This command requires \`gpg\` to be installed' \
'verify:Verifies a GPG key. You need to have the to-be-verified key installed locally in order to sign some data with it. This command requires \`gpg\` to be installed' \
    )
    _describe -t commands 'fj user help gpg commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__help__subcmd__gpg__subcmd__delete_commands] )) ||
_fj__subcmd__user__subcmd__help__subcmd__gpg__subcmd__delete_commands() {
    local commands; commands=()
    _describe -t commands 'fj user help gpg delete commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__help__subcmd__gpg__subcmd__list_commands] )) ||
_fj__subcmd__user__subcmd__help__subcmd__gpg__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj user help gpg list commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__help__subcmd__gpg__subcmd__upload_commands] )) ||
_fj__subcmd__user__subcmd__help__subcmd__gpg__subcmd__upload_commands() {
    local commands; commands=()
    _describe -t commands 'fj user help gpg upload commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__help__subcmd__gpg__subcmd__verify_commands] )) ||
_fj__subcmd__user__subcmd__help__subcmd__gpg__subcmd__verify_commands() {
    local commands; commands=()
    _describe -t commands 'fj user help gpg verify commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__help__subcmd__gpg__subcmd__view_commands] )) ||
_fj__subcmd__user__subcmd__help__subcmd__gpg__subcmd__view_commands() {
    local commands; commands=()
    _describe -t commands 'fj user help gpg view commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__help__subcmd__help_commands] )) ||
_fj__subcmd__user__subcmd__help__subcmd__help_commands() {
    local commands; commands=()
    _describe -t commands 'fj user help help commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__help__subcmd__key_commands] )) ||
_fj__subcmd__user__subcmd__help__subcmd__key_commands() {
    local commands; commands=(
'list:List your SSH keys' \
'view:View an SSH key' \
'delete:Delete an SSH key' \
'upload:Upload an SSH key' \
    )
    _describe -t commands 'fj user help key commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__help__subcmd__key__subcmd__delete_commands] )) ||
_fj__subcmd__user__subcmd__help__subcmd__key__subcmd__delete_commands() {
    local commands; commands=()
    _describe -t commands 'fj user help key delete commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__help__subcmd__key__subcmd__list_commands] )) ||
_fj__subcmd__user__subcmd__help__subcmd__key__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj user help key list commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__help__subcmd__key__subcmd__upload_commands] )) ||
_fj__subcmd__user__subcmd__help__subcmd__key__subcmd__upload_commands() {
    local commands; commands=()
    _describe -t commands 'fj user help key upload commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__help__subcmd__key__subcmd__view_commands] )) ||
_fj__subcmd__user__subcmd__help__subcmd__key__subcmd__view_commands() {
    local commands; commands=()
    _describe -t commands 'fj user help key view commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__help__subcmd__orgs_commands] )) ||
_fj__subcmd__user__subcmd__help__subcmd__orgs_commands() {
    local commands; commands=()
    _describe -t commands 'fj user help orgs commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__help__subcmd__repos_commands] )) ||
_fj__subcmd__user__subcmd__help__subcmd__repos_commands() {
    local commands; commands=()
    _describe -t commands 'fj user help repos commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__help__subcmd__search_commands] )) ||
_fj__subcmd__user__subcmd__help__subcmd__search_commands() {
    local commands; commands=()
    _describe -t commands 'fj user help search commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__help__subcmd__unblock_commands] )) ||
_fj__subcmd__user__subcmd__help__subcmd__unblock_commands() {
    local commands; commands=()
    _describe -t commands 'fj user help unblock commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__help__subcmd__unfollow_commands] )) ||
_fj__subcmd__user__subcmd__help__subcmd__unfollow_commands() {
    local commands; commands=()
    _describe -t commands 'fj user help unfollow commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__help__subcmd__view_commands] )) ||
_fj__subcmd__user__subcmd__help__subcmd__view_commands() {
    local commands; commands=()
    _describe -t commands 'fj user help view commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__key_commands] )) ||
_fj__subcmd__user__subcmd__key_commands() {
    local commands; commands=(
'list:List your SSH keys' \
'view:View an SSH key' \
'delete:Delete an SSH key' \
'upload:Upload an SSH key' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj user key commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__key__subcmd__delete_commands] )) ||
_fj__subcmd__user__subcmd__key__subcmd__delete_commands() {
    local commands; commands=()
    _describe -t commands 'fj user key delete commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__key__subcmd__help_commands] )) ||
_fj__subcmd__user__subcmd__key__subcmd__help_commands() {
    local commands; commands=(
'list:List your SSH keys' \
'view:View an SSH key' \
'delete:Delete an SSH key' \
'upload:Upload an SSH key' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj user key help commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__key__subcmd__help__subcmd__delete_commands] )) ||
_fj__subcmd__user__subcmd__key__subcmd__help__subcmd__delete_commands() {
    local commands; commands=()
    _describe -t commands 'fj user key help delete commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__key__subcmd__help__subcmd__help_commands] )) ||
_fj__subcmd__user__subcmd__key__subcmd__help__subcmd__help_commands() {
    local commands; commands=()
    _describe -t commands 'fj user key help help commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__key__subcmd__help__subcmd__list_commands] )) ||
_fj__subcmd__user__subcmd__key__subcmd__help__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj user key help list commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__key__subcmd__help__subcmd__upload_commands] )) ||
_fj__subcmd__user__subcmd__key__subcmd__help__subcmd__upload_commands() {
    local commands; commands=()
    _describe -t commands 'fj user key help upload commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__key__subcmd__help__subcmd__view_commands] )) ||
_fj__subcmd__user__subcmd__key__subcmd__help__subcmd__view_commands() {
    local commands; commands=()
    _describe -t commands 'fj user key help view commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__key__subcmd__list_commands] )) ||
_fj__subcmd__user__subcmd__key__subcmd__list_commands() {
    local commands; commands=()
    _describe -t commands 'fj user key list commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__key__subcmd__upload_commands] )) ||
_fj__subcmd__user__subcmd__key__subcmd__upload_commands() {
    local commands; commands=()
    _describe -t commands 'fj user key upload commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__key__subcmd__view_commands] )) ||
_fj__subcmd__user__subcmd__key__subcmd__view_commands() {
    local commands; commands=()
    _describe -t commands 'fj user key view commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__orgs_commands] )) ||
_fj__subcmd__user__subcmd__orgs_commands() {
    local commands; commands=()
    _describe -t commands 'fj user orgs commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__repos_commands] )) ||
_fj__subcmd__user__subcmd__repos_commands() {
    local commands; commands=()
    _describe -t commands 'fj user repos commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__search_commands] )) ||
_fj__subcmd__user__subcmd__search_commands() {
    local commands; commands=()
    _describe -t commands 'fj user search commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__unblock_commands] )) ||
_fj__subcmd__user__subcmd__unblock_commands() {
    local commands; commands=()
    _describe -t commands 'fj user unblock commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__unfollow_commands] )) ||
_fj__subcmd__user__subcmd__unfollow_commands() {
    local commands; commands=()
    _describe -t commands 'fj user unfollow commands' commands "$@"
}
(( $+functions[_fj__subcmd__user__subcmd__view_commands] )) ||
_fj__subcmd__user__subcmd__view_commands() {
    local commands; commands=()
    _describe -t commands 'fj user view commands' commands "$@"
}
(( $+functions[_fj__subcmd__version_commands] )) ||
_fj__subcmd__version_commands() {
    local commands; commands=()
    _describe -t commands 'fj version commands' commands "$@"
}
(( $+functions[_fj__subcmd__whoami_commands] )) ||
_fj__subcmd__whoami_commands() {
    local commands; commands=()
    _describe -t commands 'fj whoami commands' commands "$@"
}
(( $+functions[_fj__subcmd__wiki_commands] )) ||
_fj__subcmd__wiki_commands() {
    local commands; commands=(
'contents:' \
'view:' \
'clone:' \
'browse:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj wiki commands' commands "$@"
}
(( $+functions[_fj__subcmd__wiki__subcmd__browse_commands] )) ||
_fj__subcmd__wiki__subcmd__browse_commands() {
    local commands; commands=()
    _describe -t commands 'fj wiki browse commands' commands "$@"
}
(( $+functions[_fj__subcmd__wiki__subcmd__clone_commands] )) ||
_fj__subcmd__wiki__subcmd__clone_commands() {
    local commands; commands=()
    _describe -t commands 'fj wiki clone commands' commands "$@"
}
(( $+functions[_fj__subcmd__wiki__subcmd__contents_commands] )) ||
_fj__subcmd__wiki__subcmd__contents_commands() {
    local commands; commands=()
    _describe -t commands 'fj wiki contents commands' commands "$@"
}
(( $+functions[_fj__subcmd__wiki__subcmd__help_commands] )) ||
_fj__subcmd__wiki__subcmd__help_commands() {
    local commands; commands=(
'contents:' \
'view:' \
'clone:' \
'browse:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'fj wiki help commands' commands "$@"
}
(( $+functions[_fj__subcmd__wiki__subcmd__help__subcmd__browse_commands] )) ||
_fj__subcmd__wiki__subcmd__help__subcmd__browse_commands() {
    local commands; commands=()
    _describe -t commands 'fj wiki help browse commands' commands "$@"
}
(( $+functions[_fj__subcmd__wiki__subcmd__help__subcmd__clone_commands] )) ||
_fj__subcmd__wiki__subcmd__help__subcmd__clone_commands() {
    local commands; commands=()
    _describe -t commands 'fj wiki help clone commands' commands "$@"
}
(( $+functions[_fj__subcmd__wiki__subcmd__help__subcmd__contents_commands] )) ||
_fj__subcmd__wiki__subcmd__help__subcmd__contents_commands() {
    local commands; commands=()
    _describe -t commands 'fj wiki help contents commands' commands "$@"
}
(( $+functions[_fj__subcmd__wiki__subcmd__help__subcmd__help_commands] )) ||
_fj__subcmd__wiki__subcmd__help__subcmd__help_commands() {
    local commands; commands=()
    _describe -t commands 'fj wiki help help commands' commands "$@"
}
(( $+functions[_fj__subcmd__wiki__subcmd__help__subcmd__view_commands] )) ||
_fj__subcmd__wiki__subcmd__help__subcmd__view_commands() {
    local commands; commands=()
    _describe -t commands 'fj wiki help view commands' commands "$@"
}
(( $+functions[_fj__subcmd__wiki__subcmd__view_commands] )) ||
_fj__subcmd__wiki__subcmd__view_commands() {
    local commands; commands=()
    _describe -t commands 'fj wiki view commands' commands "$@"
}

if [ "$funcstack[1]" = "_fj" ]; then
    _fj "$@"
else
    compdef _fj fj
fi

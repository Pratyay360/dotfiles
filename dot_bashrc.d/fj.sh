_fj() {
    local i cur prev opts cmd
    COMPREPLY=()
    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
        cur="$2"
    else
        cur="${COMP_WORDS[COMP_CWORD]}"
    fi
    prev="$3"
    cmd=""
    opts=""

    for i in "${COMP_WORDS[@]:0:COMP_CWORD}"
    do
        case "${cmd},${i}" in
            ",$1")
                cmd="fj"
                ;;
            fj,actions)
                cmd="fj__subcmd__actions"
                ;;
            fj,auth)
                cmd="fj__subcmd__auth"
                ;;
            fj,completion)
                cmd="fj__subcmd__completion"
                ;;
            fj,help)
                cmd="fj__subcmd__help"
                ;;
            fj,issue)
                cmd="fj__subcmd__issue"
                ;;
            fj,org)
                cmd="fj__subcmd__org"
                ;;
            fj,pr)
                cmd="fj__subcmd__pr"
                ;;
            fj,release)
                cmd="fj__subcmd__release"
                ;;
            fj,repo)
                cmd="fj__subcmd__repo"
                ;;
            fj,tag)
                cmd="fj__subcmd__tag"
                ;;
            fj,user)
                cmd="fj__subcmd__user"
                ;;
            fj,version)
                cmd="fj__subcmd__version"
                ;;
            fj,whoami)
                cmd="fj__subcmd__whoami"
                ;;
            fj,wiki)
                cmd="fj__subcmd__wiki"
                ;;
            fj__subcmd__actions,dispatch)
                cmd="fj__subcmd__actions__subcmd__dispatch"
                ;;
            fj__subcmd__actions,help)
                cmd="fj__subcmd__actions__subcmd__help"
                ;;
            fj__subcmd__actions,secrets)
                cmd="fj__subcmd__actions__subcmd__secrets"
                ;;
            fj__subcmd__actions,tasks)
                cmd="fj__subcmd__actions__subcmd__tasks"
                ;;
            fj__subcmd__actions,variables)
                cmd="fj__subcmd__actions__subcmd__variables"
                ;;
            fj__subcmd__actions__subcmd__help,dispatch)
                cmd="fj__subcmd__actions__subcmd__help__subcmd__dispatch"
                ;;
            fj__subcmd__actions__subcmd__help,help)
                cmd="fj__subcmd__actions__subcmd__help__subcmd__help"
                ;;
            fj__subcmd__actions__subcmd__help,secrets)
                cmd="fj__subcmd__actions__subcmd__help__subcmd__secrets"
                ;;
            fj__subcmd__actions__subcmd__help,tasks)
                cmd="fj__subcmd__actions__subcmd__help__subcmd__tasks"
                ;;
            fj__subcmd__actions__subcmd__help,variables)
                cmd="fj__subcmd__actions__subcmd__help__subcmd__variables"
                ;;
            fj__subcmd__actions__subcmd__help__subcmd__secrets,create)
                cmd="fj__subcmd__actions__subcmd__help__subcmd__secrets__subcmd__create"
                ;;
            fj__subcmd__actions__subcmd__help__subcmd__secrets,delete)
                cmd="fj__subcmd__actions__subcmd__help__subcmd__secrets__subcmd__delete"
                ;;
            fj__subcmd__actions__subcmd__help__subcmd__secrets,list)
                cmd="fj__subcmd__actions__subcmd__help__subcmd__secrets__subcmd__list"
                ;;
            fj__subcmd__actions__subcmd__help__subcmd__variables,create)
                cmd="fj__subcmd__actions__subcmd__help__subcmd__variables__subcmd__create"
                ;;
            fj__subcmd__actions__subcmd__help__subcmd__variables,delete)
                cmd="fj__subcmd__actions__subcmd__help__subcmd__variables__subcmd__delete"
                ;;
            fj__subcmd__actions__subcmd__help__subcmd__variables,list)
                cmd="fj__subcmd__actions__subcmd__help__subcmd__variables__subcmd__list"
                ;;
            fj__subcmd__actions__subcmd__secrets,create)
                cmd="fj__subcmd__actions__subcmd__secrets__subcmd__create"
                ;;
            fj__subcmd__actions__subcmd__secrets,delete)
                cmd="fj__subcmd__actions__subcmd__secrets__subcmd__delete"
                ;;
            fj__subcmd__actions__subcmd__secrets,help)
                cmd="fj__subcmd__actions__subcmd__secrets__subcmd__help"
                ;;
            fj__subcmd__actions__subcmd__secrets,list)
                cmd="fj__subcmd__actions__subcmd__secrets__subcmd__list"
                ;;
            fj__subcmd__actions__subcmd__secrets__subcmd__help,create)
                cmd="fj__subcmd__actions__subcmd__secrets__subcmd__help__subcmd__create"
                ;;
            fj__subcmd__actions__subcmd__secrets__subcmd__help,delete)
                cmd="fj__subcmd__actions__subcmd__secrets__subcmd__help__subcmd__delete"
                ;;
            fj__subcmd__actions__subcmd__secrets__subcmd__help,help)
                cmd="fj__subcmd__actions__subcmd__secrets__subcmd__help__subcmd__help"
                ;;
            fj__subcmd__actions__subcmd__secrets__subcmd__help,list)
                cmd="fj__subcmd__actions__subcmd__secrets__subcmd__help__subcmd__list"
                ;;
            fj__subcmd__actions__subcmd__variables,create)
                cmd="fj__subcmd__actions__subcmd__variables__subcmd__create"
                ;;
            fj__subcmd__actions__subcmd__variables,delete)
                cmd="fj__subcmd__actions__subcmd__variables__subcmd__delete"
                ;;
            fj__subcmd__actions__subcmd__variables,help)
                cmd="fj__subcmd__actions__subcmd__variables__subcmd__help"
                ;;
            fj__subcmd__actions__subcmd__variables,list)
                cmd="fj__subcmd__actions__subcmd__variables__subcmd__list"
                ;;
            fj__subcmd__actions__subcmd__variables__subcmd__help,create)
                cmd="fj__subcmd__actions__subcmd__variables__subcmd__help__subcmd__create"
                ;;
            fj__subcmd__actions__subcmd__variables__subcmd__help,delete)
                cmd="fj__subcmd__actions__subcmd__variables__subcmd__help__subcmd__delete"
                ;;
            fj__subcmd__actions__subcmd__variables__subcmd__help,help)
                cmd="fj__subcmd__actions__subcmd__variables__subcmd__help__subcmd__help"
                ;;
            fj__subcmd__actions__subcmd__variables__subcmd__help,list)
                cmd="fj__subcmd__actions__subcmd__variables__subcmd__help__subcmd__list"
                ;;
            fj__subcmd__auth,add-key)
                cmd="fj__subcmd__auth__subcmd__add__subcmd__key"
                ;;
            fj__subcmd__auth,help)
                cmd="fj__subcmd__auth__subcmd__help"
                ;;
            fj__subcmd__auth,list)
                cmd="fj__subcmd__auth__subcmd__list"
                ;;
            fj__subcmd__auth,login)
                cmd="fj__subcmd__auth__subcmd__login"
                ;;
            fj__subcmd__auth,logout)
                cmd="fj__subcmd__auth__subcmd__logout"
                ;;
            fj__subcmd__auth,use-ssh)
                cmd="fj__subcmd__auth__subcmd__use__subcmd__ssh"
                ;;
            fj__subcmd__auth__subcmd__help,add-key)
                cmd="fj__subcmd__auth__subcmd__help__subcmd__add__subcmd__key"
                ;;
            fj__subcmd__auth__subcmd__help,help)
                cmd="fj__subcmd__auth__subcmd__help__subcmd__help"
                ;;
            fj__subcmd__auth__subcmd__help,list)
                cmd="fj__subcmd__auth__subcmd__help__subcmd__list"
                ;;
            fj__subcmd__auth__subcmd__help,login)
                cmd="fj__subcmd__auth__subcmd__help__subcmd__login"
                ;;
            fj__subcmd__auth__subcmd__help,logout)
                cmd="fj__subcmd__auth__subcmd__help__subcmd__logout"
                ;;
            fj__subcmd__auth__subcmd__help,use-ssh)
                cmd="fj__subcmd__auth__subcmd__help__subcmd__use__subcmd__ssh"
                ;;
            fj__subcmd__help,actions)
                cmd="fj__subcmd__help__subcmd__actions"
                ;;
            fj__subcmd__help,auth)
                cmd="fj__subcmd__help__subcmd__auth"
                ;;
            fj__subcmd__help,completion)
                cmd="fj__subcmd__help__subcmd__completion"
                ;;
            fj__subcmd__help,help)
                cmd="fj__subcmd__help__subcmd__help"
                ;;
            fj__subcmd__help,issue)
                cmd="fj__subcmd__help__subcmd__issue"
                ;;
            fj__subcmd__help,org)
                cmd="fj__subcmd__help__subcmd__org"
                ;;
            fj__subcmd__help,pr)
                cmd="fj__subcmd__help__subcmd__pr"
                ;;
            fj__subcmd__help,release)
                cmd="fj__subcmd__help__subcmd__release"
                ;;
            fj__subcmd__help,repo)
                cmd="fj__subcmd__help__subcmd__repo"
                ;;
            fj__subcmd__help,tag)
                cmd="fj__subcmd__help__subcmd__tag"
                ;;
            fj__subcmd__help,user)
                cmd="fj__subcmd__help__subcmd__user"
                ;;
            fj__subcmd__help,version)
                cmd="fj__subcmd__help__subcmd__version"
                ;;
            fj__subcmd__help,whoami)
                cmd="fj__subcmd__help__subcmd__whoami"
                ;;
            fj__subcmd__help,wiki)
                cmd="fj__subcmd__help__subcmd__wiki"
                ;;
            fj__subcmd__help__subcmd__actions,dispatch)
                cmd="fj__subcmd__help__subcmd__actions__subcmd__dispatch"
                ;;
            fj__subcmd__help__subcmd__actions,secrets)
                cmd="fj__subcmd__help__subcmd__actions__subcmd__secrets"
                ;;
            fj__subcmd__help__subcmd__actions,tasks)
                cmd="fj__subcmd__help__subcmd__actions__subcmd__tasks"
                ;;
            fj__subcmd__help__subcmd__actions,variables)
                cmd="fj__subcmd__help__subcmd__actions__subcmd__variables"
                ;;
            fj__subcmd__help__subcmd__actions__subcmd__secrets,create)
                cmd="fj__subcmd__help__subcmd__actions__subcmd__secrets__subcmd__create"
                ;;
            fj__subcmd__help__subcmd__actions__subcmd__secrets,delete)
                cmd="fj__subcmd__help__subcmd__actions__subcmd__secrets__subcmd__delete"
                ;;
            fj__subcmd__help__subcmd__actions__subcmd__secrets,list)
                cmd="fj__subcmd__help__subcmd__actions__subcmd__secrets__subcmd__list"
                ;;
            fj__subcmd__help__subcmd__actions__subcmd__variables,create)
                cmd="fj__subcmd__help__subcmd__actions__subcmd__variables__subcmd__create"
                ;;
            fj__subcmd__help__subcmd__actions__subcmd__variables,delete)
                cmd="fj__subcmd__help__subcmd__actions__subcmd__variables__subcmd__delete"
                ;;
            fj__subcmd__help__subcmd__actions__subcmd__variables,list)
                cmd="fj__subcmd__help__subcmd__actions__subcmd__variables__subcmd__list"
                ;;
            fj__subcmd__help__subcmd__auth,add-key)
                cmd="fj__subcmd__help__subcmd__auth__subcmd__add__subcmd__key"
                ;;
            fj__subcmd__help__subcmd__auth,list)
                cmd="fj__subcmd__help__subcmd__auth__subcmd__list"
                ;;
            fj__subcmd__help__subcmd__auth,login)
                cmd="fj__subcmd__help__subcmd__auth__subcmd__login"
                ;;
            fj__subcmd__help__subcmd__auth,logout)
                cmd="fj__subcmd__help__subcmd__auth__subcmd__logout"
                ;;
            fj__subcmd__help__subcmd__auth,use-ssh)
                cmd="fj__subcmd__help__subcmd__auth__subcmd__use__subcmd__ssh"
                ;;
            fj__subcmd__help__subcmd__issue,assign)
                cmd="fj__subcmd__help__subcmd__issue__subcmd__assign"
                ;;
            fj__subcmd__help__subcmd__issue,browse)
                cmd="fj__subcmd__help__subcmd__issue__subcmd__browse"
                ;;
            fj__subcmd__help__subcmd__issue,close)
                cmd="fj__subcmd__help__subcmd__issue__subcmd__close"
                ;;
            fj__subcmd__help__subcmd__issue,comment)
                cmd="fj__subcmd__help__subcmd__issue__subcmd__comment"
                ;;
            fj__subcmd__help__subcmd__issue,create)
                cmd="fj__subcmd__help__subcmd__issue__subcmd__create"
                ;;
            fj__subcmd__help__subcmd__issue,edit)
                cmd="fj__subcmd__help__subcmd__issue__subcmd__edit"
                ;;
            fj__subcmd__help__subcmd__issue,search)
                cmd="fj__subcmd__help__subcmd__issue__subcmd__search"
                ;;
            fj__subcmd__help__subcmd__issue,templates)
                cmd="fj__subcmd__help__subcmd__issue__subcmd__templates"
                ;;
            fj__subcmd__help__subcmd__issue,unassign)
                cmd="fj__subcmd__help__subcmd__issue__subcmd__unassign"
                ;;
            fj__subcmd__help__subcmd__issue,view)
                cmd="fj__subcmd__help__subcmd__issue__subcmd__view"
                ;;
            fj__subcmd__help__subcmd__issue__subcmd__edit,body)
                cmd="fj__subcmd__help__subcmd__issue__subcmd__edit__subcmd__body"
                ;;
            fj__subcmd__help__subcmd__issue__subcmd__edit,comment)
                cmd="fj__subcmd__help__subcmd__issue__subcmd__edit__subcmd__comment"
                ;;
            fj__subcmd__help__subcmd__issue__subcmd__edit,labels)
                cmd="fj__subcmd__help__subcmd__issue__subcmd__edit__subcmd__labels"
                ;;
            fj__subcmd__help__subcmd__issue__subcmd__edit,title)
                cmd="fj__subcmd__help__subcmd__issue__subcmd__edit__subcmd__title"
                ;;
            fj__subcmd__help__subcmd__issue__subcmd__view,body)
                cmd="fj__subcmd__help__subcmd__issue__subcmd__view__subcmd__body"
                ;;
            fj__subcmd__help__subcmd__issue__subcmd__view,comment)
                cmd="fj__subcmd__help__subcmd__issue__subcmd__view__subcmd__comment"
                ;;
            fj__subcmd__help__subcmd__issue__subcmd__view,comments)
                cmd="fj__subcmd__help__subcmd__issue__subcmd__view__subcmd__comments"
                ;;
            fj__subcmd__help__subcmd__org,activity)
                cmd="fj__subcmd__help__subcmd__org__subcmd__activity"
                ;;
            fj__subcmd__help__subcmd__org,create)
                cmd="fj__subcmd__help__subcmd__org__subcmd__create"
                ;;
            fj__subcmd__help__subcmd__org,edit)
                cmd="fj__subcmd__help__subcmd__org__subcmd__edit"
                ;;
            fj__subcmd__help__subcmd__org,label)
                cmd="fj__subcmd__help__subcmd__org__subcmd__label"
                ;;
            fj__subcmd__help__subcmd__org,list)
                cmd="fj__subcmd__help__subcmd__org__subcmd__list"
                ;;
            fj__subcmd__help__subcmd__org,members)
                cmd="fj__subcmd__help__subcmd__org__subcmd__members"
                ;;
            fj__subcmd__help__subcmd__org,repo)
                cmd="fj__subcmd__help__subcmd__org__subcmd__repo"
                ;;
            fj__subcmd__help__subcmd__org,team)
                cmd="fj__subcmd__help__subcmd__org__subcmd__team"
                ;;
            fj__subcmd__help__subcmd__org,view)
                cmd="fj__subcmd__help__subcmd__org__subcmd__view"
                ;;
            fj__subcmd__help__subcmd__org,visibility)
                cmd="fj__subcmd__help__subcmd__org__subcmd__visibility"
                ;;
            fj__subcmd__help__subcmd__org__subcmd__label,add)
                cmd="fj__subcmd__help__subcmd__org__subcmd__label__subcmd__add"
                ;;
            fj__subcmd__help__subcmd__org__subcmd__label,edit)
                cmd="fj__subcmd__help__subcmd__org__subcmd__label__subcmd__edit"
                ;;
            fj__subcmd__help__subcmd__org__subcmd__label,list)
                cmd="fj__subcmd__help__subcmd__org__subcmd__label__subcmd__list"
                ;;
            fj__subcmd__help__subcmd__org__subcmd__label,rm)
                cmd="fj__subcmd__help__subcmd__org__subcmd__label__subcmd__rm"
                ;;
            fj__subcmd__help__subcmd__org__subcmd__repo,create)
                cmd="fj__subcmd__help__subcmd__org__subcmd__repo__subcmd__create"
                ;;
            fj__subcmd__help__subcmd__org__subcmd__repo,list)
                cmd="fj__subcmd__help__subcmd__org__subcmd__repo__subcmd__list"
                ;;
            fj__subcmd__help__subcmd__org__subcmd__team,create)
                cmd="fj__subcmd__help__subcmd__org__subcmd__team__subcmd__create"
                ;;
            fj__subcmd__help__subcmd__org__subcmd__team,delete)
                cmd="fj__subcmd__help__subcmd__org__subcmd__team__subcmd__delete"
                ;;
            fj__subcmd__help__subcmd__org__subcmd__team,edit)
                cmd="fj__subcmd__help__subcmd__org__subcmd__team__subcmd__edit"
                ;;
            fj__subcmd__help__subcmd__org__subcmd__team,list)
                cmd="fj__subcmd__help__subcmd__org__subcmd__team__subcmd__list"
                ;;
            fj__subcmd__help__subcmd__org__subcmd__team,member)
                cmd="fj__subcmd__help__subcmd__org__subcmd__team__subcmd__member"
                ;;
            fj__subcmd__help__subcmd__org__subcmd__team,repo)
                cmd="fj__subcmd__help__subcmd__org__subcmd__team__subcmd__repo"
                ;;
            fj__subcmd__help__subcmd__org__subcmd__team,view)
                cmd="fj__subcmd__help__subcmd__org__subcmd__team__subcmd__view"
                ;;
            fj__subcmd__help__subcmd__org__subcmd__team__subcmd__member,add)
                cmd="fj__subcmd__help__subcmd__org__subcmd__team__subcmd__member__subcmd__add"
                ;;
            fj__subcmd__help__subcmd__org__subcmd__team__subcmd__member,list)
                cmd="fj__subcmd__help__subcmd__org__subcmd__team__subcmd__member__subcmd__list"
                ;;
            fj__subcmd__help__subcmd__org__subcmd__team__subcmd__member,rm)
                cmd="fj__subcmd__help__subcmd__org__subcmd__team__subcmd__member__subcmd__rm"
                ;;
            fj__subcmd__help__subcmd__org__subcmd__team__subcmd__repo,add)
                cmd="fj__subcmd__help__subcmd__org__subcmd__team__subcmd__repo__subcmd__add"
                ;;
            fj__subcmd__help__subcmd__org__subcmd__team__subcmd__repo,list)
                cmd="fj__subcmd__help__subcmd__org__subcmd__team__subcmd__repo__subcmd__list"
                ;;
            fj__subcmd__help__subcmd__org__subcmd__team__subcmd__repo,rm)
                cmd="fj__subcmd__help__subcmd__org__subcmd__team__subcmd__repo__subcmd__rm"
                ;;
            fj__subcmd__help__subcmd__pr,assign)
                cmd="fj__subcmd__help__subcmd__pr__subcmd__assign"
                ;;
            fj__subcmd__help__subcmd__pr,browse)
                cmd="fj__subcmd__help__subcmd__pr__subcmd__browse"
                ;;
            fj__subcmd__help__subcmd__pr,checkout)
                cmd="fj__subcmd__help__subcmd__pr__subcmd__checkout"
                ;;
            fj__subcmd__help__subcmd__pr,close)
                cmd="fj__subcmd__help__subcmd__pr__subcmd__close"
                ;;
            fj__subcmd__help__subcmd__pr,comment)
                cmd="fj__subcmd__help__subcmd__pr__subcmd__comment"
                ;;
            fj__subcmd__help__subcmd__pr,create)
                cmd="fj__subcmd__help__subcmd__pr__subcmd__create"
                ;;
            fj__subcmd__help__subcmd__pr,edit)
                cmd="fj__subcmd__help__subcmd__pr__subcmd__edit"
                ;;
            fj__subcmd__help__subcmd__pr,merge)
                cmd="fj__subcmd__help__subcmd__pr__subcmd__merge"
                ;;
            fj__subcmd__help__subcmd__pr,search)
                cmd="fj__subcmd__help__subcmd__pr__subcmd__search"
                ;;
            fj__subcmd__help__subcmd__pr,status)
                cmd="fj__subcmd__help__subcmd__pr__subcmd__status"
                ;;
            fj__subcmd__help__subcmd__pr,unassign)
                cmd="fj__subcmd__help__subcmd__pr__subcmd__unassign"
                ;;
            fj__subcmd__help__subcmd__pr,view)
                cmd="fj__subcmd__help__subcmd__pr__subcmd__view"
                ;;
            fj__subcmd__help__subcmd__pr__subcmd__edit,body)
                cmd="fj__subcmd__help__subcmd__pr__subcmd__edit__subcmd__body"
                ;;
            fj__subcmd__help__subcmd__pr__subcmd__edit,comment)
                cmd="fj__subcmd__help__subcmd__pr__subcmd__edit__subcmd__comment"
                ;;
            fj__subcmd__help__subcmd__pr__subcmd__edit,labels)
                cmd="fj__subcmd__help__subcmd__pr__subcmd__edit__subcmd__labels"
                ;;
            fj__subcmd__help__subcmd__pr__subcmd__edit,title)
                cmd="fj__subcmd__help__subcmd__pr__subcmd__edit__subcmd__title"
                ;;
            fj__subcmd__help__subcmd__pr__subcmd__view,body)
                cmd="fj__subcmd__help__subcmd__pr__subcmd__view__subcmd__body"
                ;;
            fj__subcmd__help__subcmd__pr__subcmd__view,comment)
                cmd="fj__subcmd__help__subcmd__pr__subcmd__view__subcmd__comment"
                ;;
            fj__subcmd__help__subcmd__pr__subcmd__view,comments)
                cmd="fj__subcmd__help__subcmd__pr__subcmd__view__subcmd__comments"
                ;;
            fj__subcmd__help__subcmd__pr__subcmd__view,commits)
                cmd="fj__subcmd__help__subcmd__pr__subcmd__view__subcmd__commits"
                ;;
            fj__subcmd__help__subcmd__pr__subcmd__view,diff)
                cmd="fj__subcmd__help__subcmd__pr__subcmd__view__subcmd__diff"
                ;;
            fj__subcmd__help__subcmd__pr__subcmd__view,files)
                cmd="fj__subcmd__help__subcmd__pr__subcmd__view__subcmd__files"
                ;;
            fj__subcmd__help__subcmd__pr__subcmd__view,labels)
                cmd="fj__subcmd__help__subcmd__pr__subcmd__view__subcmd__labels"
                ;;
            fj__subcmd__help__subcmd__release,asset)
                cmd="fj__subcmd__help__subcmd__release__subcmd__asset"
                ;;
            fj__subcmd__help__subcmd__release,browse)
                cmd="fj__subcmd__help__subcmd__release__subcmd__browse"
                ;;
            fj__subcmd__help__subcmd__release,create)
                cmd="fj__subcmd__help__subcmd__release__subcmd__create"
                ;;
            fj__subcmd__help__subcmd__release,delete)
                cmd="fj__subcmd__help__subcmd__release__subcmd__delete"
                ;;
            fj__subcmd__help__subcmd__release,edit)
                cmd="fj__subcmd__help__subcmd__release__subcmd__edit"
                ;;
            fj__subcmd__help__subcmd__release,list)
                cmd="fj__subcmd__help__subcmd__release__subcmd__list"
                ;;
            fj__subcmd__help__subcmd__release,view)
                cmd="fj__subcmd__help__subcmd__release__subcmd__view"
                ;;
            fj__subcmd__help__subcmd__release__subcmd__asset,create)
                cmd="fj__subcmd__help__subcmd__release__subcmd__asset__subcmd__create"
                ;;
            fj__subcmd__help__subcmd__release__subcmd__asset,delete)
                cmd="fj__subcmd__help__subcmd__release__subcmd__asset__subcmd__delete"
                ;;
            fj__subcmd__help__subcmd__release__subcmd__asset,download)
                cmd="fj__subcmd__help__subcmd__release__subcmd__asset__subcmd__download"
                ;;
            fj__subcmd__help__subcmd__repo,browse)
                cmd="fj__subcmd__help__subcmd__repo__subcmd__browse"
                ;;
            fj__subcmd__help__subcmd__repo,clone)
                cmd="fj__subcmd__help__subcmd__repo__subcmd__clone"
                ;;
            fj__subcmd__help__subcmd__repo,create)
                cmd="fj__subcmd__help__subcmd__repo__subcmd__create"
                ;;
            fj__subcmd__help__subcmd__repo,delete)
                cmd="fj__subcmd__help__subcmd__repo__subcmd__delete"
                ;;
            fj__subcmd__help__subcmd__repo,edit)
                cmd="fj__subcmd__help__subcmd__repo__subcmd__edit"
                ;;
            fj__subcmd__help__subcmd__repo,fork)
                cmd="fj__subcmd__help__subcmd__repo__subcmd__fork"
                ;;
            fj__subcmd__help__subcmd__repo,labels)
                cmd="fj__subcmd__help__subcmd__repo__subcmd__labels"
                ;;
            fj__subcmd__help__subcmd__repo,migrate)
                cmd="fj__subcmd__help__subcmd__repo__subcmd__migrate"
                ;;
            fj__subcmd__help__subcmd__repo,readme)
                cmd="fj__subcmd__help__subcmd__repo__subcmd__readme"
                ;;
            fj__subcmd__help__subcmd__repo,star)
                cmd="fj__subcmd__help__subcmd__repo__subcmd__star"
                ;;
            fj__subcmd__help__subcmd__repo,units)
                cmd="fj__subcmd__help__subcmd__repo__subcmd__units"
                ;;
            fj__subcmd__help__subcmd__repo,unstar)
                cmd="fj__subcmd__help__subcmd__repo__subcmd__unstar"
                ;;
            fj__subcmd__help__subcmd__repo,view)
                cmd="fj__subcmd__help__subcmd__repo__subcmd__view"
                ;;
            fj__subcmd__help__subcmd__repo__subcmd__labels,create)
                cmd="fj__subcmd__help__subcmd__repo__subcmd__labels__subcmd__create"
                ;;
            fj__subcmd__help__subcmd__repo__subcmd__labels,delete)
                cmd="fj__subcmd__help__subcmd__repo__subcmd__labels__subcmd__delete"
                ;;
            fj__subcmd__help__subcmd__repo__subcmd__labels,edit)
                cmd="fj__subcmd__help__subcmd__repo__subcmd__labels__subcmd__edit"
                ;;
            fj__subcmd__help__subcmd__repo__subcmd__labels,view)
                cmd="fj__subcmd__help__subcmd__repo__subcmd__labels__subcmd__view"
                ;;
            fj__subcmd__help__subcmd__repo__subcmd__units,actions)
                cmd="fj__subcmd__help__subcmd__repo__subcmd__units__subcmd__actions"
                ;;
            fj__subcmd__help__subcmd__repo__subcmd__units,issues)
                cmd="fj__subcmd__help__subcmd__repo__subcmd__units__subcmd__issues"
                ;;
            fj__subcmd__help__subcmd__repo__subcmd__units,packages)
                cmd="fj__subcmd__help__subcmd__repo__subcmd__units__subcmd__packages"
                ;;
            fj__subcmd__help__subcmd__repo__subcmd__units,projects)
                cmd="fj__subcmd__help__subcmd__repo__subcmd__units__subcmd__projects"
                ;;
            fj__subcmd__help__subcmd__repo__subcmd__units,prs)
                cmd="fj__subcmd__help__subcmd__repo__subcmd__units__subcmd__prs"
                ;;
            fj__subcmd__help__subcmd__repo__subcmd__units,releases)
                cmd="fj__subcmd__help__subcmd__repo__subcmd__units__subcmd__releases"
                ;;
            fj__subcmd__help__subcmd__repo__subcmd__units,wiki)
                cmd="fj__subcmd__help__subcmd__repo__subcmd__units__subcmd__wiki"
                ;;
            fj__subcmd__help__subcmd__tag,create)
                cmd="fj__subcmd__help__subcmd__tag__subcmd__create"
                ;;
            fj__subcmd__help__subcmd__tag,delete)
                cmd="fj__subcmd__help__subcmd__tag__subcmd__delete"
                ;;
            fj__subcmd__help__subcmd__tag,list)
                cmd="fj__subcmd__help__subcmd__tag__subcmd__list"
                ;;
            fj__subcmd__help__subcmd__tag,view)
                cmd="fj__subcmd__help__subcmd__tag__subcmd__view"
                ;;
            fj__subcmd__help__subcmd__user,activity)
                cmd="fj__subcmd__help__subcmd__user__subcmd__activity"
                ;;
            fj__subcmd__help__subcmd__user,block)
                cmd="fj__subcmd__help__subcmd__user__subcmd__block"
                ;;
            fj__subcmd__help__subcmd__user,browse)
                cmd="fj__subcmd__help__subcmd__user__subcmd__browse"
                ;;
            fj__subcmd__help__subcmd__user,edit)
                cmd="fj__subcmd__help__subcmd__user__subcmd__edit"
                ;;
            fj__subcmd__help__subcmd__user,follow)
                cmd="fj__subcmd__help__subcmd__user__subcmd__follow"
                ;;
            fj__subcmd__help__subcmd__user,followers)
                cmd="fj__subcmd__help__subcmd__user__subcmd__followers"
                ;;
            fj__subcmd__help__subcmd__user,following)
                cmd="fj__subcmd__help__subcmd__user__subcmd__following"
                ;;
            fj__subcmd__help__subcmd__user,gpg)
                cmd="fj__subcmd__help__subcmd__user__subcmd__gpg"
                ;;
            fj__subcmd__help__subcmd__user,key)
                cmd="fj__subcmd__help__subcmd__user__subcmd__key"
                ;;
            fj__subcmd__help__subcmd__user,orgs)
                cmd="fj__subcmd__help__subcmd__user__subcmd__orgs"
                ;;
            fj__subcmd__help__subcmd__user,repos)
                cmd="fj__subcmd__help__subcmd__user__subcmd__repos"
                ;;
            fj__subcmd__help__subcmd__user,search)
                cmd="fj__subcmd__help__subcmd__user__subcmd__search"
                ;;
            fj__subcmd__help__subcmd__user,unblock)
                cmd="fj__subcmd__help__subcmd__user__subcmd__unblock"
                ;;
            fj__subcmd__help__subcmd__user,unfollow)
                cmd="fj__subcmd__help__subcmd__user__subcmd__unfollow"
                ;;
            fj__subcmd__help__subcmd__user,view)
                cmd="fj__subcmd__help__subcmd__user__subcmd__view"
                ;;
            fj__subcmd__help__subcmd__user__subcmd__edit,activity)
                cmd="fj__subcmd__help__subcmd__user__subcmd__edit__subcmd__activity"
                ;;
            fj__subcmd__help__subcmd__user__subcmd__edit,bio)
                cmd="fj__subcmd__help__subcmd__user__subcmd__edit__subcmd__bio"
                ;;
            fj__subcmd__help__subcmd__user__subcmd__edit,email)
                cmd="fj__subcmd__help__subcmd__user__subcmd__edit__subcmd__email"
                ;;
            fj__subcmd__help__subcmd__user__subcmd__edit,location)
                cmd="fj__subcmd__help__subcmd__user__subcmd__edit__subcmd__location"
                ;;
            fj__subcmd__help__subcmd__user__subcmd__edit,name)
                cmd="fj__subcmd__help__subcmd__user__subcmd__edit__subcmd__name"
                ;;
            fj__subcmd__help__subcmd__user__subcmd__edit,pronouns)
                cmd="fj__subcmd__help__subcmd__user__subcmd__edit__subcmd__pronouns"
                ;;
            fj__subcmd__help__subcmd__user__subcmd__edit,website)
                cmd="fj__subcmd__help__subcmd__user__subcmd__edit__subcmd__website"
                ;;
            fj__subcmd__help__subcmd__user__subcmd__gpg,delete)
                cmd="fj__subcmd__help__subcmd__user__subcmd__gpg__subcmd__delete"
                ;;
            fj__subcmd__help__subcmd__user__subcmd__gpg,list)
                cmd="fj__subcmd__help__subcmd__user__subcmd__gpg__subcmd__list"
                ;;
            fj__subcmd__help__subcmd__user__subcmd__gpg,upload)
                cmd="fj__subcmd__help__subcmd__user__subcmd__gpg__subcmd__upload"
                ;;
            fj__subcmd__help__subcmd__user__subcmd__gpg,verify)
                cmd="fj__subcmd__help__subcmd__user__subcmd__gpg__subcmd__verify"
                ;;
            fj__subcmd__help__subcmd__user__subcmd__gpg,view)
                cmd="fj__subcmd__help__subcmd__user__subcmd__gpg__subcmd__view"
                ;;
            fj__subcmd__help__subcmd__user__subcmd__key,delete)
                cmd="fj__subcmd__help__subcmd__user__subcmd__key__subcmd__delete"
                ;;
            fj__subcmd__help__subcmd__user__subcmd__key,list)
                cmd="fj__subcmd__help__subcmd__user__subcmd__key__subcmd__list"
                ;;
            fj__subcmd__help__subcmd__user__subcmd__key,upload)
                cmd="fj__subcmd__help__subcmd__user__subcmd__key__subcmd__upload"
                ;;
            fj__subcmd__help__subcmd__user__subcmd__key,view)
                cmd="fj__subcmd__help__subcmd__user__subcmd__key__subcmd__view"
                ;;
            fj__subcmd__help__subcmd__wiki,browse)
                cmd="fj__subcmd__help__subcmd__wiki__subcmd__browse"
                ;;
            fj__subcmd__help__subcmd__wiki,clone)
                cmd="fj__subcmd__help__subcmd__wiki__subcmd__clone"
                ;;
            fj__subcmd__help__subcmd__wiki,contents)
                cmd="fj__subcmd__help__subcmd__wiki__subcmd__contents"
                ;;
            fj__subcmd__help__subcmd__wiki,view)
                cmd="fj__subcmd__help__subcmd__wiki__subcmd__view"
                ;;
            fj__subcmd__issue,assign)
                cmd="fj__subcmd__issue__subcmd__assign"
                ;;
            fj__subcmd__issue,browse)
                cmd="fj__subcmd__issue__subcmd__browse"
                ;;
            fj__subcmd__issue,close)
                cmd="fj__subcmd__issue__subcmd__close"
                ;;
            fj__subcmd__issue,comment)
                cmd="fj__subcmd__issue__subcmd__comment"
                ;;
            fj__subcmd__issue,create)
                cmd="fj__subcmd__issue__subcmd__create"
                ;;
            fj__subcmd__issue,edit)
                cmd="fj__subcmd__issue__subcmd__edit"
                ;;
            fj__subcmd__issue,help)
                cmd="fj__subcmd__issue__subcmd__help"
                ;;
            fj__subcmd__issue,search)
                cmd="fj__subcmd__issue__subcmd__search"
                ;;
            fj__subcmd__issue,templates)
                cmd="fj__subcmd__issue__subcmd__templates"
                ;;
            fj__subcmd__issue,unassign)
                cmd="fj__subcmd__issue__subcmd__unassign"
                ;;
            fj__subcmd__issue,view)
                cmd="fj__subcmd__issue__subcmd__view"
                ;;
            fj__subcmd__issue__subcmd__edit,body)
                cmd="fj__subcmd__issue__subcmd__edit__subcmd__body"
                ;;
            fj__subcmd__issue__subcmd__edit,comment)
                cmd="fj__subcmd__issue__subcmd__edit__subcmd__comment"
                ;;
            fj__subcmd__issue__subcmd__edit,help)
                cmd="fj__subcmd__issue__subcmd__edit__subcmd__help"
                ;;
            fj__subcmd__issue__subcmd__edit,labels)
                cmd="fj__subcmd__issue__subcmd__edit__subcmd__labels"
                ;;
            fj__subcmd__issue__subcmd__edit,title)
                cmd="fj__subcmd__issue__subcmd__edit__subcmd__title"
                ;;
            fj__subcmd__issue__subcmd__edit__subcmd__help,body)
                cmd="fj__subcmd__issue__subcmd__edit__subcmd__help__subcmd__body"
                ;;
            fj__subcmd__issue__subcmd__edit__subcmd__help,comment)
                cmd="fj__subcmd__issue__subcmd__edit__subcmd__help__subcmd__comment"
                ;;
            fj__subcmd__issue__subcmd__edit__subcmd__help,help)
                cmd="fj__subcmd__issue__subcmd__edit__subcmd__help__subcmd__help"
                ;;
            fj__subcmd__issue__subcmd__edit__subcmd__help,labels)
                cmd="fj__subcmd__issue__subcmd__edit__subcmd__help__subcmd__labels"
                ;;
            fj__subcmd__issue__subcmd__edit__subcmd__help,title)
                cmd="fj__subcmd__issue__subcmd__edit__subcmd__help__subcmd__title"
                ;;
            fj__subcmd__issue__subcmd__help,assign)
                cmd="fj__subcmd__issue__subcmd__help__subcmd__assign"
                ;;
            fj__subcmd__issue__subcmd__help,browse)
                cmd="fj__subcmd__issue__subcmd__help__subcmd__browse"
                ;;
            fj__subcmd__issue__subcmd__help,close)
                cmd="fj__subcmd__issue__subcmd__help__subcmd__close"
                ;;
            fj__subcmd__issue__subcmd__help,comment)
                cmd="fj__subcmd__issue__subcmd__help__subcmd__comment"
                ;;
            fj__subcmd__issue__subcmd__help,create)
                cmd="fj__subcmd__issue__subcmd__help__subcmd__create"
                ;;
            fj__subcmd__issue__subcmd__help,edit)
                cmd="fj__subcmd__issue__subcmd__help__subcmd__edit"
                ;;
            fj__subcmd__issue__subcmd__help,help)
                cmd="fj__subcmd__issue__subcmd__help__subcmd__help"
                ;;
            fj__subcmd__issue__subcmd__help,search)
                cmd="fj__subcmd__issue__subcmd__help__subcmd__search"
                ;;
            fj__subcmd__issue__subcmd__help,templates)
                cmd="fj__subcmd__issue__subcmd__help__subcmd__templates"
                ;;
            fj__subcmd__issue__subcmd__help,unassign)
                cmd="fj__subcmd__issue__subcmd__help__subcmd__unassign"
                ;;
            fj__subcmd__issue__subcmd__help,view)
                cmd="fj__subcmd__issue__subcmd__help__subcmd__view"
                ;;
            fj__subcmd__issue__subcmd__help__subcmd__edit,body)
                cmd="fj__subcmd__issue__subcmd__help__subcmd__edit__subcmd__body"
                ;;
            fj__subcmd__issue__subcmd__help__subcmd__edit,comment)
                cmd="fj__subcmd__issue__subcmd__help__subcmd__edit__subcmd__comment"
                ;;
            fj__subcmd__issue__subcmd__help__subcmd__edit,labels)
                cmd="fj__subcmd__issue__subcmd__help__subcmd__edit__subcmd__labels"
                ;;
            fj__subcmd__issue__subcmd__help__subcmd__edit,title)
                cmd="fj__subcmd__issue__subcmd__help__subcmd__edit__subcmd__title"
                ;;
            fj__subcmd__issue__subcmd__help__subcmd__view,body)
                cmd="fj__subcmd__issue__subcmd__help__subcmd__view__subcmd__body"
                ;;
            fj__subcmd__issue__subcmd__help__subcmd__view,comment)
                cmd="fj__subcmd__issue__subcmd__help__subcmd__view__subcmd__comment"
                ;;
            fj__subcmd__issue__subcmd__help__subcmd__view,comments)
                cmd="fj__subcmd__issue__subcmd__help__subcmd__view__subcmd__comments"
                ;;
            fj__subcmd__issue__subcmd__view,body)
                cmd="fj__subcmd__issue__subcmd__view__subcmd__body"
                ;;
            fj__subcmd__issue__subcmd__view,comment)
                cmd="fj__subcmd__issue__subcmd__view__subcmd__comment"
                ;;
            fj__subcmd__issue__subcmd__view,comments)
                cmd="fj__subcmd__issue__subcmd__view__subcmd__comments"
                ;;
            fj__subcmd__issue__subcmd__view,help)
                cmd="fj__subcmd__issue__subcmd__view__subcmd__help"
                ;;
            fj__subcmd__issue__subcmd__view__subcmd__help,body)
                cmd="fj__subcmd__issue__subcmd__view__subcmd__help__subcmd__body"
                ;;
            fj__subcmd__issue__subcmd__view__subcmd__help,comment)
                cmd="fj__subcmd__issue__subcmd__view__subcmd__help__subcmd__comment"
                ;;
            fj__subcmd__issue__subcmd__view__subcmd__help,comments)
                cmd="fj__subcmd__issue__subcmd__view__subcmd__help__subcmd__comments"
                ;;
            fj__subcmd__issue__subcmd__view__subcmd__help,help)
                cmd="fj__subcmd__issue__subcmd__view__subcmd__help__subcmd__help"
                ;;
            fj__subcmd__org,activity)
                cmd="fj__subcmd__org__subcmd__activity"
                ;;
            fj__subcmd__org,create)
                cmd="fj__subcmd__org__subcmd__create"
                ;;
            fj__subcmd__org,edit)
                cmd="fj__subcmd__org__subcmd__edit"
                ;;
            fj__subcmd__org,help)
                cmd="fj__subcmd__org__subcmd__help"
                ;;
            fj__subcmd__org,label)
                cmd="fj__subcmd__org__subcmd__label"
                ;;
            fj__subcmd__org,list)
                cmd="fj__subcmd__org__subcmd__list"
                ;;
            fj__subcmd__org,members)
                cmd="fj__subcmd__org__subcmd__members"
                ;;
            fj__subcmd__org,repo)
                cmd="fj__subcmd__org__subcmd__repo"
                ;;
            fj__subcmd__org,team)
                cmd="fj__subcmd__org__subcmd__team"
                ;;
            fj__subcmd__org,view)
                cmd="fj__subcmd__org__subcmd__view"
                ;;
            fj__subcmd__org,visibility)
                cmd="fj__subcmd__org__subcmd__visibility"
                ;;
            fj__subcmd__org__subcmd__help,activity)
                cmd="fj__subcmd__org__subcmd__help__subcmd__activity"
                ;;
            fj__subcmd__org__subcmd__help,create)
                cmd="fj__subcmd__org__subcmd__help__subcmd__create"
                ;;
            fj__subcmd__org__subcmd__help,edit)
                cmd="fj__subcmd__org__subcmd__help__subcmd__edit"
                ;;
            fj__subcmd__org__subcmd__help,help)
                cmd="fj__subcmd__org__subcmd__help__subcmd__help"
                ;;
            fj__subcmd__org__subcmd__help,label)
                cmd="fj__subcmd__org__subcmd__help__subcmd__label"
                ;;
            fj__subcmd__org__subcmd__help,list)
                cmd="fj__subcmd__org__subcmd__help__subcmd__list"
                ;;
            fj__subcmd__org__subcmd__help,members)
                cmd="fj__subcmd__org__subcmd__help__subcmd__members"
                ;;
            fj__subcmd__org__subcmd__help,repo)
                cmd="fj__subcmd__org__subcmd__help__subcmd__repo"
                ;;
            fj__subcmd__org__subcmd__help,team)
                cmd="fj__subcmd__org__subcmd__help__subcmd__team"
                ;;
            fj__subcmd__org__subcmd__help,view)
                cmd="fj__subcmd__org__subcmd__help__subcmd__view"
                ;;
            fj__subcmd__org__subcmd__help,visibility)
                cmd="fj__subcmd__org__subcmd__help__subcmd__visibility"
                ;;
            fj__subcmd__org__subcmd__help__subcmd__label,add)
                cmd="fj__subcmd__org__subcmd__help__subcmd__label__subcmd__add"
                ;;
            fj__subcmd__org__subcmd__help__subcmd__label,edit)
                cmd="fj__subcmd__org__subcmd__help__subcmd__label__subcmd__edit"
                ;;
            fj__subcmd__org__subcmd__help__subcmd__label,list)
                cmd="fj__subcmd__org__subcmd__help__subcmd__label__subcmd__list"
                ;;
            fj__subcmd__org__subcmd__help__subcmd__label,rm)
                cmd="fj__subcmd__org__subcmd__help__subcmd__label__subcmd__rm"
                ;;
            fj__subcmd__org__subcmd__help__subcmd__repo,create)
                cmd="fj__subcmd__org__subcmd__help__subcmd__repo__subcmd__create"
                ;;
            fj__subcmd__org__subcmd__help__subcmd__repo,list)
                cmd="fj__subcmd__org__subcmd__help__subcmd__repo__subcmd__list"
                ;;
            fj__subcmd__org__subcmd__help__subcmd__team,create)
                cmd="fj__subcmd__org__subcmd__help__subcmd__team__subcmd__create"
                ;;
            fj__subcmd__org__subcmd__help__subcmd__team,delete)
                cmd="fj__subcmd__org__subcmd__help__subcmd__team__subcmd__delete"
                ;;
            fj__subcmd__org__subcmd__help__subcmd__team,edit)
                cmd="fj__subcmd__org__subcmd__help__subcmd__team__subcmd__edit"
                ;;
            fj__subcmd__org__subcmd__help__subcmd__team,list)
                cmd="fj__subcmd__org__subcmd__help__subcmd__team__subcmd__list"
                ;;
            fj__subcmd__org__subcmd__help__subcmd__team,member)
                cmd="fj__subcmd__org__subcmd__help__subcmd__team__subcmd__member"
                ;;
            fj__subcmd__org__subcmd__help__subcmd__team,repo)
                cmd="fj__subcmd__org__subcmd__help__subcmd__team__subcmd__repo"
                ;;
            fj__subcmd__org__subcmd__help__subcmd__team,view)
                cmd="fj__subcmd__org__subcmd__help__subcmd__team__subcmd__view"
                ;;
            fj__subcmd__org__subcmd__help__subcmd__team__subcmd__member,add)
                cmd="fj__subcmd__org__subcmd__help__subcmd__team__subcmd__member__subcmd__add"
                ;;
            fj__subcmd__org__subcmd__help__subcmd__team__subcmd__member,list)
                cmd="fj__subcmd__org__subcmd__help__subcmd__team__subcmd__member__subcmd__list"
                ;;
            fj__subcmd__org__subcmd__help__subcmd__team__subcmd__member,rm)
                cmd="fj__subcmd__org__subcmd__help__subcmd__team__subcmd__member__subcmd__rm"
                ;;
            fj__subcmd__org__subcmd__help__subcmd__team__subcmd__repo,add)
                cmd="fj__subcmd__org__subcmd__help__subcmd__team__subcmd__repo__subcmd__add"
                ;;
            fj__subcmd__org__subcmd__help__subcmd__team__subcmd__repo,list)
                cmd="fj__subcmd__org__subcmd__help__subcmd__team__subcmd__repo__subcmd__list"
                ;;
            fj__subcmd__org__subcmd__help__subcmd__team__subcmd__repo,rm)
                cmd="fj__subcmd__org__subcmd__help__subcmd__team__subcmd__repo__subcmd__rm"
                ;;
            fj__subcmd__org__subcmd__label,add)
                cmd="fj__subcmd__org__subcmd__label__subcmd__add"
                ;;
            fj__subcmd__org__subcmd__label,edit)
                cmd="fj__subcmd__org__subcmd__label__subcmd__edit"
                ;;
            fj__subcmd__org__subcmd__label,help)
                cmd="fj__subcmd__org__subcmd__label__subcmd__help"
                ;;
            fj__subcmd__org__subcmd__label,list)
                cmd="fj__subcmd__org__subcmd__label__subcmd__list"
                ;;
            fj__subcmd__org__subcmd__label,rm)
                cmd="fj__subcmd__org__subcmd__label__subcmd__rm"
                ;;
            fj__subcmd__org__subcmd__label__subcmd__help,add)
                cmd="fj__subcmd__org__subcmd__label__subcmd__help__subcmd__add"
                ;;
            fj__subcmd__org__subcmd__label__subcmd__help,edit)
                cmd="fj__subcmd__org__subcmd__label__subcmd__help__subcmd__edit"
                ;;
            fj__subcmd__org__subcmd__label__subcmd__help,help)
                cmd="fj__subcmd__org__subcmd__label__subcmd__help__subcmd__help"
                ;;
            fj__subcmd__org__subcmd__label__subcmd__help,list)
                cmd="fj__subcmd__org__subcmd__label__subcmd__help__subcmd__list"
                ;;
            fj__subcmd__org__subcmd__label__subcmd__help,rm)
                cmd="fj__subcmd__org__subcmd__label__subcmd__help__subcmd__rm"
                ;;
            fj__subcmd__org__subcmd__repo,create)
                cmd="fj__subcmd__org__subcmd__repo__subcmd__create"
                ;;
            fj__subcmd__org__subcmd__repo,help)
                cmd="fj__subcmd__org__subcmd__repo__subcmd__help"
                ;;
            fj__subcmd__org__subcmd__repo,list)
                cmd="fj__subcmd__org__subcmd__repo__subcmd__list"
                ;;
            fj__subcmd__org__subcmd__repo__subcmd__help,create)
                cmd="fj__subcmd__org__subcmd__repo__subcmd__help__subcmd__create"
                ;;
            fj__subcmd__org__subcmd__repo__subcmd__help,help)
                cmd="fj__subcmd__org__subcmd__repo__subcmd__help__subcmd__help"
                ;;
            fj__subcmd__org__subcmd__repo__subcmd__help,list)
                cmd="fj__subcmd__org__subcmd__repo__subcmd__help__subcmd__list"
                ;;
            fj__subcmd__org__subcmd__team,create)
                cmd="fj__subcmd__org__subcmd__team__subcmd__create"
                ;;
            fj__subcmd__org__subcmd__team,delete)
                cmd="fj__subcmd__org__subcmd__team__subcmd__delete"
                ;;
            fj__subcmd__org__subcmd__team,edit)
                cmd="fj__subcmd__org__subcmd__team__subcmd__edit"
                ;;
            fj__subcmd__org__subcmd__team,help)
                cmd="fj__subcmd__org__subcmd__team__subcmd__help"
                ;;
            fj__subcmd__org__subcmd__team,list)
                cmd="fj__subcmd__org__subcmd__team__subcmd__list"
                ;;
            fj__subcmd__org__subcmd__team,member)
                cmd="fj__subcmd__org__subcmd__team__subcmd__member"
                ;;
            fj__subcmd__org__subcmd__team,repo)
                cmd="fj__subcmd__org__subcmd__team__subcmd__repo"
                ;;
            fj__subcmd__org__subcmd__team,view)
                cmd="fj__subcmd__org__subcmd__team__subcmd__view"
                ;;
            fj__subcmd__org__subcmd__team__subcmd__help,create)
                cmd="fj__subcmd__org__subcmd__team__subcmd__help__subcmd__create"
                ;;
            fj__subcmd__org__subcmd__team__subcmd__help,delete)
                cmd="fj__subcmd__org__subcmd__team__subcmd__help__subcmd__delete"
                ;;
            fj__subcmd__org__subcmd__team__subcmd__help,edit)
                cmd="fj__subcmd__org__subcmd__team__subcmd__help__subcmd__edit"
                ;;
            fj__subcmd__org__subcmd__team__subcmd__help,help)
                cmd="fj__subcmd__org__subcmd__team__subcmd__help__subcmd__help"
                ;;
            fj__subcmd__org__subcmd__team__subcmd__help,list)
                cmd="fj__subcmd__org__subcmd__team__subcmd__help__subcmd__list"
                ;;
            fj__subcmd__org__subcmd__team__subcmd__help,member)
                cmd="fj__subcmd__org__subcmd__team__subcmd__help__subcmd__member"
                ;;
            fj__subcmd__org__subcmd__team__subcmd__help,repo)
                cmd="fj__subcmd__org__subcmd__team__subcmd__help__subcmd__repo"
                ;;
            fj__subcmd__org__subcmd__team__subcmd__help,view)
                cmd="fj__subcmd__org__subcmd__team__subcmd__help__subcmd__view"
                ;;
            fj__subcmd__org__subcmd__team__subcmd__help__subcmd__member,add)
                cmd="fj__subcmd__org__subcmd__team__subcmd__help__subcmd__member__subcmd__add"
                ;;
            fj__subcmd__org__subcmd__team__subcmd__help__subcmd__member,list)
                cmd="fj__subcmd__org__subcmd__team__subcmd__help__subcmd__member__subcmd__list"
                ;;
            fj__subcmd__org__subcmd__team__subcmd__help__subcmd__member,rm)
                cmd="fj__subcmd__org__subcmd__team__subcmd__help__subcmd__member__subcmd__rm"
                ;;
            fj__subcmd__org__subcmd__team__subcmd__help__subcmd__repo,add)
                cmd="fj__subcmd__org__subcmd__team__subcmd__help__subcmd__repo__subcmd__add"
                ;;
            fj__subcmd__org__subcmd__team__subcmd__help__subcmd__repo,list)
                cmd="fj__subcmd__org__subcmd__team__subcmd__help__subcmd__repo__subcmd__list"
                ;;
            fj__subcmd__org__subcmd__team__subcmd__help__subcmd__repo,rm)
                cmd="fj__subcmd__org__subcmd__team__subcmd__help__subcmd__repo__subcmd__rm"
                ;;
            fj__subcmd__org__subcmd__team__subcmd__member,add)
                cmd="fj__subcmd__org__subcmd__team__subcmd__member__subcmd__add"
                ;;
            fj__subcmd__org__subcmd__team__subcmd__member,help)
                cmd="fj__subcmd__org__subcmd__team__subcmd__member__subcmd__help"
                ;;
            fj__subcmd__org__subcmd__team__subcmd__member,list)
                cmd="fj__subcmd__org__subcmd__team__subcmd__member__subcmd__list"
                ;;
            fj__subcmd__org__subcmd__team__subcmd__member,rm)
                cmd="fj__subcmd__org__subcmd__team__subcmd__member__subcmd__rm"
                ;;
            fj__subcmd__org__subcmd__team__subcmd__member__subcmd__help,add)
                cmd="fj__subcmd__org__subcmd__team__subcmd__member__subcmd__help__subcmd__add"
                ;;
            fj__subcmd__org__subcmd__team__subcmd__member__subcmd__help,help)
                cmd="fj__subcmd__org__subcmd__team__subcmd__member__subcmd__help__subcmd__help"
                ;;
            fj__subcmd__org__subcmd__team__subcmd__member__subcmd__help,list)
                cmd="fj__subcmd__org__subcmd__team__subcmd__member__subcmd__help__subcmd__list"
                ;;
            fj__subcmd__org__subcmd__team__subcmd__member__subcmd__help,rm)
                cmd="fj__subcmd__org__subcmd__team__subcmd__member__subcmd__help__subcmd__rm"
                ;;
            fj__subcmd__org__subcmd__team__subcmd__repo,add)
                cmd="fj__subcmd__org__subcmd__team__subcmd__repo__subcmd__add"
                ;;
            fj__subcmd__org__subcmd__team__subcmd__repo,help)
                cmd="fj__subcmd__org__subcmd__team__subcmd__repo__subcmd__help"
                ;;
            fj__subcmd__org__subcmd__team__subcmd__repo,list)
                cmd="fj__subcmd__org__subcmd__team__subcmd__repo__subcmd__list"
                ;;
            fj__subcmd__org__subcmd__team__subcmd__repo,rm)
                cmd="fj__subcmd__org__subcmd__team__subcmd__repo__subcmd__rm"
                ;;
            fj__subcmd__org__subcmd__team__subcmd__repo__subcmd__help,add)
                cmd="fj__subcmd__org__subcmd__team__subcmd__repo__subcmd__help__subcmd__add"
                ;;
            fj__subcmd__org__subcmd__team__subcmd__repo__subcmd__help,help)
                cmd="fj__subcmd__org__subcmd__team__subcmd__repo__subcmd__help__subcmd__help"
                ;;
            fj__subcmd__org__subcmd__team__subcmd__repo__subcmd__help,list)
                cmd="fj__subcmd__org__subcmd__team__subcmd__repo__subcmd__help__subcmd__list"
                ;;
            fj__subcmd__org__subcmd__team__subcmd__repo__subcmd__help,rm)
                cmd="fj__subcmd__org__subcmd__team__subcmd__repo__subcmd__help__subcmd__rm"
                ;;
            fj__subcmd__pr,assign)
                cmd="fj__subcmd__pr__subcmd__assign"
                ;;
            fj__subcmd__pr,browse)
                cmd="fj__subcmd__pr__subcmd__browse"
                ;;
            fj__subcmd__pr,checkout)
                cmd="fj__subcmd__pr__subcmd__checkout"
                ;;
            fj__subcmd__pr,close)
                cmd="fj__subcmd__pr__subcmd__close"
                ;;
            fj__subcmd__pr,comment)
                cmd="fj__subcmd__pr__subcmd__comment"
                ;;
            fj__subcmd__pr,create)
                cmd="fj__subcmd__pr__subcmd__create"
                ;;
            fj__subcmd__pr,edit)
                cmd="fj__subcmd__pr__subcmd__edit"
                ;;
            fj__subcmd__pr,help)
                cmd="fj__subcmd__pr__subcmd__help"
                ;;
            fj__subcmd__pr,merge)
                cmd="fj__subcmd__pr__subcmd__merge"
                ;;
            fj__subcmd__pr,search)
                cmd="fj__subcmd__pr__subcmd__search"
                ;;
            fj__subcmd__pr,status)
                cmd="fj__subcmd__pr__subcmd__status"
                ;;
            fj__subcmd__pr,unassign)
                cmd="fj__subcmd__pr__subcmd__unassign"
                ;;
            fj__subcmd__pr,view)
                cmd="fj__subcmd__pr__subcmd__view"
                ;;
            fj__subcmd__pr__subcmd__edit,body)
                cmd="fj__subcmd__pr__subcmd__edit__subcmd__body"
                ;;
            fj__subcmd__pr__subcmd__edit,comment)
                cmd="fj__subcmd__pr__subcmd__edit__subcmd__comment"
                ;;
            fj__subcmd__pr__subcmd__edit,help)
                cmd="fj__subcmd__pr__subcmd__edit__subcmd__help"
                ;;
            fj__subcmd__pr__subcmd__edit,labels)
                cmd="fj__subcmd__pr__subcmd__edit__subcmd__labels"
                ;;
            fj__subcmd__pr__subcmd__edit,title)
                cmd="fj__subcmd__pr__subcmd__edit__subcmd__title"
                ;;
            fj__subcmd__pr__subcmd__edit__subcmd__help,body)
                cmd="fj__subcmd__pr__subcmd__edit__subcmd__help__subcmd__body"
                ;;
            fj__subcmd__pr__subcmd__edit__subcmd__help,comment)
                cmd="fj__subcmd__pr__subcmd__edit__subcmd__help__subcmd__comment"
                ;;
            fj__subcmd__pr__subcmd__edit__subcmd__help,help)
                cmd="fj__subcmd__pr__subcmd__edit__subcmd__help__subcmd__help"
                ;;
            fj__subcmd__pr__subcmd__edit__subcmd__help,labels)
                cmd="fj__subcmd__pr__subcmd__edit__subcmd__help__subcmd__labels"
                ;;
            fj__subcmd__pr__subcmd__edit__subcmd__help,title)
                cmd="fj__subcmd__pr__subcmd__edit__subcmd__help__subcmd__title"
                ;;
            fj__subcmd__pr__subcmd__help,assign)
                cmd="fj__subcmd__pr__subcmd__help__subcmd__assign"
                ;;
            fj__subcmd__pr__subcmd__help,browse)
                cmd="fj__subcmd__pr__subcmd__help__subcmd__browse"
                ;;
            fj__subcmd__pr__subcmd__help,checkout)
                cmd="fj__subcmd__pr__subcmd__help__subcmd__checkout"
                ;;
            fj__subcmd__pr__subcmd__help,close)
                cmd="fj__subcmd__pr__subcmd__help__subcmd__close"
                ;;
            fj__subcmd__pr__subcmd__help,comment)
                cmd="fj__subcmd__pr__subcmd__help__subcmd__comment"
                ;;
            fj__subcmd__pr__subcmd__help,create)
                cmd="fj__subcmd__pr__subcmd__help__subcmd__create"
                ;;
            fj__subcmd__pr__subcmd__help,edit)
                cmd="fj__subcmd__pr__subcmd__help__subcmd__edit"
                ;;
            fj__subcmd__pr__subcmd__help,help)
                cmd="fj__subcmd__pr__subcmd__help__subcmd__help"
                ;;
            fj__subcmd__pr__subcmd__help,merge)
                cmd="fj__subcmd__pr__subcmd__help__subcmd__merge"
                ;;
            fj__subcmd__pr__subcmd__help,search)
                cmd="fj__subcmd__pr__subcmd__help__subcmd__search"
                ;;
            fj__subcmd__pr__subcmd__help,status)
                cmd="fj__subcmd__pr__subcmd__help__subcmd__status"
                ;;
            fj__subcmd__pr__subcmd__help,unassign)
                cmd="fj__subcmd__pr__subcmd__help__subcmd__unassign"
                ;;
            fj__subcmd__pr__subcmd__help,view)
                cmd="fj__subcmd__pr__subcmd__help__subcmd__view"
                ;;
            fj__subcmd__pr__subcmd__help__subcmd__edit,body)
                cmd="fj__subcmd__pr__subcmd__help__subcmd__edit__subcmd__body"
                ;;
            fj__subcmd__pr__subcmd__help__subcmd__edit,comment)
                cmd="fj__subcmd__pr__subcmd__help__subcmd__edit__subcmd__comment"
                ;;
            fj__subcmd__pr__subcmd__help__subcmd__edit,labels)
                cmd="fj__subcmd__pr__subcmd__help__subcmd__edit__subcmd__labels"
                ;;
            fj__subcmd__pr__subcmd__help__subcmd__edit,title)
                cmd="fj__subcmd__pr__subcmd__help__subcmd__edit__subcmd__title"
                ;;
            fj__subcmd__pr__subcmd__help__subcmd__view,body)
                cmd="fj__subcmd__pr__subcmd__help__subcmd__view__subcmd__body"
                ;;
            fj__subcmd__pr__subcmd__help__subcmd__view,comment)
                cmd="fj__subcmd__pr__subcmd__help__subcmd__view__subcmd__comment"
                ;;
            fj__subcmd__pr__subcmd__help__subcmd__view,comments)
                cmd="fj__subcmd__pr__subcmd__help__subcmd__view__subcmd__comments"
                ;;
            fj__subcmd__pr__subcmd__help__subcmd__view,commits)
                cmd="fj__subcmd__pr__subcmd__help__subcmd__view__subcmd__commits"
                ;;
            fj__subcmd__pr__subcmd__help__subcmd__view,diff)
                cmd="fj__subcmd__pr__subcmd__help__subcmd__view__subcmd__diff"
                ;;
            fj__subcmd__pr__subcmd__help__subcmd__view,files)
                cmd="fj__subcmd__pr__subcmd__help__subcmd__view__subcmd__files"
                ;;
            fj__subcmd__pr__subcmd__help__subcmd__view,labels)
                cmd="fj__subcmd__pr__subcmd__help__subcmd__view__subcmd__labels"
                ;;
            fj__subcmd__pr__subcmd__view,body)
                cmd="fj__subcmd__pr__subcmd__view__subcmd__body"
                ;;
            fj__subcmd__pr__subcmd__view,comment)
                cmd="fj__subcmd__pr__subcmd__view__subcmd__comment"
                ;;
            fj__subcmd__pr__subcmd__view,comments)
                cmd="fj__subcmd__pr__subcmd__view__subcmd__comments"
                ;;
            fj__subcmd__pr__subcmd__view,commits)
                cmd="fj__subcmd__pr__subcmd__view__subcmd__commits"
                ;;
            fj__subcmd__pr__subcmd__view,diff)
                cmd="fj__subcmd__pr__subcmd__view__subcmd__diff"
                ;;
            fj__subcmd__pr__subcmd__view,files)
                cmd="fj__subcmd__pr__subcmd__view__subcmd__files"
                ;;
            fj__subcmd__pr__subcmd__view,help)
                cmd="fj__subcmd__pr__subcmd__view__subcmd__help"
                ;;
            fj__subcmd__pr__subcmd__view,labels)
                cmd="fj__subcmd__pr__subcmd__view__subcmd__labels"
                ;;
            fj__subcmd__pr__subcmd__view__subcmd__help,body)
                cmd="fj__subcmd__pr__subcmd__view__subcmd__help__subcmd__body"
                ;;
            fj__subcmd__pr__subcmd__view__subcmd__help,comment)
                cmd="fj__subcmd__pr__subcmd__view__subcmd__help__subcmd__comment"
                ;;
            fj__subcmd__pr__subcmd__view__subcmd__help,comments)
                cmd="fj__subcmd__pr__subcmd__view__subcmd__help__subcmd__comments"
                ;;
            fj__subcmd__pr__subcmd__view__subcmd__help,commits)
                cmd="fj__subcmd__pr__subcmd__view__subcmd__help__subcmd__commits"
                ;;
            fj__subcmd__pr__subcmd__view__subcmd__help,diff)
                cmd="fj__subcmd__pr__subcmd__view__subcmd__help__subcmd__diff"
                ;;
            fj__subcmd__pr__subcmd__view__subcmd__help,files)
                cmd="fj__subcmd__pr__subcmd__view__subcmd__help__subcmd__files"
                ;;
            fj__subcmd__pr__subcmd__view__subcmd__help,help)
                cmd="fj__subcmd__pr__subcmd__view__subcmd__help__subcmd__help"
                ;;
            fj__subcmd__pr__subcmd__view__subcmd__help,labels)
                cmd="fj__subcmd__pr__subcmd__view__subcmd__help__subcmd__labels"
                ;;
            fj__subcmd__release,asset)
                cmd="fj__subcmd__release__subcmd__asset"
                ;;
            fj__subcmd__release,browse)
                cmd="fj__subcmd__release__subcmd__browse"
                ;;
            fj__subcmd__release,create)
                cmd="fj__subcmd__release__subcmd__create"
                ;;
            fj__subcmd__release,delete)
                cmd="fj__subcmd__release__subcmd__delete"
                ;;
            fj__subcmd__release,edit)
                cmd="fj__subcmd__release__subcmd__edit"
                ;;
            fj__subcmd__release,help)
                cmd="fj__subcmd__release__subcmd__help"
                ;;
            fj__subcmd__release,list)
                cmd="fj__subcmd__release__subcmd__list"
                ;;
            fj__subcmd__release,view)
                cmd="fj__subcmd__release__subcmd__view"
                ;;
            fj__subcmd__release__subcmd__asset,create)
                cmd="fj__subcmd__release__subcmd__asset__subcmd__create"
                ;;
            fj__subcmd__release__subcmd__asset,delete)
                cmd="fj__subcmd__release__subcmd__asset__subcmd__delete"
                ;;
            fj__subcmd__release__subcmd__asset,download)
                cmd="fj__subcmd__release__subcmd__asset__subcmd__download"
                ;;
            fj__subcmd__release__subcmd__asset,help)
                cmd="fj__subcmd__release__subcmd__asset__subcmd__help"
                ;;
            fj__subcmd__release__subcmd__asset__subcmd__help,create)
                cmd="fj__subcmd__release__subcmd__asset__subcmd__help__subcmd__create"
                ;;
            fj__subcmd__release__subcmd__asset__subcmd__help,delete)
                cmd="fj__subcmd__release__subcmd__asset__subcmd__help__subcmd__delete"
                ;;
            fj__subcmd__release__subcmd__asset__subcmd__help,download)
                cmd="fj__subcmd__release__subcmd__asset__subcmd__help__subcmd__download"
                ;;
            fj__subcmd__release__subcmd__asset__subcmd__help,help)
                cmd="fj__subcmd__release__subcmd__asset__subcmd__help__subcmd__help"
                ;;
            fj__subcmd__release__subcmd__help,asset)
                cmd="fj__subcmd__release__subcmd__help__subcmd__asset"
                ;;
            fj__subcmd__release__subcmd__help,browse)
                cmd="fj__subcmd__release__subcmd__help__subcmd__browse"
                ;;
            fj__subcmd__release__subcmd__help,create)
                cmd="fj__subcmd__release__subcmd__help__subcmd__create"
                ;;
            fj__subcmd__release__subcmd__help,delete)
                cmd="fj__subcmd__release__subcmd__help__subcmd__delete"
                ;;
            fj__subcmd__release__subcmd__help,edit)
                cmd="fj__subcmd__release__subcmd__help__subcmd__edit"
                ;;
            fj__subcmd__release__subcmd__help,help)
                cmd="fj__subcmd__release__subcmd__help__subcmd__help"
                ;;
            fj__subcmd__release__subcmd__help,list)
                cmd="fj__subcmd__release__subcmd__help__subcmd__list"
                ;;
            fj__subcmd__release__subcmd__help,view)
                cmd="fj__subcmd__release__subcmd__help__subcmd__view"
                ;;
            fj__subcmd__release__subcmd__help__subcmd__asset,create)
                cmd="fj__subcmd__release__subcmd__help__subcmd__asset__subcmd__create"
                ;;
            fj__subcmd__release__subcmd__help__subcmd__asset,delete)
                cmd="fj__subcmd__release__subcmd__help__subcmd__asset__subcmd__delete"
                ;;
            fj__subcmd__release__subcmd__help__subcmd__asset,download)
                cmd="fj__subcmd__release__subcmd__help__subcmd__asset__subcmd__download"
                ;;
            fj__subcmd__repo,browse)
                cmd="fj__subcmd__repo__subcmd__browse"
                ;;
            fj__subcmd__repo,clone)
                cmd="fj__subcmd__repo__subcmd__clone"
                ;;
            fj__subcmd__repo,create)
                cmd="fj__subcmd__repo__subcmd__create"
                ;;
            fj__subcmd__repo,delete)
                cmd="fj__subcmd__repo__subcmd__delete"
                ;;
            fj__subcmd__repo,edit)
                cmd="fj__subcmd__repo__subcmd__edit"
                ;;
            fj__subcmd__repo,fork)
                cmd="fj__subcmd__repo__subcmd__fork"
                ;;
            fj__subcmd__repo,help)
                cmd="fj__subcmd__repo__subcmd__help"
                ;;
            fj__subcmd__repo,labels)
                cmd="fj__subcmd__repo__subcmd__labels"
                ;;
            fj__subcmd__repo,migrate)
                cmd="fj__subcmd__repo__subcmd__migrate"
                ;;
            fj__subcmd__repo,readme)
                cmd="fj__subcmd__repo__subcmd__readme"
                ;;
            fj__subcmd__repo,star)
                cmd="fj__subcmd__repo__subcmd__star"
                ;;
            fj__subcmd__repo,units)
                cmd="fj__subcmd__repo__subcmd__units"
                ;;
            fj__subcmd__repo,unstar)
                cmd="fj__subcmd__repo__subcmd__unstar"
                ;;
            fj__subcmd__repo,view)
                cmd="fj__subcmd__repo__subcmd__view"
                ;;
            fj__subcmd__repo__subcmd__help,browse)
                cmd="fj__subcmd__repo__subcmd__help__subcmd__browse"
                ;;
            fj__subcmd__repo__subcmd__help,clone)
                cmd="fj__subcmd__repo__subcmd__help__subcmd__clone"
                ;;
            fj__subcmd__repo__subcmd__help,create)
                cmd="fj__subcmd__repo__subcmd__help__subcmd__create"
                ;;
            fj__subcmd__repo__subcmd__help,delete)
                cmd="fj__subcmd__repo__subcmd__help__subcmd__delete"
                ;;
            fj__subcmd__repo__subcmd__help,edit)
                cmd="fj__subcmd__repo__subcmd__help__subcmd__edit"
                ;;
            fj__subcmd__repo__subcmd__help,fork)
                cmd="fj__subcmd__repo__subcmd__help__subcmd__fork"
                ;;
            fj__subcmd__repo__subcmd__help,help)
                cmd="fj__subcmd__repo__subcmd__help__subcmd__help"
                ;;
            fj__subcmd__repo__subcmd__help,labels)
                cmd="fj__subcmd__repo__subcmd__help__subcmd__labels"
                ;;
            fj__subcmd__repo__subcmd__help,migrate)
                cmd="fj__subcmd__repo__subcmd__help__subcmd__migrate"
                ;;
            fj__subcmd__repo__subcmd__help,readme)
                cmd="fj__subcmd__repo__subcmd__help__subcmd__readme"
                ;;
            fj__subcmd__repo__subcmd__help,star)
                cmd="fj__subcmd__repo__subcmd__help__subcmd__star"
                ;;
            fj__subcmd__repo__subcmd__help,units)
                cmd="fj__subcmd__repo__subcmd__help__subcmd__units"
                ;;
            fj__subcmd__repo__subcmd__help,unstar)
                cmd="fj__subcmd__repo__subcmd__help__subcmd__unstar"
                ;;
            fj__subcmd__repo__subcmd__help,view)
                cmd="fj__subcmd__repo__subcmd__help__subcmd__view"
                ;;
            fj__subcmd__repo__subcmd__help__subcmd__labels,create)
                cmd="fj__subcmd__repo__subcmd__help__subcmd__labels__subcmd__create"
                ;;
            fj__subcmd__repo__subcmd__help__subcmd__labels,delete)
                cmd="fj__subcmd__repo__subcmd__help__subcmd__labels__subcmd__delete"
                ;;
            fj__subcmd__repo__subcmd__help__subcmd__labels,edit)
                cmd="fj__subcmd__repo__subcmd__help__subcmd__labels__subcmd__edit"
                ;;
            fj__subcmd__repo__subcmd__help__subcmd__labels,view)
                cmd="fj__subcmd__repo__subcmd__help__subcmd__labels__subcmd__view"
                ;;
            fj__subcmd__repo__subcmd__help__subcmd__units,actions)
                cmd="fj__subcmd__repo__subcmd__help__subcmd__units__subcmd__actions"
                ;;
            fj__subcmd__repo__subcmd__help__subcmd__units,issues)
                cmd="fj__subcmd__repo__subcmd__help__subcmd__units__subcmd__issues"
                ;;
            fj__subcmd__repo__subcmd__help__subcmd__units,packages)
                cmd="fj__subcmd__repo__subcmd__help__subcmd__units__subcmd__packages"
                ;;
            fj__subcmd__repo__subcmd__help__subcmd__units,projects)
                cmd="fj__subcmd__repo__subcmd__help__subcmd__units__subcmd__projects"
                ;;
            fj__subcmd__repo__subcmd__help__subcmd__units,prs)
                cmd="fj__subcmd__repo__subcmd__help__subcmd__units__subcmd__prs"
                ;;
            fj__subcmd__repo__subcmd__help__subcmd__units,releases)
                cmd="fj__subcmd__repo__subcmd__help__subcmd__units__subcmd__releases"
                ;;
            fj__subcmd__repo__subcmd__help__subcmd__units,wiki)
                cmd="fj__subcmd__repo__subcmd__help__subcmd__units__subcmd__wiki"
                ;;
            fj__subcmd__repo__subcmd__labels,create)
                cmd="fj__subcmd__repo__subcmd__labels__subcmd__create"
                ;;
            fj__subcmd__repo__subcmd__labels,delete)
                cmd="fj__subcmd__repo__subcmd__labels__subcmd__delete"
                ;;
            fj__subcmd__repo__subcmd__labels,edit)
                cmd="fj__subcmd__repo__subcmd__labels__subcmd__edit"
                ;;
            fj__subcmd__repo__subcmd__labels,help)
                cmd="fj__subcmd__repo__subcmd__labels__subcmd__help"
                ;;
            fj__subcmd__repo__subcmd__labels,view)
                cmd="fj__subcmd__repo__subcmd__labels__subcmd__view"
                ;;
            fj__subcmd__repo__subcmd__labels__subcmd__help,create)
                cmd="fj__subcmd__repo__subcmd__labels__subcmd__help__subcmd__create"
                ;;
            fj__subcmd__repo__subcmd__labels__subcmd__help,delete)
                cmd="fj__subcmd__repo__subcmd__labels__subcmd__help__subcmd__delete"
                ;;
            fj__subcmd__repo__subcmd__labels__subcmd__help,edit)
                cmd="fj__subcmd__repo__subcmd__labels__subcmd__help__subcmd__edit"
                ;;
            fj__subcmd__repo__subcmd__labels__subcmd__help,help)
                cmd="fj__subcmd__repo__subcmd__labels__subcmd__help__subcmd__help"
                ;;
            fj__subcmd__repo__subcmd__labels__subcmd__help,view)
                cmd="fj__subcmd__repo__subcmd__labels__subcmd__help__subcmd__view"
                ;;
            fj__subcmd__repo__subcmd__units,actions)
                cmd="fj__subcmd__repo__subcmd__units__subcmd__actions"
                ;;
            fj__subcmd__repo__subcmd__units,help)
                cmd="fj__subcmd__repo__subcmd__units__subcmd__help"
                ;;
            fj__subcmd__repo__subcmd__units,issues)
                cmd="fj__subcmd__repo__subcmd__units__subcmd__issues"
                ;;
            fj__subcmd__repo__subcmd__units,packages)
                cmd="fj__subcmd__repo__subcmd__units__subcmd__packages"
                ;;
            fj__subcmd__repo__subcmd__units,projects)
                cmd="fj__subcmd__repo__subcmd__units__subcmd__projects"
                ;;
            fj__subcmd__repo__subcmd__units,prs)
                cmd="fj__subcmd__repo__subcmd__units__subcmd__prs"
                ;;
            fj__subcmd__repo__subcmd__units,releases)
                cmd="fj__subcmd__repo__subcmd__units__subcmd__releases"
                ;;
            fj__subcmd__repo__subcmd__units,wiki)
                cmd="fj__subcmd__repo__subcmd__units__subcmd__wiki"
                ;;
            fj__subcmd__repo__subcmd__units__subcmd__help,actions)
                cmd="fj__subcmd__repo__subcmd__units__subcmd__help__subcmd__actions"
                ;;
            fj__subcmd__repo__subcmd__units__subcmd__help,help)
                cmd="fj__subcmd__repo__subcmd__units__subcmd__help__subcmd__help"
                ;;
            fj__subcmd__repo__subcmd__units__subcmd__help,issues)
                cmd="fj__subcmd__repo__subcmd__units__subcmd__help__subcmd__issues"
                ;;
            fj__subcmd__repo__subcmd__units__subcmd__help,packages)
                cmd="fj__subcmd__repo__subcmd__units__subcmd__help__subcmd__packages"
                ;;
            fj__subcmd__repo__subcmd__units__subcmd__help,projects)
                cmd="fj__subcmd__repo__subcmd__units__subcmd__help__subcmd__projects"
                ;;
            fj__subcmd__repo__subcmd__units__subcmd__help,prs)
                cmd="fj__subcmd__repo__subcmd__units__subcmd__help__subcmd__prs"
                ;;
            fj__subcmd__repo__subcmd__units__subcmd__help,releases)
                cmd="fj__subcmd__repo__subcmd__units__subcmd__help__subcmd__releases"
                ;;
            fj__subcmd__repo__subcmd__units__subcmd__help,wiki)
                cmd="fj__subcmd__repo__subcmd__units__subcmd__help__subcmd__wiki"
                ;;
            fj__subcmd__tag,create)
                cmd="fj__subcmd__tag__subcmd__create"
                ;;
            fj__subcmd__tag,delete)
                cmd="fj__subcmd__tag__subcmd__delete"
                ;;
            fj__subcmd__tag,help)
                cmd="fj__subcmd__tag__subcmd__help"
                ;;
            fj__subcmd__tag,list)
                cmd="fj__subcmd__tag__subcmd__list"
                ;;
            fj__subcmd__tag,view)
                cmd="fj__subcmd__tag__subcmd__view"
                ;;
            fj__subcmd__tag__subcmd__help,create)
                cmd="fj__subcmd__tag__subcmd__help__subcmd__create"
                ;;
            fj__subcmd__tag__subcmd__help,delete)
                cmd="fj__subcmd__tag__subcmd__help__subcmd__delete"
                ;;
            fj__subcmd__tag__subcmd__help,help)
                cmd="fj__subcmd__tag__subcmd__help__subcmd__help"
                ;;
            fj__subcmd__tag__subcmd__help,list)
                cmd="fj__subcmd__tag__subcmd__help__subcmd__list"
                ;;
            fj__subcmd__tag__subcmd__help,view)
                cmd="fj__subcmd__tag__subcmd__help__subcmd__view"
                ;;
            fj__subcmd__user,activity)
                cmd="fj__subcmd__user__subcmd__activity"
                ;;
            fj__subcmd__user,block)
                cmd="fj__subcmd__user__subcmd__block"
                ;;
            fj__subcmd__user,browse)
                cmd="fj__subcmd__user__subcmd__browse"
                ;;
            fj__subcmd__user,edit)
                cmd="fj__subcmd__user__subcmd__edit"
                ;;
            fj__subcmd__user,follow)
                cmd="fj__subcmd__user__subcmd__follow"
                ;;
            fj__subcmd__user,followers)
                cmd="fj__subcmd__user__subcmd__followers"
                ;;
            fj__subcmd__user,following)
                cmd="fj__subcmd__user__subcmd__following"
                ;;
            fj__subcmd__user,gpg)
                cmd="fj__subcmd__user__subcmd__gpg"
                ;;
            fj__subcmd__user,help)
                cmd="fj__subcmd__user__subcmd__help"
                ;;
            fj__subcmd__user,key)
                cmd="fj__subcmd__user__subcmd__key"
                ;;
            fj__subcmd__user,orgs)
                cmd="fj__subcmd__user__subcmd__orgs"
                ;;
            fj__subcmd__user,repos)
                cmd="fj__subcmd__user__subcmd__repos"
                ;;
            fj__subcmd__user,search)
                cmd="fj__subcmd__user__subcmd__search"
                ;;
            fj__subcmd__user,unblock)
                cmd="fj__subcmd__user__subcmd__unblock"
                ;;
            fj__subcmd__user,unfollow)
                cmd="fj__subcmd__user__subcmd__unfollow"
                ;;
            fj__subcmd__user,view)
                cmd="fj__subcmd__user__subcmd__view"
                ;;
            fj__subcmd__user__subcmd__edit,activity)
                cmd="fj__subcmd__user__subcmd__edit__subcmd__activity"
                ;;
            fj__subcmd__user__subcmd__edit,bio)
                cmd="fj__subcmd__user__subcmd__edit__subcmd__bio"
                ;;
            fj__subcmd__user__subcmd__edit,email)
                cmd="fj__subcmd__user__subcmd__edit__subcmd__email"
                ;;
            fj__subcmd__user__subcmd__edit,help)
                cmd="fj__subcmd__user__subcmd__edit__subcmd__help"
                ;;
            fj__subcmd__user__subcmd__edit,location)
                cmd="fj__subcmd__user__subcmd__edit__subcmd__location"
                ;;
            fj__subcmd__user__subcmd__edit,name)
                cmd="fj__subcmd__user__subcmd__edit__subcmd__name"
                ;;
            fj__subcmd__user__subcmd__edit,pronouns)
                cmd="fj__subcmd__user__subcmd__edit__subcmd__pronouns"
                ;;
            fj__subcmd__user__subcmd__edit,website)
                cmd="fj__subcmd__user__subcmd__edit__subcmd__website"
                ;;
            fj__subcmd__user__subcmd__edit__subcmd__help,activity)
                cmd="fj__subcmd__user__subcmd__edit__subcmd__help__subcmd__activity"
                ;;
            fj__subcmd__user__subcmd__edit__subcmd__help,bio)
                cmd="fj__subcmd__user__subcmd__edit__subcmd__help__subcmd__bio"
                ;;
            fj__subcmd__user__subcmd__edit__subcmd__help,email)
                cmd="fj__subcmd__user__subcmd__edit__subcmd__help__subcmd__email"
                ;;
            fj__subcmd__user__subcmd__edit__subcmd__help,help)
                cmd="fj__subcmd__user__subcmd__edit__subcmd__help__subcmd__help"
                ;;
            fj__subcmd__user__subcmd__edit__subcmd__help,location)
                cmd="fj__subcmd__user__subcmd__edit__subcmd__help__subcmd__location"
                ;;
            fj__subcmd__user__subcmd__edit__subcmd__help,name)
                cmd="fj__subcmd__user__subcmd__edit__subcmd__help__subcmd__name"
                ;;
            fj__subcmd__user__subcmd__edit__subcmd__help,pronouns)
                cmd="fj__subcmd__user__subcmd__edit__subcmd__help__subcmd__pronouns"
                ;;
            fj__subcmd__user__subcmd__edit__subcmd__help,website)
                cmd="fj__subcmd__user__subcmd__edit__subcmd__help__subcmd__website"
                ;;
            fj__subcmd__user__subcmd__gpg,delete)
                cmd="fj__subcmd__user__subcmd__gpg__subcmd__delete"
                ;;
            fj__subcmd__user__subcmd__gpg,help)
                cmd="fj__subcmd__user__subcmd__gpg__subcmd__help"
                ;;
            fj__subcmd__user__subcmd__gpg,list)
                cmd="fj__subcmd__user__subcmd__gpg__subcmd__list"
                ;;
            fj__subcmd__user__subcmd__gpg,upload)
                cmd="fj__subcmd__user__subcmd__gpg__subcmd__upload"
                ;;
            fj__subcmd__user__subcmd__gpg,verify)
                cmd="fj__subcmd__user__subcmd__gpg__subcmd__verify"
                ;;
            fj__subcmd__user__subcmd__gpg,view)
                cmd="fj__subcmd__user__subcmd__gpg__subcmd__view"
                ;;
            fj__subcmd__user__subcmd__gpg__subcmd__help,delete)
                cmd="fj__subcmd__user__subcmd__gpg__subcmd__help__subcmd__delete"
                ;;
            fj__subcmd__user__subcmd__gpg__subcmd__help,help)
                cmd="fj__subcmd__user__subcmd__gpg__subcmd__help__subcmd__help"
                ;;
            fj__subcmd__user__subcmd__gpg__subcmd__help,list)
                cmd="fj__subcmd__user__subcmd__gpg__subcmd__help__subcmd__list"
                ;;
            fj__subcmd__user__subcmd__gpg__subcmd__help,upload)
                cmd="fj__subcmd__user__subcmd__gpg__subcmd__help__subcmd__upload"
                ;;
            fj__subcmd__user__subcmd__gpg__subcmd__help,verify)
                cmd="fj__subcmd__user__subcmd__gpg__subcmd__help__subcmd__verify"
                ;;
            fj__subcmd__user__subcmd__gpg__subcmd__help,view)
                cmd="fj__subcmd__user__subcmd__gpg__subcmd__help__subcmd__view"
                ;;
            fj__subcmd__user__subcmd__help,activity)
                cmd="fj__subcmd__user__subcmd__help__subcmd__activity"
                ;;
            fj__subcmd__user__subcmd__help,block)
                cmd="fj__subcmd__user__subcmd__help__subcmd__block"
                ;;
            fj__subcmd__user__subcmd__help,browse)
                cmd="fj__subcmd__user__subcmd__help__subcmd__browse"
                ;;
            fj__subcmd__user__subcmd__help,edit)
                cmd="fj__subcmd__user__subcmd__help__subcmd__edit"
                ;;
            fj__subcmd__user__subcmd__help,follow)
                cmd="fj__subcmd__user__subcmd__help__subcmd__follow"
                ;;
            fj__subcmd__user__subcmd__help,followers)
                cmd="fj__subcmd__user__subcmd__help__subcmd__followers"
                ;;
            fj__subcmd__user__subcmd__help,following)
                cmd="fj__subcmd__user__subcmd__help__subcmd__following"
                ;;
            fj__subcmd__user__subcmd__help,gpg)
                cmd="fj__subcmd__user__subcmd__help__subcmd__gpg"
                ;;
            fj__subcmd__user__subcmd__help,help)
                cmd="fj__subcmd__user__subcmd__help__subcmd__help"
                ;;
            fj__subcmd__user__subcmd__help,key)
                cmd="fj__subcmd__user__subcmd__help__subcmd__key"
                ;;
            fj__subcmd__user__subcmd__help,orgs)
                cmd="fj__subcmd__user__subcmd__help__subcmd__orgs"
                ;;
            fj__subcmd__user__subcmd__help,repos)
                cmd="fj__subcmd__user__subcmd__help__subcmd__repos"
                ;;
            fj__subcmd__user__subcmd__help,search)
                cmd="fj__subcmd__user__subcmd__help__subcmd__search"
                ;;
            fj__subcmd__user__subcmd__help,unblock)
                cmd="fj__subcmd__user__subcmd__help__subcmd__unblock"
                ;;
            fj__subcmd__user__subcmd__help,unfollow)
                cmd="fj__subcmd__user__subcmd__help__subcmd__unfollow"
                ;;
            fj__subcmd__user__subcmd__help,view)
                cmd="fj__subcmd__user__subcmd__help__subcmd__view"
                ;;
            fj__subcmd__user__subcmd__help__subcmd__edit,activity)
                cmd="fj__subcmd__user__subcmd__help__subcmd__edit__subcmd__activity"
                ;;
            fj__subcmd__user__subcmd__help__subcmd__edit,bio)
                cmd="fj__subcmd__user__subcmd__help__subcmd__edit__subcmd__bio"
                ;;
            fj__subcmd__user__subcmd__help__subcmd__edit,email)
                cmd="fj__subcmd__user__subcmd__help__subcmd__edit__subcmd__email"
                ;;
            fj__subcmd__user__subcmd__help__subcmd__edit,location)
                cmd="fj__subcmd__user__subcmd__help__subcmd__edit__subcmd__location"
                ;;
            fj__subcmd__user__subcmd__help__subcmd__edit,name)
                cmd="fj__subcmd__user__subcmd__help__subcmd__edit__subcmd__name"
                ;;
            fj__subcmd__user__subcmd__help__subcmd__edit,pronouns)
                cmd="fj__subcmd__user__subcmd__help__subcmd__edit__subcmd__pronouns"
                ;;
            fj__subcmd__user__subcmd__help__subcmd__edit,website)
                cmd="fj__subcmd__user__subcmd__help__subcmd__edit__subcmd__website"
                ;;
            fj__subcmd__user__subcmd__help__subcmd__gpg,delete)
                cmd="fj__subcmd__user__subcmd__help__subcmd__gpg__subcmd__delete"
                ;;
            fj__subcmd__user__subcmd__help__subcmd__gpg,list)
                cmd="fj__subcmd__user__subcmd__help__subcmd__gpg__subcmd__list"
                ;;
            fj__subcmd__user__subcmd__help__subcmd__gpg,upload)
                cmd="fj__subcmd__user__subcmd__help__subcmd__gpg__subcmd__upload"
                ;;
            fj__subcmd__user__subcmd__help__subcmd__gpg,verify)
                cmd="fj__subcmd__user__subcmd__help__subcmd__gpg__subcmd__verify"
                ;;
            fj__subcmd__user__subcmd__help__subcmd__gpg,view)
                cmd="fj__subcmd__user__subcmd__help__subcmd__gpg__subcmd__view"
                ;;
            fj__subcmd__user__subcmd__help__subcmd__key,delete)
                cmd="fj__subcmd__user__subcmd__help__subcmd__key__subcmd__delete"
                ;;
            fj__subcmd__user__subcmd__help__subcmd__key,list)
                cmd="fj__subcmd__user__subcmd__help__subcmd__key__subcmd__list"
                ;;
            fj__subcmd__user__subcmd__help__subcmd__key,upload)
                cmd="fj__subcmd__user__subcmd__help__subcmd__key__subcmd__upload"
                ;;
            fj__subcmd__user__subcmd__help__subcmd__key,view)
                cmd="fj__subcmd__user__subcmd__help__subcmd__key__subcmd__view"
                ;;
            fj__subcmd__user__subcmd__key,delete)
                cmd="fj__subcmd__user__subcmd__key__subcmd__delete"
                ;;
            fj__subcmd__user__subcmd__key,help)
                cmd="fj__subcmd__user__subcmd__key__subcmd__help"
                ;;
            fj__subcmd__user__subcmd__key,list)
                cmd="fj__subcmd__user__subcmd__key__subcmd__list"
                ;;
            fj__subcmd__user__subcmd__key,upload)
                cmd="fj__subcmd__user__subcmd__key__subcmd__upload"
                ;;
            fj__subcmd__user__subcmd__key,view)
                cmd="fj__subcmd__user__subcmd__key__subcmd__view"
                ;;
            fj__subcmd__user__subcmd__key__subcmd__help,delete)
                cmd="fj__subcmd__user__subcmd__key__subcmd__help__subcmd__delete"
                ;;
            fj__subcmd__user__subcmd__key__subcmd__help,help)
                cmd="fj__subcmd__user__subcmd__key__subcmd__help__subcmd__help"
                ;;
            fj__subcmd__user__subcmd__key__subcmd__help,list)
                cmd="fj__subcmd__user__subcmd__key__subcmd__help__subcmd__list"
                ;;
            fj__subcmd__user__subcmd__key__subcmd__help,upload)
                cmd="fj__subcmd__user__subcmd__key__subcmd__help__subcmd__upload"
                ;;
            fj__subcmd__user__subcmd__key__subcmd__help,view)
                cmd="fj__subcmd__user__subcmd__key__subcmd__help__subcmd__view"
                ;;
            fj__subcmd__wiki,browse)
                cmd="fj__subcmd__wiki__subcmd__browse"
                ;;
            fj__subcmd__wiki,clone)
                cmd="fj__subcmd__wiki__subcmd__clone"
                ;;
            fj__subcmd__wiki,contents)
                cmd="fj__subcmd__wiki__subcmd__contents"
                ;;
            fj__subcmd__wiki,help)
                cmd="fj__subcmd__wiki__subcmd__help"
                ;;
            fj__subcmd__wiki,view)
                cmd="fj__subcmd__wiki__subcmd__view"
                ;;
            fj__subcmd__wiki__subcmd__help,browse)
                cmd="fj__subcmd__wiki__subcmd__help__subcmd__browse"
                ;;
            fj__subcmd__wiki__subcmd__help,clone)
                cmd="fj__subcmd__wiki__subcmd__help__subcmd__clone"
                ;;
            fj__subcmd__wiki__subcmd__help,contents)
                cmd="fj__subcmd__wiki__subcmd__help__subcmd__contents"
                ;;
            fj__subcmd__wiki__subcmd__help,help)
                cmd="fj__subcmd__wiki__subcmd__help__subcmd__help"
                ;;
            fj__subcmd__wiki__subcmd__help,view)
                cmd="fj__subcmd__wiki__subcmd__help__subcmd__view"
                ;;
            *)
                ;;
        esac
    done

    case "${cmd}" in
        fj)
            opts="-H -h --host --style --help repo issue pr wiki actions whoami auth release tag user org version completion help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --host)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -H)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --style)
                    COMPREPLY=($(compgen -W "fancy minimal" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__actions)
            opts="-R -r -h --remote --repo --help tasks variables secrets dispatch help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --repo)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__actions__subcmd__dispatch)
            opts="-I -R -r -h --inputs --remote --repo --help <NAME> <REF>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --inputs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -I)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --repo)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__actions__subcmd__help)
            opts="tasks variables secrets dispatch help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__actions__subcmd__help__subcmd__dispatch)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__actions__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__actions__subcmd__help__subcmd__secrets)
            opts="list create delete"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__actions__subcmd__help__subcmd__secrets__subcmd__create)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__actions__subcmd__help__subcmd__secrets__subcmd__delete)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__actions__subcmd__help__subcmd__secrets__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__actions__subcmd__help__subcmd__tasks)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__actions__subcmd__help__subcmd__variables)
            opts="list create delete"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__actions__subcmd__help__subcmd__variables__subcmd__create)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__actions__subcmd__help__subcmd__variables__subcmd__delete)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__actions__subcmd__help__subcmd__variables__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__actions__subcmd__secrets)
            opts="-R -r -h --remote --repo --help list create delete help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --repo)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__actions__subcmd__secrets__subcmd__create)
            opts="-R -r -h --remote --repo --help <NAME> <DATA>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --repo)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__actions__subcmd__secrets__subcmd__delete)
            opts="-R -r -h --remote --repo --help <NAME>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --repo)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__actions__subcmd__secrets__subcmd__help)
            opts="list create delete help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__actions__subcmd__secrets__subcmd__help__subcmd__create)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__actions__subcmd__secrets__subcmd__help__subcmd__delete)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__actions__subcmd__secrets__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__actions__subcmd__secrets__subcmd__help__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__actions__subcmd__secrets__subcmd__list)
            opts="-R -r -h --remote --repo --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --repo)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__actions__subcmd__tasks)
            opts="-p -R -r -h --page --remote --repo --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --page)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -p)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --repo)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__actions__subcmd__variables)
            opts="-R -r -h --remote --repo --help list create delete help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --repo)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__actions__subcmd__variables__subcmd__create)
            opts="-f -R -r -h --force --remote --repo --help <NAME> [DATA]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --repo)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__actions__subcmd__variables__subcmd__delete)
            opts="-R -r -h --remote --repo --help <NAME>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --repo)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__actions__subcmd__variables__subcmd__help)
            opts="list create delete help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__actions__subcmd__variables__subcmd__help__subcmd__create)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__actions__subcmd__variables__subcmd__help__subcmd__delete)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__actions__subcmd__variables__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__actions__subcmd__variables__subcmd__help__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__actions__subcmd__variables__subcmd__list)
            opts="-v -R -r -h --verbose --remote --repo --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --repo)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__auth)
            opts="-h --help login logout add-key use-ssh list help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__auth__subcmd__add__subcmd__key)
            opts="-h --help <USER> [KEY]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__auth__subcmd__help)
            opts="login logout add-key use-ssh list help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__auth__subcmd__help__subcmd__add__subcmd__key)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__auth__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__auth__subcmd__help__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__auth__subcmd__help__subcmd__login)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__auth__subcmd__help__subcmd__logout)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__auth__subcmd__help__subcmd__use__subcmd__ssh)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__auth__subcmd__list)
            opts="-h --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__auth__subcmd__login)
            opts="-h --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__auth__subcmd__logout)
            opts="-h --help <HOST>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__auth__subcmd__use__subcmd__ssh)
            opts="-h --help true false"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__completion)
            opts="-h --bin-name --help bash elvish fish power-shell zsh nushell"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --bin-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help)
            opts="repo issue pr wiki actions whoami auth release tag user org version completion help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__actions)
            opts="tasks variables secrets dispatch"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__actions__subcmd__dispatch)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__actions__subcmd__secrets)
            opts="list create delete"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__actions__subcmd__secrets__subcmd__create)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__actions__subcmd__secrets__subcmd__delete)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__actions__subcmd__secrets__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__actions__subcmd__tasks)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__actions__subcmd__variables)
            opts="list create delete"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__actions__subcmd__variables__subcmd__create)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__actions__subcmd__variables__subcmd__delete)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__actions__subcmd__variables__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__auth)
            opts="login logout add-key use-ssh list"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__auth__subcmd__add__subcmd__key)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__auth__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__auth__subcmd__login)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__auth__subcmd__logout)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__auth__subcmd__use__subcmd__ssh)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__completion)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__issue)
            opts="create edit comment assign unassign close search view templates browse"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__issue__subcmd__assign)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__issue__subcmd__browse)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__issue__subcmd__close)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__issue__subcmd__comment)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__issue__subcmd__create)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__issue__subcmd__edit)
            opts="title body comment labels"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__issue__subcmd__edit__subcmd__body)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__issue__subcmd__edit__subcmd__comment)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__issue__subcmd__edit__subcmd__labels)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__issue__subcmd__edit__subcmd__title)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__issue__subcmd__search)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__issue__subcmd__templates)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__issue__subcmd__unassign)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__issue__subcmd__view)
            opts="body comment comments"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__issue__subcmd__view__subcmd__body)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__issue__subcmd__view__subcmd__comment)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__issue__subcmd__view__subcmd__comments)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__org)
            opts="list view create edit activity members visibility team label repo"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__org__subcmd__activity)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__org__subcmd__create)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__org__subcmd__edit)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__org__subcmd__label)
            opts="list add edit rm"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__org__subcmd__label__subcmd__add)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__org__subcmd__label__subcmd__edit)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__org__subcmd__label__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__org__subcmd__label__subcmd__rm)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__org__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__org__subcmd__members)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__org__subcmd__repo)
            opts="list create"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__org__subcmd__repo__subcmd__create)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__org__subcmd__repo__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__org__subcmd__team)
            opts="list view create edit delete repo member"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__org__subcmd__team__subcmd__create)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__org__subcmd__team__subcmd__delete)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__org__subcmd__team__subcmd__edit)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__org__subcmd__team__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__org__subcmd__team__subcmd__member)
            opts="list add rm"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__org__subcmd__team__subcmd__member__subcmd__add)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 6 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__org__subcmd__team__subcmd__member__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 6 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__org__subcmd__team__subcmd__member__subcmd__rm)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 6 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__org__subcmd__team__subcmd__repo)
            opts="list add rm"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__org__subcmd__team__subcmd__repo__subcmd__add)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 6 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__org__subcmd__team__subcmd__repo__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 6 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__org__subcmd__team__subcmd__repo__subcmd__rm)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 6 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__org__subcmd__team__subcmd__view)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__org__subcmd__view)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__org__subcmd__visibility)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__pr)
            opts="search create view status checkout comment assign unassign edit close merge browse"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__pr__subcmd__assign)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__pr__subcmd__browse)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__pr__subcmd__checkout)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__pr__subcmd__close)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__pr__subcmd__comment)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__pr__subcmd__create)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__pr__subcmd__edit)
            opts="title body comment labels"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__pr__subcmd__edit__subcmd__body)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__pr__subcmd__edit__subcmd__comment)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__pr__subcmd__edit__subcmd__labels)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__pr__subcmd__edit__subcmd__title)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__pr__subcmd__merge)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__pr__subcmd__search)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__pr__subcmd__status)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__pr__subcmd__unassign)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__pr__subcmd__view)
            opts="body comment comments labels diff files commits"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__pr__subcmd__view__subcmd__body)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__pr__subcmd__view__subcmd__comment)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__pr__subcmd__view__subcmd__comments)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__pr__subcmd__view__subcmd__commits)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__pr__subcmd__view__subcmd__diff)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__pr__subcmd__view__subcmd__files)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__pr__subcmd__view__subcmd__labels)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__release)
            opts="create edit delete list view browse asset"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__release__subcmd__asset)
            opts="create delete download"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__release__subcmd__asset__subcmd__create)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__release__subcmd__asset__subcmd__delete)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__release__subcmd__asset__subcmd__download)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__release__subcmd__browse)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__release__subcmd__create)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__release__subcmd__delete)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__release__subcmd__edit)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__release__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__release__subcmd__view)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__repo)
            opts="create fork migrate view readme clone star unstar delete browse labels edit units"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__repo__subcmd__browse)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__repo__subcmd__clone)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__repo__subcmd__create)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__repo__subcmd__delete)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__repo__subcmd__edit)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__repo__subcmd__fork)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__repo__subcmd__labels)
            opts="view create delete edit"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__repo__subcmd__labels__subcmd__create)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__repo__subcmd__labels__subcmd__delete)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__repo__subcmd__labels__subcmd__edit)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__repo__subcmd__labels__subcmd__view)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__repo__subcmd__migrate)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__repo__subcmd__readme)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__repo__subcmd__star)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__repo__subcmd__units)
            opts="issues prs actions wiki packages projects releases"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__repo__subcmd__units__subcmd__actions)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__repo__subcmd__units__subcmd__issues)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__repo__subcmd__units__subcmd__packages)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__repo__subcmd__units__subcmd__projects)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__repo__subcmd__units__subcmd__prs)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__repo__subcmd__units__subcmd__releases)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__repo__subcmd__units__subcmd__wiki)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__repo__subcmd__unstar)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__repo__subcmd__view)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__tag)
            opts="create delete list view"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__tag__subcmd__create)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__tag__subcmd__delete)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__tag__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__tag__subcmd__view)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__user)
            opts="search view browse follow unfollow following followers block unblock repos orgs activity edit key gpg"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__user__subcmd__activity)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__user__subcmd__block)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__user__subcmd__browse)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__user__subcmd__edit)
            opts="bio name pronouns location activity email website"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__user__subcmd__edit__subcmd__activity)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__user__subcmd__edit__subcmd__bio)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__user__subcmd__edit__subcmd__email)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__user__subcmd__edit__subcmd__location)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__user__subcmd__edit__subcmd__name)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__user__subcmd__edit__subcmd__pronouns)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__user__subcmd__edit__subcmd__website)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__user__subcmd__follow)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__user__subcmd__followers)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__user__subcmd__following)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__user__subcmd__gpg)
            opts="list view delete upload verify"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__user__subcmd__gpg__subcmd__delete)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__user__subcmd__gpg__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__user__subcmd__gpg__subcmd__upload)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__user__subcmd__gpg__subcmd__verify)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__user__subcmd__gpg__subcmd__view)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__user__subcmd__key)
            opts="list view delete upload"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__user__subcmd__key__subcmd__delete)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__user__subcmd__key__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__user__subcmd__key__subcmd__upload)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__user__subcmd__key__subcmd__view)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__user__subcmd__orgs)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__user__subcmd__repos)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__user__subcmd__search)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__user__subcmd__unblock)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__user__subcmd__unfollow)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__user__subcmd__view)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__version)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__whoami)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__wiki)
            opts="contents view clone browse"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__wiki__subcmd__browse)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__wiki__subcmd__clone)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__wiki__subcmd__contents)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__help__subcmd__wiki__subcmd__view)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue)
            opts="-R -h --remote --help create edit comment assign unassign close search view templates browse help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__assign)
            opts="-R -h --remote --help <ISSUE> [USERS]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__browse)
            opts="-R -h --remote --help <ID>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__close)
            opts="-w -R -h --with-msg --remote --help <ISSUE>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --with-msg)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -w)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__comment)
            opts="-R -h --body-file --remote --help <ISSUE> [BODY]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --body-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__create)
            opts="-r -R -h --body --body-file --template --no-template --repo --web --remote --help [TITLE]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --body)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --body-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --template)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --repo)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__edit)
            opts="-R -h --remote --help <ISSUE> title body comment labels help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__edit__subcmd__body)
            opts="-R -h --remote --help [NEW_BODY]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__edit__subcmd__comment)
            opts="-R -h --remote --help <IDX> [NEW_BODY]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__edit__subcmd__help)
            opts="title body comment labels help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__edit__subcmd__help__subcmd__body)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__edit__subcmd__help__subcmd__comment)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__edit__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__edit__subcmd__help__subcmd__labels)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__edit__subcmd__help__subcmd__title)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__edit__subcmd__labels)
            opts="-a -r -R -h --add --rm --remote --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --add)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -a)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --rm)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__edit__subcmd__title)
            opts="-R -h --remote --help [NEW_TITLE]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__help)
            opts="create edit comment assign unassign close search view templates browse help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__help__subcmd__assign)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__help__subcmd__browse)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__help__subcmd__close)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__help__subcmd__comment)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__help__subcmd__create)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__help__subcmd__edit)
            opts="title body comment labels"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__help__subcmd__edit__subcmd__body)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__help__subcmd__edit__subcmd__comment)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__help__subcmd__edit__subcmd__labels)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__help__subcmd__edit__subcmd__title)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__help__subcmd__search)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__help__subcmd__templates)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__help__subcmd__unassign)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__help__subcmd__view)
            opts="body comment comments"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__help__subcmd__view__subcmd__body)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__help__subcmd__view__subcmd__comment)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__help__subcmd__view__subcmd__comments)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__search)
            opts="-r -l -c -a -s -R -h --repo --labels --creator --assignee --state --remote --help [QUERY]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --repo)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --labels)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -l)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --creator)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --assignee)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -a)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --state)
                    COMPREPLY=($(compgen -W "open closed all" -- "${cur}"))
                    return 0
                    ;;
                -s)
                    COMPREPLY=($(compgen -W "open closed all" -- "${cur}"))
                    return 0
                    ;;
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__templates)
            opts="-r -R -h --repo --remote --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --repo)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__unassign)
            opts="-R -h --remote --help <ISSUE> [USERS]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__view)
            opts="-R -h --remote --help <ID> body comment comments help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__view__subcmd__body)
            opts="-R -h --remote --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__view__subcmd__comment)
            opts="-R -h --remote --help <IDX>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__view__subcmd__comments)
            opts="-R -h --remote --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__view__subcmd__help)
            opts="body comment comments help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__view__subcmd__help__subcmd__body)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__view__subcmd__help__subcmd__comment)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__view__subcmd__help__subcmd__comments)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__issue__subcmd__view__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org)
            opts="-R -h --remote --help list view create edit activity members visibility team label repo help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__activity)
            opts="-h --help <NAME>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__create)
            opts="-f -d -e -l -w -v -a -h --full-name --description --email --location --website --visibility --admin-can-change-team-access --help <NAME>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --full-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -f)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --description)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -d)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --email)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -e)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --location)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -l)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --website)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -w)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --visibility)
                    COMPREPLY=($(compgen -W "private limited public" -- "${cur}"))
                    return 0
                    ;;
                -v)
                    COMPREPLY=($(compgen -W "private limited public" -- "${cur}"))
                    return 0
                    ;;
                --admin-can-change-team-access)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                -a)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__edit)
            opts="-f -d -e -l -w -v -a -h --full-name --description --email --location --website --visibility --admin-can-change-team-access --help <NAME>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --full-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -f)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --description)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -d)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --email)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -e)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --location)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -l)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --website)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -w)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --visibility)
                    COMPREPLY=($(compgen -W "private limited public" -- "${cur}"))
                    return 0
                    ;;
                -v)
                    COMPREPLY=($(compgen -W "private limited public" -- "${cur}"))
                    return 0
                    ;;
                --admin-can-change-team-access)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                -a)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__help)
            opts="list view create edit activity members visibility team label repo help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__help__subcmd__activity)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__help__subcmd__create)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__help__subcmd__edit)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__help__subcmd__label)
            opts="list add edit rm"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__help__subcmd__label__subcmd__add)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__help__subcmd__label__subcmd__edit)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__help__subcmd__label__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__help__subcmd__label__subcmd__rm)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__help__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__help__subcmd__members)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__help__subcmd__repo)
            opts="list create"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__help__subcmd__repo__subcmd__create)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__help__subcmd__repo__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__help__subcmd__team)
            opts="list view create edit delete repo member"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__help__subcmd__team__subcmd__create)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__help__subcmd__team__subcmd__delete)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__help__subcmd__team__subcmd__edit)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__help__subcmd__team__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__help__subcmd__team__subcmd__member)
            opts="list add rm"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__help__subcmd__team__subcmd__member__subcmd__add)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 6 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__help__subcmd__team__subcmd__member__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 6 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__help__subcmd__team__subcmd__member__subcmd__rm)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 6 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__help__subcmd__team__subcmd__repo)
            opts="list add rm"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__help__subcmd__team__subcmd__repo__subcmd__add)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 6 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__help__subcmd__team__subcmd__repo__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 6 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__help__subcmd__team__subcmd__repo__subcmd__rm)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 6 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__help__subcmd__team__subcmd__view)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__help__subcmd__view)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__help__subcmd__visibility)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__label)
            opts="-h --help list add edit rm help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__label__subcmd__add)
            opts="-d -e -h --description --exclusive --help <ORG> <NAME> <COLOR>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --description)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -d)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__label__subcmd__edit)
            opts="-n -c -d -e -a -h --new-name --color --description --exclusive --archived --help <ORG> <NAME>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --new-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -n)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --color)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --description)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -d)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --archived)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                -a)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__label__subcmd__help)
            opts="list add edit rm help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__label__subcmd__help__subcmd__add)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__label__subcmd__help__subcmd__edit)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__label__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__label__subcmd__help__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__label__subcmd__help__subcmd__rm)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__label__subcmd__list)
            opts="-h --help <ORG>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__label__subcmd__rm)
            opts="-h --help <ORG> <LABEL>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__list)
            opts="-p -o -h --page --only-member-of --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --page)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -p)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__members)
            opts="-p -h --page --help <ORG>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --page)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -p)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__repo)
            opts="-h --help list create help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__repo__subcmd__create)
            opts="-d -P -r -p -S -h --description --private --remote --push --ssh --help <ORG> <REPO>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --description)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -d)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ssh)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                -S)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__repo__subcmd__help)
            opts="list create help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__repo__subcmd__help__subcmd__create)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__repo__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__repo__subcmd__help__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__repo__subcmd__list)
            opts="-p -h --page --help <ORG>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --page)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -p)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team)
            opts="-h --help list view create edit delete repo member help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__create)
            opts="-c -i -A -d -r -w -h --can-create-repos --include-all-repos --admin --description --read-permissions --write-permissions --help <ORG> <NAME>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --description)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -d)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --read-permissions)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --write-permissions)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -w)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__delete)
            opts="-h --help <ORG> <NAME>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__edit)
            opts="-n -c -i -A -d -r -w -h --new-name --can-create-repos --include-all-repos --admin --description --read-permissions --write-permissions --help <ORG> <NAME>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --new-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -n)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --can-create-repos)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                --include-all-repos)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                -i)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                --admin)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                -A)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                --description)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -d)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --read-permissions)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --write-permissions)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -w)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__help)
            opts="list view create edit delete repo member help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__help__subcmd__create)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__help__subcmd__delete)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__help__subcmd__edit)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__help__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__help__subcmd__member)
            opts="list add rm"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__help__subcmd__member__subcmd__add)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 6 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__help__subcmd__member__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 6 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__help__subcmd__member__subcmd__rm)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 6 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__help__subcmd__repo)
            opts="list add rm"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__help__subcmd__repo__subcmd__add)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 6 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__help__subcmd__repo__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 6 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__help__subcmd__repo__subcmd__rm)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 6 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__help__subcmd__view)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__list)
            opts="-h --help <ORG>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__member)
            opts="-h --help list add rm help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__member__subcmd__add)
            opts="-h --help <ORG> <TEAM> <USER>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__member__subcmd__help)
            opts="list add rm help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__member__subcmd__help__subcmd__add)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 6 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__member__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 6 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__member__subcmd__help__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 6 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__member__subcmd__help__subcmd__rm)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 6 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__member__subcmd__list)
            opts="-p -h --page --help <ORG> <TEAM>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --page)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -p)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__member__subcmd__rm)
            opts="-h --help <ORG> <TEAM> <USER>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__repo)
            opts="-h --help list add rm help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__repo__subcmd__add)
            opts="-h --help <ORG> <TEAM> <REPO>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__repo__subcmd__help)
            opts="list add rm help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__repo__subcmd__help__subcmd__add)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 6 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__repo__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 6 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__repo__subcmd__help__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 6 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__repo__subcmd__help__subcmd__rm)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 6 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__repo__subcmd__list)
            opts="-p -h --page --help <ORG> <TEAM>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --page)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -p)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__repo__subcmd__rm)
            opts="-h --help <ORG> <TEAM> <REPO>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__team__subcmd__view)
            opts="-p -h --list-permissions --help <ORG> <NAME>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__view)
            opts="-h --help <NAME>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__org__subcmd__visibility)
            opts="-s -h --set --help <ORG>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --set)
                    COMPREPLY=($(compgen -W "private public" -- "${cur}"))
                    return 0
                    ;;
                -s)
                    COMPREPLY=($(compgen -W "private public" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr)
            opts="-R -h --remote --help search create view status checkout comment assign unassign edit close merge browse help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__assign)
            opts="-p -h --pr --help [USERS]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --pr)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -p)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__browse)
            opts="-h --help [ID]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__checkout)
            opts="-S -I -h --branch-name --ssh --identity-file --help <ID>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --branch-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ssh)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                -S)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                --identity-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -I)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__close)
            opts="-w -h --with-msg --help [PR]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --with-msg)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -w)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__comment)
            opts="-h --body-file --help [PR] [BODY]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --body-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__create)
            opts="-A -r -w -a -h --base --head --body --body-file --autofill --repo --web --agit --help [TITLE]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --base)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --head)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --body)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --body-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --repo)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__edit)
            opts="-h --help [PR] title body comment labels help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__edit__subcmd__body)
            opts="-h --help [NEW_BODY]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__edit__subcmd__comment)
            opts="-h --help <IDX> [NEW_BODY]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__edit__subcmd__help)
            opts="title body comment labels help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__edit__subcmd__help__subcmd__body)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__edit__subcmd__help__subcmd__comment)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__edit__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__edit__subcmd__help__subcmd__labels)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__edit__subcmd__help__subcmd__title)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__edit__subcmd__labels)
            opts="-a -r -h --add --rm --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --add)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -a)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --rm)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__edit__subcmd__title)
            opts="-h --help [NEW_TITLE]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__help)
            opts="search create view status checkout comment assign unassign edit close merge browse help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__help__subcmd__assign)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__help__subcmd__browse)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__help__subcmd__checkout)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__help__subcmd__close)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__help__subcmd__comment)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__help__subcmd__create)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__help__subcmd__edit)
            opts="title body comment labels"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__help__subcmd__edit__subcmd__body)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__help__subcmd__edit__subcmd__comment)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__help__subcmd__edit__subcmd__labels)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__help__subcmd__edit__subcmd__title)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__help__subcmd__merge)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__help__subcmd__search)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__help__subcmd__status)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__help__subcmd__unassign)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__help__subcmd__view)
            opts="body comment comments labels diff files commits"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__help__subcmd__view__subcmd__body)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__help__subcmd__view__subcmd__comment)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__help__subcmd__view__subcmd__comments)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__help__subcmd__view__subcmd__commits)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__help__subcmd__view__subcmd__diff)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__help__subcmd__view__subcmd__files)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__help__subcmd__view__subcmd__labels)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__merge)
            opts="-M -d -t -m -h --method --delete --title --message --help [PR]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --method)
                    COMPREPLY=($(compgen -W "merge rebase rebase-merge squash manual" -- "${cur}"))
                    return 0
                    ;;
                -M)
                    COMPREPLY=($(compgen -W "merge rebase rebase-merge squash manual" -- "${cur}"))
                    return 0
                    ;;
                --title)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --message)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -m)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__search)
            opts="-l -c -a -s -r -h --labels --creator --assignee --state --repo --help [QUERY]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --labels)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -l)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --creator)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --assignee)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -a)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --state)
                    COMPREPLY=($(compgen -W "open closed all" -- "${cur}"))
                    return 0
                    ;;
                -s)
                    COMPREPLY=($(compgen -W "open closed all" -- "${cur}"))
                    return 0
                    ;;
                --repo)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__status)
            opts="-h --wait --help [ID]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__unassign)
            opts="-p -h --pr --help [USERS]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --pr)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -p)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__view)
            opts="-h --help [ID] body comment comments labels diff files commits help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__view__subcmd__body)
            opts="-h --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__view__subcmd__comment)
            opts="-h --help <IDX>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__view__subcmd__comments)
            opts="-h --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__view__subcmd__commits)
            opts="-o -h --oneline --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__view__subcmd__diff)
            opts="-p -e -h --patch --editor --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__view__subcmd__files)
            opts="-h --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__view__subcmd__help)
            opts="body comment comments labels diff files commits help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__view__subcmd__help__subcmd__body)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__view__subcmd__help__subcmd__comment)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__view__subcmd__help__subcmd__comments)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__view__subcmd__help__subcmd__commits)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__view__subcmd__help__subcmd__diff)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__view__subcmd__help__subcmd__files)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__view__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__view__subcmd__help__subcmd__labels)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__pr__subcmd__view__subcmd__labels)
            opts="-h --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__release)
            opts="-R -r -h --remote --repo --help create edit delete list view browse asset help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --repo)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__release__subcmd__asset)
            opts="-R -r -h --remote --repo --help create delete download help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --repo)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__release__subcmd__asset__subcmd__create)
            opts="-R -r -h --remote --repo --help <RELEASE> <PATH> [NAME]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --repo)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__release__subcmd__asset__subcmd__delete)
            opts="-R -r -h --remote --repo --help <RELEASE> <ASSET>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --repo)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__release__subcmd__asset__subcmd__download)
            opts="-o -R -r -h --output --remote --repo --help <RELEASE> <ASSET>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --repo)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__release__subcmd__asset__subcmd__help)
            opts="create delete download help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__release__subcmd__asset__subcmd__help__subcmd__create)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__release__subcmd__asset__subcmd__help__subcmd__delete)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__release__subcmd__asset__subcmd__help__subcmd__download)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__release__subcmd__asset__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__release__subcmd__browse)
            opts="-R -r -h --remote --repo --help [NAME]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --repo)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__release__subcmd__create)
            opts="-T -t -a -b -B -d -p -R -r -h --create-tag --tag --attach --body --branch --draft --prerelease --remote --repo --help <NAME>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --create-tag)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -T)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --tag)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --attach)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -a)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --body)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -b)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --branch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -B)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --repo)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__release__subcmd__delete)
            opts="-t -R -r -h --by-tag --remote --repo --help <NAME>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --repo)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__release__subcmd__edit)
            opts="-n -t -b -d -p -R -r -h --rename --tag --body --draft --prerelease --remote --repo --help <NAME>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --rename)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -n)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --tag)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --body)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -b)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --draft)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                -d)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                --prerelease)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                -p)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --repo)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__release__subcmd__help)
            opts="create edit delete list view browse asset help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__release__subcmd__help__subcmd__asset)
            opts="create delete download"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__release__subcmd__help__subcmd__asset__subcmd__create)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__release__subcmd__help__subcmd__asset__subcmd__delete)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__release__subcmd__help__subcmd__asset__subcmd__download)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__release__subcmd__help__subcmd__browse)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__release__subcmd__help__subcmd__create)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__release__subcmd__help__subcmd__delete)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__release__subcmd__help__subcmd__edit)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__release__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__release__subcmd__help__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__release__subcmd__help__subcmd__view)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__release__subcmd__list)
            opts="-p -d -R -r -h --include-prerelease --include-draft --remote --repo --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --repo)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__release__subcmd__view)
            opts="-t -R -r -h --by-tag --remote --repo --help <NAME>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --repo)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo)
            opts="-h --help create fork migrate view readme clone star unstar delete browse labels edit units help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__browse)
            opts="-R -h --remote --help [NAME]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__clone)
            opts="-S -I -h --ssh --identity-file --help <REPO> [PATH]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --ssh)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                -S)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                --identity-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -I)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__create)
            opts="-d -P -r -p -S -h --description --private --remote --push --ssh --help <REPO>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --description)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -d)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ssh)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                -S)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__delete)
            opts="-h --help <REPO>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__edit)
            opts="-a -d -p -t -w -h --archived --default-branch --description --enable-prune --mirror-interval --name --private --template --website --help [REPO]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --archived)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                -a)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                --default-branch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --description)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -d)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --enable-prune)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                --mirror-interval)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --private)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                -p)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                --template)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                --website)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -w)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__fork)
            opts="-R -h --name --remote --help <REPO>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__help)
            opts="create fork migrate view readme clone star unstar delete browse labels edit units help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__help__subcmd__browse)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__help__subcmd__clone)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__help__subcmd__create)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__help__subcmd__delete)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__help__subcmd__edit)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__help__subcmd__fork)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__help__subcmd__labels)
            opts="view create delete edit"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__help__subcmd__labels__subcmd__create)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__help__subcmd__labels__subcmd__delete)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__help__subcmd__labels__subcmd__edit)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__help__subcmd__labels__subcmd__view)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__help__subcmd__migrate)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__help__subcmd__readme)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__help__subcmd__star)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__help__subcmd__units)
            opts="issues prs actions wiki packages projects releases"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__help__subcmd__units__subcmd__actions)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__help__subcmd__units__subcmd__issues)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__help__subcmd__units__subcmd__packages)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__help__subcmd__units__subcmd__projects)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__help__subcmd__units__subcmd__prs)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__help__subcmd__units__subcmd__releases)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__help__subcmd__units__subcmd__wiki)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__help__subcmd__unstar)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__help__subcmd__view)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__labels)
            opts="-h --help [REPO] view create delete edit help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__labels__subcmd__create)
            opts="-d -e -a -h --description --exclusive --archived --help <NAME> <COLOR>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --description)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -d)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__labels__subcmd__delete)
            opts="-h --help <ID>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__labels__subcmd__edit)
            opts="-n -c -d -e -a -h --name --color --description --exclusive --archived --help <ID>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -n)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --color)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --description)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -d)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --exclusive)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                -e)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                --archived)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                -a)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__labels__subcmd__help)
            opts="view create delete edit help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__labels__subcmd__help__subcmd__create)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__labels__subcmd__help__subcmd__delete)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__labels__subcmd__help__subcmd__edit)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__labels__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__labels__subcmd__help__subcmd__view)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__labels__subcmd__view)
            opts="-a -h --archived --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__migrate)
            opts="-m -p -i -L -s -t -l -h --mirror --private --include --lfs-endpoint --service --token --login --help <REPO> <[OWNER]/NAME>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --include)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -i)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --lfs-endpoint)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -L)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --service)
                    COMPREPLY=($(compgen -W "git github gitlab forgejo gitea gogs onedev gitbucket codebase" -- "${cur}"))
                    return 0
                    ;;
                -s)
                    COMPREPLY=($(compgen -W "git github gitlab forgejo gitea gogs onedev gitbucket codebase" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__readme)
            opts="-R -h --remote --help [NAME]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__star)
            opts="-R -h --remote --help [REPO]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__units)
            opts="-h --help [REPO] issues prs actions wiki packages projects releases help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__units__subcmd__actions)
            opts="-e -h --enable --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --enable)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                -e)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__units__subcmd__help)
            opts="issues prs actions wiki packages projects releases help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__units__subcmd__help__subcmd__actions)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__units__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__units__subcmd__help__subcmd__issues)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__units__subcmd__help__subcmd__packages)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__units__subcmd__help__subcmd__projects)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__units__subcmd__help__subcmd__prs)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__units__subcmd__help__subcmd__releases)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__units__subcmd__help__subcmd__wiki)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__units__subcmd__issues)
            opts="-e -h --enable --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --enable)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                -e)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__units__subcmd__packages)
            opts="-e -h --enable --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --enable)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                -e)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__units__subcmd__projects)
            opts="-e -h --enable --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --enable)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                -e)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__units__subcmd__prs)
            opts="-e -h --enable --allow-fast-forward-only-merge --allow-manual-merge --allow-merge-commits --allow-rebase --allow-rebase-explicit --allow-rebase-update --allow-squash-merge --autodetect-manual-merge --default-allow-maintainer-edit --default-delete-branch-after-merge --default-merge-style --default-update-style --ignore-whitespace-conflicts --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --enable)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                -e)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                --allow-fast-forward-only-merge)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                --allow-manual-merge)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                --allow-merge-commits)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                --allow-rebase)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                --allow-rebase-explicit)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                --allow-rebase-update)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                --allow-squash-merge)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                --autodetect-manual-merge)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                --default-allow-maintainer-edit)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                --default-delete-branch-after-merge)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                --default-merge-style)
                    COMPREPLY=($(compgen -W "merge rebase rebase-merge squash fast-forward-only" -- "${cur}"))
                    return 0
                    ;;
                --default-update-style)
                    COMPREPLY=($(compgen -W "rebase merge" -- "${cur}"))
                    return 0
                    ;;
                --ignore-whitespace-conflicts)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__units__subcmd__releases)
            opts="-e -h --enable --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --enable)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                -e)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__units__subcmd__wiki)
            opts="-e -h --enable --branch --external-url --globally-editable --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --enable)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                -e)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                --branch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --external-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --globally-editable)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__unstar)
            opts="-R -h --remote --help [REPO]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__repo__subcmd__view)
            opts="-R -h --remote --help [NAME]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__tag)
            opts="-R -r -h --remote --repo --help create delete list view help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --repo)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__tag__subcmd__create)
            opts="-b -B -R -r -h --body --branch --remote --repo --help <NAME>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --body)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -b)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --branch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -B)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --repo)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__tag__subcmd__delete)
            opts="-R -r -h --remote --repo --help <NAME>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --repo)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__tag__subcmd__help)
            opts="create delete list view help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__tag__subcmd__help__subcmd__create)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__tag__subcmd__help__subcmd__delete)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__tag__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__tag__subcmd__help__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__tag__subcmd__help__subcmd__view)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__tag__subcmd__list)
            opts="-p -R -r -h --page --remote --repo --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --page)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -p)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --repo)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__tag__subcmd__view)
            opts="-R -r -h --remote --repo --help <NAME>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --repo)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user)
            opts="-R -h --remote --help search view browse follow unfollow following followers block unblock repos orgs activity edit key gpg help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__activity)
            opts="-h --help [USER]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__block)
            opts="-h --help <USER>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__browse)
            opts="-h --help [USER]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__edit)
            opts="-h --help bio name pronouns location activity email website help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__edit__subcmd__activity)
            opts="-v -h --visibility --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --visibility)
                    COMPREPLY=($(compgen -W "hidden public" -- "${cur}"))
                    return 0
                    ;;
                -v)
                    COMPREPLY=($(compgen -W "hidden public" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__edit__subcmd__bio)
            opts="-h --help [CONTENT]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__edit__subcmd__email)
            opts="-v -a -r -h --visibility --add --rm --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --visibility)
                    COMPREPLY=($(compgen -W "hidden public" -- "${cur}"))
                    return 0
                    ;;
                -v)
                    COMPREPLY=($(compgen -W "hidden public" -- "${cur}"))
                    return 0
                    ;;
                --add)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -a)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --rm)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__edit__subcmd__help)
            opts="bio name pronouns location activity email website help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__edit__subcmd__help__subcmd__activity)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__edit__subcmd__help__subcmd__bio)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__edit__subcmd__help__subcmd__email)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__edit__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__edit__subcmd__help__subcmd__location)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__edit__subcmd__help__subcmd__name)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__edit__subcmd__help__subcmd__pronouns)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__edit__subcmd__help__subcmd__website)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__edit__subcmd__location)
            opts="-u -h --unset --help [LOCATION]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__edit__subcmd__name)
            opts="-u -h --unset --help [NAME]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__edit__subcmd__pronouns)
            opts="-u -h --unset --help [PRONOUNS]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__edit__subcmd__website)
            opts="-u -h --unset --help [URL]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__follow)
            opts="-h --help <USER>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__followers)
            opts="-h --help [USER]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__following)
            opts="-h --help [USER]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__gpg)
            opts="-h --help list view delete upload verify help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__gpg__subcmd__delete)
            opts="-f -h --force --help <ID>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__gpg__subcmd__help)
            opts="list view delete upload verify help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__gpg__subcmd__help__subcmd__delete)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__gpg__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__gpg__subcmd__help__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__gpg__subcmd__help__subcmd__upload)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__gpg__subcmd__help__subcmd__verify)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__gpg__subcmd__help__subcmd__view)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__gpg__subcmd__list)
            opts="-v -h --verbose --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__gpg__subcmd__upload)
            opts="-n -h --no-verify --help <KEY>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__gpg__subcmd__verify)
            opts="-h --help <ID>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__gpg__subcmd__view)
            opts="-h --help <ID>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__help)
            opts="search view browse follow unfollow following followers block unblock repos orgs activity edit key gpg help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__help__subcmd__activity)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__help__subcmd__block)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__help__subcmd__browse)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__help__subcmd__edit)
            opts="bio name pronouns location activity email website"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__help__subcmd__edit__subcmd__activity)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__help__subcmd__edit__subcmd__bio)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__help__subcmd__edit__subcmd__email)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__help__subcmd__edit__subcmd__location)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__help__subcmd__edit__subcmd__name)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__help__subcmd__edit__subcmd__pronouns)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__help__subcmd__edit__subcmd__website)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__help__subcmd__follow)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__help__subcmd__followers)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__help__subcmd__following)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__help__subcmd__gpg)
            opts="list view delete upload verify"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__help__subcmd__gpg__subcmd__delete)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__help__subcmd__gpg__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__help__subcmd__gpg__subcmd__upload)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__help__subcmd__gpg__subcmd__verify)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__help__subcmd__gpg__subcmd__view)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__help__subcmd__key)
            opts="list view delete upload"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__help__subcmd__key__subcmd__delete)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__help__subcmd__key__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__help__subcmd__key__subcmd__upload)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__help__subcmd__key__subcmd__view)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__help__subcmd__orgs)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__help__subcmd__repos)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__help__subcmd__search)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__help__subcmd__unblock)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__help__subcmd__unfollow)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__help__subcmd__view)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__key)
            opts="-h --help list view delete upload help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__key__subcmd__delete)
            opts="-h --help <ID>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__key__subcmd__help)
            opts="list view delete upload help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__key__subcmd__help__subcmd__delete)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__key__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__key__subcmd__help__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__key__subcmd__help__subcmd__upload)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__key__subcmd__help__subcmd__view)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__key__subcmd__list)
            opts="-v -h --verbose --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__key__subcmd__upload)
            opts="-t -f -r -h --title --force --read-only --help [KEYFILE]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --title)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__key__subcmd__view)
            opts="-h --help <ID>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__orgs)
            opts="-h --help [USER]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__repos)
            opts="-h --starred --sort --page --help [USER]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --sort)
                    COMPREPLY=($(compgen -W "name modified created stars forks" -- "${cur}"))
                    return 0
                    ;;
                --page)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__search)
            opts="-p -h --page --help <QUERY>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --page)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -p)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__unblock)
            opts="-h --help <USER>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__unfollow)
            opts="-h --help <USER>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__user__subcmd__view)
            opts="-h --help [USER]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__version)
            opts="-v -h --check --verbose --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__whoami)
            opts="-r -h --remote --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__wiki)
            opts="-R -r -h --remote --repo --help contents view clone browse help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --repo)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__wiki__subcmd__browse)
            opts="-R -r -h --remote --repo --help <PAGE>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --repo)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__wiki__subcmd__clone)
            opts="-p -S -I -R -r -h --path --ssh --identity-file --remote --repo --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -p)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ssh)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                -S)
                    COMPREPLY=($(compgen -W "true false" -- "${cur}"))
                    return 0
                    ;;
                --identity-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -I)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --repo)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__wiki__subcmd__contents)
            opts="-R -r -h --remote --repo --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --repo)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__wiki__subcmd__help)
            opts="contents view clone browse help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__wiki__subcmd__help__subcmd__browse)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__wiki__subcmd__help__subcmd__clone)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__wiki__subcmd__help__subcmd__contents)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__wiki__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__wiki__subcmd__help__subcmd__view)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        fj__subcmd__wiki__subcmd__view)
            opts="-R -r -h --remote --repo --help <PAGE>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --repo)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
    esac
}

if [[ "${BASH_VERSINFO[0]}" -eq 4 && "${BASH_VERSINFO[1]}" -ge 4 || "${BASH_VERSINFO[0]}" -gt 4 ]]; then
    complete -F _fj -o nosort -o bashdefault -o default fj
else
    complete -F _fj -o bashdefault -o default fj
fi

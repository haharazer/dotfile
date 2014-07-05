" For Svn ChanLog & Code Review
" Author Songfei@baidu.com

function! <SID>SetSvnInfo()
    :let svninfo = ""
    if system("test -e ~/.vim/plugin/svn.info ; echo $?") == 0
        :let svninfo = system("cat ~/.vim/plugin/svn.info 2>/dev/null")
    endif
    :let project = ""
"    :let cardID = ""
    :let lastrevision=""
    :let reviewer=""
    :let email=""
    :let host=""
    :let issue=""
    :let currentissue=""
    :let description=""
    if svninfo != ""
        :let project = <SID>GetValueOfKeyFromString("Project",svninfo)
"        :let cardID = <SID>GetValueOfKeyFromString("CardID",svninfo)
        :let lastrevision = <SID>GetValueOfKeyFromString("LastRevision",svninfo)
        :let reviewer = <SID>GetValueOfKeyFromString("Reviewer",svninfo)
        :let email = <SID>GetValueOfKeyFromString("Email",svninfo)
        :let host = <SID>GetValueOfKeyFromString("Host",svninfo)
        :let issue = <SID>GetValueOfKeyFromString("ISSUE",svninfo)
        :let description = <SID>GetValueOfKeyFromString("Description",svninfo)
        :let currentissue = <SID>GetValueOfKeyFromString("CurrentIssue",svninfo)
    endif

    call append(0,"Project=".project)
 "   call append(1,"CardID=")
    call append(1,"1.")
    call append(2,"TESTED=UNIT")
    call append(3,"ISSUE=".issue)
    call append(4,"BUGFIX=NONE")
    "设置code review信息
    :let lastline = line("$")
    call append(lastline,"")
    call append(lastline+1, "--Code Review Info--")
    call append(lastline+2,"-->使用说明<--")
    call append(lastline+3,"ChangeLog中的ISSUE值代表不同的CodeReview方式")
    call append(lastline+4,"NEW: 创建新的ISSUE, NONE: 不发起CR, ISSUE_NUM: 以该ISSUE_NUM的PatchSet形式发起CR")
    "call append(lastline+3,"CodeReview开关,0代表进行Cod")
    call append(lastline+5,"")
    call append(lastline+6,"-->Code Review配置信息<--")
    call append(lastline+7,"---->最近发起CodeReview的Revision Num, NEW ISSUE时务必填写")
    call append(lastline+8, "LastRevision=".lastrevision)
    call append(lastline+9,"---->最近发起的CodeReview的ISSUE Num ")
    call append(lastline+10, "CurrentIssue=".currentissue)
    call append(lastline+11,"---->ISSUE的标题 ")
    call append(lastline+12, "Description=".description)
    call append(lastline+13,"---->Reviewer的Email地址,以逗号分隔多个用户名,例如aaa,bbb")
    call append(lastline+14, "Reviewer=".reviewer)
    call append(lastline+15,"---->CodeReview发起者的Email地址")
    call append(lastline+16, "Email=".email)
    call append(lastline+17,"---->CodeReview平台的地址,格式为http://localhost:port")
    call append(lastline+18, "Host=".host)
    call cursor(2,2)
    return ""
endfunction


function! <SID>GetValueOfKeyFromString(key,src)
    :let matchpattern = a:key."=\\\([^\n]*\\\)\n"
    :let matchresult = matchstr(a:src,matchpattern)
    :let result = substitute(matchresult,matchpattern,'\1','')
    "去掉引号
    :let result = substitute(result,"\"","","g")
    return result
endfunction


function! <SID>GetValueofKey(key)
    " 获取某个key的值,key=value格式
    :let keylinenum = search(a:key."=","w")
    if keylinenum > 0
        :let line = getline(keylinenum)
        :let index = stridx(line,"=")
        :let content = strpart(line,index+1,strlen(line)-index)
        return content
    else
        return ""
    endif
endfunction

function! <SID>GetFormatChangeLog()
    :let tagline = search("TESTED=","w")
    :let index=2
    :let changeloginfo = ""
    while index < tagline
        :let changeloginfo = changeloginfo." ".getline(index)
        :let index = index + 1
    endwhile 
    "去掉换行符
    :let formatchangeloginfo = substitute(changeloginfo, "\n", " ", "g")
    return formatchangeloginfo
endfunction
function! <SID>SaveSvnInfo()
    " 保存SVN里的配置信息
    :let svninfo=""
    :let project=<SID>GetValueofKey("Project")
    :let svninfo=svninfo."Project="."\"".project."\"\n"
"   :let svninfo=svninfo."CardID="."\"".cardID."\"\n"
    :let issue=<SID>GetValueofKey("ISSUE")
    :let svninfo=svninfo."ISSUE="."\"".issue."\"\n"
    :let changelog=<SID>GetFormatChangeLog()
    :let svninfo=svninfo."ChangeLog="."\"".changelog."\"\n"
    :let currentissue=<SID>GetValueofKey("CurrentIssue")
    :let svninfo=svninfo."CurrentIssue="."\"".currentissue."\"\n"
    :let description=<SID>GetValueofKey("Description")
    :let svninfo=svninfo."Description="."\"".description."\"\n"
    :let reviewer=<SID>GetValueofKey("Reviewer")
    :let svninfo=svninfo."Reviewer="."\"".reviewer."\"\n"
    :let lastrevision=<SID>GetValueofKey("LastRevision")
    :let svninfo=svninfo."LastRevision="."\"".lastrevision."\"\n"
    :let email=<SID>GetValueofKey("Email")
    :let svninfo=svninfo."Email="."\"".email."\"\n"
    :let host=<SID>GetValueofKey("Host")
    :let svninfo=svninfo."Host="."\"".host."\"\n"
    call system("echo -n \'".svninfo."\' >~/.vim/plugin/svn.info")
    return ""
endfunction


autocmd BufReadPost svn-commit*.tmp :call <SID>SetSvnInfo()
"autocmd BufWritePost svn-commit*.tmp :call <SID>SaveProjectInfo()
autocmd BufWritePost svn-commit*.tmp :call <SID>SaveSvnInfo()

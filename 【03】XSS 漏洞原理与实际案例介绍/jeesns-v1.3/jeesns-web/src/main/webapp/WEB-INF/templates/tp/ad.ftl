<#if ad??>
    <#if ad.status == 0>
        广告已被禁用
    <#elseif ad.startTime?datetime gt .now?datetime || ad.endTime?datetime lt .now?datetime>
        广告已过期
    <#else>
        <#if ad.type == 1>
            <a href="${ad.link}" target="_blank"><img src="${ad.content}"/></a>
        <#elseif ad.type == 2>
            <a href="${ad.link}" target="_blank">${ad.content}</a>
        <#elseif ad.type == 3>
            ${ad.content}
        </#if>
    </#if>
</#if>
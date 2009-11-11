<cfcomponent extends="wheelsMapping.test">

	<cfinclude template="/wheelsMapping/global/functions.cfm">

	<cffunction name="test_sum">
		<cfset loc.result = model("post").sum(property="views")>
		<cfset assert("loc.result IS 13")>
	</cffunction>

	<cffunction name="test_sum_with_where">
		<cfset loc.author = model("author").findOne(where="lastName='Djurner'")>
		<cfset loc.result = model("post").sum(property="views", where="authorid=#loc.author.id#")>
		<cfset assert("loc.result IS 10")>
	</cffunction>

	<cffunction name="test_sum_with_non_matching_where">
		<cfset loc.result = model("post").sum(property="views", where="id=0")>
		<cfset assert("loc.result IS 0")>
	</cffunction>

	<cffunction name="test_sum_with_distinct">
		<cfset loc.result = model("post").sum(property="views", distinct=true)>
		<cfset assert("loc.result IS 8")>
	</cffunction>
	
</cfcomponent>
<cfscript>
	param name="args.icon"            type="string" default="";
	param name="args.title"           type="string" default="";
	param name="args.subTitle"        type="string" default="";
	param name="args.topRightButtons" type="string" default="";
	param name="args.customImg"       type="string" default="";
	param name="args.pageBody"        type="string" default="";

	icon         = ReFind( "^fa\-", args.icon ) ? args.icon : "fa-#args.icon#";
	haveButtons  = Len( Trim( args.topRightButtons ) );
	hasIcon      = Len( Trim( args.icon ) );
	hasCustomImg = Len( Trim( args.customImg ) );

	if( hasCustomImg ) {
		customImg   = event.buildLink( assetId=args.customImg, derivative="customHeaderImg75px" );
		hasIcon = false;
	}
</cfscript>

<cfoutput>
	<div class="page-header<cfif haveButtons> clearfix with-buttons</cfif><cfif hasIcon> with-icon</cfif><cfif hasCustomImg> with-image</cfif>">
		<h1>
			<cfif hasIcon>
				<i class="fa fa-fw #icon#"></i>
			<cfelseif hasCustomImg>
				<span class="user-image"><img src="#customImg#" alt=""></span>
			</cfif>

			#args.title#

			<cfif Len( Trim( args.subTitle ) )>
				<span class="sub-title">
					<small>
						<i class="fa fa-angle-double-right"></i>
						<span class="page-subtitle">#args.subTitle#</span>
					</small>
				</span>
			</cfif>
		</h1>
		<cfif haveButtons>
			<div class="top-right-button-group">
				#args.topRightButtons#
			</div>
		</cfif>
	</div><!-- /.page-header -->
</cfoutput>
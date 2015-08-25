//Secret API key
#define SEC_API "key-b2f508b8076577f6d842b9855b8b7111"
//specify your domain, especially good if you've got more than one domain name linked on MailGun
#define DOMAIN "YOURDOMAIN-OR-.com"

mob
	verb
		testMail()
			var html = {"
				<div style="color:red;font-size:20px">Testing html</div>
				<div style="float:right">[usr.key]</div>
			"}
			sendMail("TO","FROM","Subject",html)
proc
	sendMail(mailTo,mailFrom,mailSubject,mailBody)
		if(world.system_type == "UNIX") {
			shell("curl -s --user 'api:[SEC_API]' https://api.mailgun.net/v3/[DOMAIN]/messages -F from='[mailFrom]' -F to='[mailTo]' -F subject='[mailSubject]' -F html='[mailBody]'")
		} else {
			shell("curl/curl -s https://api.mailgun.net/v3/[DOMAIN]/messages --user api:[SEC_API] -F from=[mailFrom] -F to=[mailTo] -F subject=\"[mailSubject]\" -F html=\"[mailBody]\" --cacert curl/ca-bundle.crt")
		}
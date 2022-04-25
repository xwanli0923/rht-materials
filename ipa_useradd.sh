#!/bin/bash 

# kinit admin
echo 'RedHat123^' | kinit admin

# add architect users ,the uid 1-10
echo "Add architect users"
for NUMBER in {1..9}
	do echo redhat | ipa user-add \
		--first="architect${NUMBER}" \
		--last=idm \
		--cn="architect${NUMBER} idm" \
		--displayname="architect${NUMBER} idm" \
		--gecos="architect${NUMBER} idm" \
		--email=student@example.com \
		--password architect${NUMBER}
	done

# add developer users ,the uid 11-19
echo "Add  developer users"
for NUMBER in {1..9}
	do echo redhat | ipa user-add \
		--first="developer${NUMBER}" \
		--last=idm \
		--cn="developer${NUMBER} idm" \
		--displayname="developer${NUMBER} idm" \
		--gecos="developer${NUMBER} idm" \
		--email=student@example.com \
		--password developer${NUMBER}
	done

# add operator users ,the uid 20-28
echo "Add  operator users"
for NUMBER in {1..9}
	do echo redhat | ipa user-add \
		--first="operator${NUMBER}" \
		--last=idm \
		--cn="operator${NUMBER} idm" \
		--displayname="operator${NUMBER} idm" \
		--gecos="operator${NUMBER} idm" \
		--email=student@example.com \
		--password operator${NUMBER}
	done


# create OpenStack LDAP Lookup user
echo "Create OpenStack LDAP Lookup"
echo 'RedHat123^' | ipa user-add --first=svc-ldap --last=idm --email=student@example.com --password svc-ldap


echo " IPA Groups..."
# ipa group-add editors --gid=229000002 --desc="Limited admins who can edit other users"
ipa group-add finance-members 
ipa group-add finance-swiftoperators 
ipa group-add finance-admins 
ipa group-add research-members 
ipa group-add research-swiftoperators 
ipa group-add research-admins 
ipa group-add production-members 
ipa group-add production-swiftoperators 
ipa group-add production-admins 
ipa group-add consulting-members 
ipa group-add consulting-swiftoperators 
ipa group-add consulting-admins 
# ipa group-add trust --desc="Trusts administrators group"

# add architect and operator users to consulting-swiftoperator group
ipa group-add-member consulting-swiftoperators --users=architect{1..9}
ipa group-add-member consulting-swiftoperators --users=operator{1..9}

# add architect  users to consulting-admins group
ipa group-add-member consulting-admins --users=architect{1..9}

# add architect and operator users to consulting-members group
ipa group-add-member consulting-members --users=architect{1..9}
ipa group-add-member consulting-members --users=operator{1..9}
	
# ###################################################################
# add architect and developer users to finance-swiftoperator group
ipa group-add-member finance-swiftoperators --users=architect{1..9}
ipa group-add-member finance-swiftoperators --users=developer{1..9}

# add architect  users to consulting-admins group
ipa group-add-member finance-admins --users=architect{1..9}

# add architect and developer users to consulting-members group
ipa group-add-member finance-members --users=architect{1..9}
ipa group-add-member finance-members --users=developer{1..9}

# add architect and operator users to production-swiftoperator group
ipa group-add-member production-swiftoperators --users=architect{1..9}
ipa group-add-member production-swiftoperators --users=operator{1..9}

# add architect  users to production-admins group
ipa group-add-member production-admins --users=architect{1..9}

# add architect and operator users to production-members group
ipa group-add-member production-members --users=architect{1..9}
ipa group-add-member production-members --users=operator{1..9}

# ##################################################
# add architect and developer users to research-swiftoperator group
ipa group-add-member research-swiftoperators --users=architect{1..9}
ipa group-add-member research-swiftoperators --users=developer{1..9}

# add architect  users to consulting-admins group
ipa group-add-member research-admins --users=architect{1..9}

# add architect and developer users to consulting-members group
ipa group-add-member research-members --users=architect{1..9}
ipa group-add-member research-members --users=developer{1..9}
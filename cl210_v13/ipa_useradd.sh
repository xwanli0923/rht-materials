#!/bin/bash 
# Xing Wanli (Augsu Hsing) 
# https://gitee.com/linuxgeeker

# This script is used to restore the original IPA server user and group accounts createdhis script 
echo 'RedHat123^' | kinit admin

# Add architect users
for NUMBER in {1..9}
	do echo redhat | ipa user-add \
		--first="architect${NUMBER}" \
		--last=idm \
		--cn="architect${NUMBER} idm" \
		--displayname="architect${NUMBER} idm" \
		--gecos="architect${NUMBER} idm" \
		--email=student@example.com \
		--password architect${NUMBER}

# Add developer users
    echo redhat | ipa user-add \
		--first="developer${NUMBER}" \
		--last=idm \
		--cn="developer${NUMBER} idm" \
		--displayname="developer${NUMBER} idm" \
		--gecos="developer${NUMBER} idm" \
		--email=student@example.com \
		--password developer${NUMBER}

# Add operator users
echo "Add  operator users"
	  echo redhat | ipa user-add \
		--first="operator${NUMBER}" \
		--last=idm \
		--cn="operator${NUMBER} idm" \
		--displayname="operator${NUMBER} idm" \
		--gecos="operator${NUMBER} idm" \
		--email=student@example.com \
		--password operator${NUMBER}
done


# Create OpenStack LDAP Lookup user
echo "Create OpenStack LDAP Lookup"
echo 'RedHat123^' | ipa user-add --first=svc-ldap --last=idm --email=student@example.com --password svc-ldap

# Create project groups 
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

# Add users to consulting* group
# Add architects and operators  to consulting-swiftoperator group
ipa group-add-member consulting-swiftoperators --users=architect{1..9}
ipa group-add-member consulting-swiftoperators --users=operator{1..9}

# Add architects to consulting-admins group
ipa group-add-member consulting-admins --users=architect{1..9}

# Add architects and operators to consulting-members group
ipa group-add-member consulting-members --users=architect{1..9}
ipa group-add-member consulting-members --users=operator{1..9}
	
# ###################################################################
# Add users to finance-* groups
# Add architects and developers to finance-swiftoperator group
ipa group-add-member finance-swiftoperators --users=architect{1..9}
ipa group-add-member finance-swiftoperators --users=developer{1..9}

# Add architects  to finance-admins group
ipa group-add-member finance-admins --users=architect{1..9}

# Add architects and developers to finance-members group
ipa group-add-member finance-members --users=architect{1..9}
ipa group-add-member finance-members --users=developer{1..9}

# ###################################################################
# Add users to production-* groups
# Add architects and operators to production-swiftoperator group
ipa group-add-member production-swiftoperators --users=architect{1..9}
ipa group-add-member production-swiftoperators --users=operator{1..9}

# Add architect  users to production-admins group
ipa group-add-member production-admins --users=architect{1..9}

# add architects and operators users to production-members group
ipa group-add-member production-members --users=architect{1..9}
ipa group-add-member production-members --users=operator{1..9}

# ##################################################
# Add users to research-* groups
# Add architects and developers to research-swiftoperator group
ipa group-add-member research-swiftoperators --users=architect{1..9}
ipa group-add-member research-swiftoperators --users=developer{1..9}

# Add architects to research-admins group
ipa group-add-member research-admins --users=architect{1..9}

# Add architects and developers to research-members group
ipa group-add-member research-members --users=architect{1..9}
ipa group-add-member research-members --users=developer{1..9}
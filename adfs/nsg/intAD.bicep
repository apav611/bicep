param location string = resourceGroup().location

param networkSecurityGroups_INT_AD_name string = 'INT-AD'

param subnet object = {
  ad: '10.0.1.0/25'
  dmz: '10.0.3.0/24'
}

resource networkSecurityGroups_INT_AD_name_resource 'Microsoft.Network/networkSecurityGroups@2020-11-01' = {
  name: networkSecurityGroups_INT_AD_name
  location: location
  tags: {
    displayName: 'adNSG'
  }
  properties: {
    securityRules: [
      {
        name: 'deny_RDP_from_DMZ'
        properties: {
          description: 'deny RDP to AD Servers from DMZ'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '3389'
          sourceAddressPrefix: subnet.dmz
          destinationAddressPrefix: subnet.ad
          access: 'Deny'
          priority: 110
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'allow_RDP_to_AD_Servers'
        properties: {
          description: 'Allow RDP to AD Servers from Virtual Network'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '3389'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: subnet.ad
          access: 'Allow'
          priority: 120
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'allow_AD_SMTP'
        properties: {
          description: 'Allow AD Communication'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '25'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: subnet.ad
          access: 'Allow'
          priority: 121
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'allow_AD_WINS'
        properties: {
          description: 'Allow AD Communication'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '42'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: subnet.ad
          access: 'Allow'
          priority: 122
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'allow_AD_Repl'
        properties: {
          description: 'Allow AD Communication'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '135'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: subnet.ad
          access: 'Allow'
          priority: 123
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'allow_AD_NetBIOS'
        properties: {
          description: 'Allow AD Communication'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '137'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: subnet.ad
          access: 'Allow'
          priority: 124
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'allow_AD_netlogin'
        properties: {
          description: 'Allow AD Communication - DFSN, NetBIOS Session, NetLogon'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '139'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: subnet.ad
          access: 'Allow'
          priority: 125
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'allow_AD_LDAP'
        properties: {
          description: 'Allow AD Communication'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '389'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: subnet.ad
          access: 'Allow'
          priority: 126
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'allow_AD_LDAP_udp'
        properties: {
          description: 'Allow AD Communication'
          protocol: 'Udp'
          sourcePortRange: '*'
          destinationPortRange: '389'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: subnet.ad
          access: 'Allow'
          priority: 127
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'allow_AD_LDAPS'
        properties: {
          description: 'Allow AD Communication'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '636'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: subnet.ad
          access: 'Allow'
          priority: 128
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'allow_AD_LDAP_GC'
        properties: {
          description: 'Allow AD Communication'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '3268-3269'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: subnet.ad
          access: 'Allow'
          priority: 129
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'allow_AD_KRB'
        properties: {
          description: 'Allow AD Communication'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '88'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: subnet.ad
          access: 'Allow'
          priority: 130
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'allow_AD_KRB_udp'
        properties: {
          description: 'Allow AD Communication'
          protocol: 'Udp'
          sourcePortRange: '*'
          destinationPortRange: '88'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: subnet.ad
          access: 'Allow'
          priority: 131
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'allow_AD_DNS'
        properties: {
          description: 'Allow AD Communication'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '53'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: subnet.ad
          access: 'Allow'
          priority: 132
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'allow_AD_DNS_udp'
        properties: {
          description: 'Allow AD Communication'
          protocol: 'Udp'
          sourcePortRange: '*'
          destinationPortRange: '53'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: subnet.ad
          access: 'Allow'
          priority: 133
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'allow_AD_445'
        properties: {
          description: 'Allow AD Communication - SMB, CIFS,SMB2, DFSN, LSARPC, NbtSS, NetLogonR, SamR, SrvSvc'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '445'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: subnet.ad
          access: 'Allow'
          priority: 134
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'allow_AD_445_udp'
        properties: {
          description: 'Allow AD Communication - SMB, CIFS,SMB2, DFSN, LSARPC, NbtSS, NetLogonR, SamR, SrvSvc'
          protocol: 'Udp'
          sourcePortRange: '*'
          destinationPortRange: '445'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: subnet.ad
          access: 'Allow'
          priority: 135
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'allow_AD_SOAP'
        properties: {
          description: 'Allow AD Communication'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '9389'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: subnet.ad
          access: 'Allow'
          priority: 136
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'allow_AD_DFSR'
        properties: {
          description: 'Allow AD Communication - DFSR/Sysvol'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '5722'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: subnet.ad
          access: 'Allow'
          priority: 137
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'allow_AD_KRB2'
        properties: {
          description: 'Allow AD Communication - Kerberos change/set password'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '464'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: subnet.ad
          access: 'Allow'
          priority: 138
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'allow_AD_KRB2_udp'
        properties: {
          description: 'Allow AD Communication - Kerberos change/set password'
          protocol: 'Udp'
          sourcePortRange: '*'
          destinationPortRange: '464'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: subnet.ad
          access: 'Allow'
          priority: 139
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'allow_AD_time'
        properties: {
          description: 'Allow AD Communication - Windows Time Protocol'
          protocol: 'Udp'
          sourcePortRange: '*'
          destinationPortRange: '123'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: subnet.ad
          access: 'Allow'
          priority: 140
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'allow_AD_auth'
        properties: {
          description: 'Allow AD Communication'
          protocol: 'Udp'
          sourcePortRange: '*'
          destinationPortRange: '137-138'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: subnet.ad
          access: 'Allow'
          priority: 141
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'allow_AD_ephemeral'
        properties: {
          description: 'Allow AD Communication'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '49152-65535'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: subnet.ad
          access: 'Allow'
          priority: 142
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'allow_AD_ephemeral_udp'
        properties: {
          description: 'Allow AD Communication'
          protocol: 'Udp'
          sourcePortRange: '*'
          destinationPortRange: '49152-65535'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: subnet.ad
          access: 'Allow'
          priority: 143
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'deny_AD_Other_TCP'
        properties: {
          description: 'deny remainder of Communications'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '*'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: subnet.ad
          access: 'Deny'
          priority: 200
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'deny_AD_Other_UDP'
        properties: {
          description: 'deny remainder of Communications'
          protocol: 'Udp'
          sourcePortRange: '*'
          destinationPortRange: '*'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: subnet.ad
          access: 'Deny'
          priority: 201
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
    ]
  }
}

resource networkSecurityGroups_INT_AD_name_allow_AD_445 'Microsoft.Network/networkSecurityGroups/securityRules@2020-11-01' = {
  parent: networkSecurityGroups_INT_AD_name_resource
  name: 'allow_AD_445'
  properties: {
    description: 'Allow AD Communication - SMB, CIFS,SMB2, DFSN, LSARPC, NbtSS, NetLogonR, SamR, SrvSvc'
    protocol: 'Tcp'
    sourcePortRange: '*'
    destinationPortRange: '445'
    sourceAddressPrefix: 'VirtualNetwork'
    destinationAddressPrefix: subnet.ad
    access: 'Allow'
    priority: 134
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

resource networkSecurityGroups_INT_AD_name_allow_AD_445_udp 'Microsoft.Network/networkSecurityGroups/securityRules@2020-11-01' = {
  parent: networkSecurityGroups_INT_AD_name_resource
  name: 'allow_AD_445_udp'
  properties: {
    description: 'Allow AD Communication - SMB, CIFS,SMB2, DFSN, LSARPC, NbtSS, NetLogonR, SamR, SrvSvc'
    protocol: 'Udp'
    sourcePortRange: '*'
    destinationPortRange: '445'
    sourceAddressPrefix: 'VirtualNetwork'
    destinationAddressPrefix: subnet.ad
    access: 'Allow'
    priority: 135
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

resource networkSecurityGroups_INT_AD_name_allow_AD_auth 'Microsoft.Network/networkSecurityGroups/securityRules@2020-11-01' = {
  parent: networkSecurityGroups_INT_AD_name_resource
  name: 'allow_AD_auth'
  properties: {
    description: 'Allow AD Communication'
    protocol: 'Udp'
    sourcePortRange: '*'
    destinationPortRange: '137-138'
    sourceAddressPrefix: 'VirtualNetwork'
    destinationAddressPrefix: subnet.ad
    access: 'Allow'
    priority: 141
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

resource networkSecurityGroups_INT_AD_name_allow_AD_DFSR 'Microsoft.Network/networkSecurityGroups/securityRules@2020-11-01' = {
  parent: networkSecurityGroups_INT_AD_name_resource
  name: 'allow_AD_DFSR'
  properties: {
    description: 'Allow AD Communication - DFSR/Sysvol'
    protocol: 'Tcp'
    sourcePortRange: '*'
    destinationPortRange: '5722'
    sourceAddressPrefix: 'VirtualNetwork'
    destinationAddressPrefix: subnet.ad
    access: 'Allow'
    priority: 137
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

resource networkSecurityGroups_INT_AD_name_allow_AD_DNS 'Microsoft.Network/networkSecurityGroups/securityRules@2020-11-01' = {
  parent: networkSecurityGroups_INT_AD_name_resource
  name: 'allow_AD_DNS'
  properties: {
    description: 'Allow AD Communication'
    protocol: 'Tcp'
    sourcePortRange: '*'
    destinationPortRange: '53'
    sourceAddressPrefix: 'VirtualNetwork'
    destinationAddressPrefix: subnet.ad
    access: 'Allow'
    priority: 132
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

resource networkSecurityGroups_INT_AD_name_allow_AD_DNS_udp 'Microsoft.Network/networkSecurityGroups/securityRules@2020-11-01' = {
  parent: networkSecurityGroups_INT_AD_name_resource
  name: 'allow_AD_DNS_udp'
  properties: {
    description: 'Allow AD Communication'
    protocol: 'Udp'
    sourcePortRange: '*'
    destinationPortRange: '53'
    sourceAddressPrefix: 'VirtualNetwork'
    destinationAddressPrefix: subnet.ad
    access: 'Allow'
    priority: 133
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

resource networkSecurityGroups_INT_AD_name_allow_AD_ephemeral 'Microsoft.Network/networkSecurityGroups/securityRules@2020-11-01' = {
  parent: networkSecurityGroups_INT_AD_name_resource
  name: 'allow_AD_ephemeral'
  properties: {
    description: 'Allow AD Communication'
    protocol: 'Tcp'
    sourcePortRange: '*'
    destinationPortRange: '49152-65535'
    sourceAddressPrefix: 'VirtualNetwork'
    destinationAddressPrefix: subnet.ad
    access: 'Allow'
    priority: 142
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

resource networkSecurityGroups_INT_AD_name_allow_AD_ephemeral_udp 'Microsoft.Network/networkSecurityGroups/securityRules@2020-11-01' = {
  parent: networkSecurityGroups_INT_AD_name_resource
  name: 'allow_AD_ephemeral_udp'
  properties: {
    description: 'Allow AD Communication'
    protocol: 'Udp'
    sourcePortRange: '*'
    destinationPortRange: '49152-65535'
    sourceAddressPrefix: 'VirtualNetwork'
    destinationAddressPrefix: subnet.ad
    access: 'Allow'
    priority: 143
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

resource networkSecurityGroups_INT_AD_name_allow_AD_KRB 'Microsoft.Network/networkSecurityGroups/securityRules@2020-11-01' = {
  parent: networkSecurityGroups_INT_AD_name_resource
  name: 'allow_AD_KRB'
  properties: {
    description: 'Allow AD Communication'
    protocol: 'Tcp'
    sourcePortRange: '*'
    destinationPortRange: '88'
    sourceAddressPrefix: 'VirtualNetwork'
    destinationAddressPrefix: subnet.ad
    access: 'Allow'
    priority: 130
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

resource networkSecurityGroups_INT_AD_name_allow_AD_KRB_udp 'Microsoft.Network/networkSecurityGroups/securityRules@2020-11-01' = {
  parent: networkSecurityGroups_INT_AD_name_resource
  name: 'allow_AD_KRB_udp'
  properties: {
    description: 'Allow AD Communication'
    protocol: 'Udp'
    sourcePortRange: '*'
    destinationPortRange: '88'
    sourceAddressPrefix: 'VirtualNetwork'
    destinationAddressPrefix: subnet.ad
    access: 'Allow'
    priority: 131
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

resource networkSecurityGroups_INT_AD_name_allow_AD_KRB2 'Microsoft.Network/networkSecurityGroups/securityRules@2020-11-01' = {
  parent: networkSecurityGroups_INT_AD_name_resource
  name: 'allow_AD_KRB2'
  properties: {
    description: 'Allow AD Communication - Kerberos change/set password'
    protocol: 'Tcp'
    sourcePortRange: '*'
    destinationPortRange: '464'
    sourceAddressPrefix: 'VirtualNetwork'
    destinationAddressPrefix: subnet.ad
    access: 'Allow'
    priority: 138
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

resource networkSecurityGroups_INT_AD_name_allow_AD_KRB2_udp 'Microsoft.Network/networkSecurityGroups/securityRules@2020-11-01' = {
  parent: networkSecurityGroups_INT_AD_name_resource
  name: 'allow_AD_KRB2_udp'
  properties: {
    description: 'Allow AD Communication - Kerberos change/set password'
    protocol: 'Udp'
    sourcePortRange: '*'
    destinationPortRange: '464'
    sourceAddressPrefix: 'VirtualNetwork'
    destinationAddressPrefix: subnet.ad
    access: 'Allow'
    priority: 139
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

resource networkSecurityGroups_INT_AD_name_allow_AD_LDAP 'Microsoft.Network/networkSecurityGroups/securityRules@2020-11-01' = {
  parent: networkSecurityGroups_INT_AD_name_resource
  name: 'allow_AD_LDAP'
  properties: {
    description: 'Allow AD Communication'
    protocol: 'Tcp'
    sourcePortRange: '*'
    destinationPortRange: '389'
    sourceAddressPrefix: 'VirtualNetwork'
    destinationAddressPrefix: subnet.ad
    access: 'Allow'
    priority: 126
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

resource networkSecurityGroups_INT_AD_name_allow_AD_LDAP_GC 'Microsoft.Network/networkSecurityGroups/securityRules@2020-11-01' = {
  parent: networkSecurityGroups_INT_AD_name_resource
  name: 'allow_AD_LDAP_GC'
  properties: {
    description: 'Allow AD Communication'
    protocol: 'Tcp'
    sourcePortRange: '*'
    destinationPortRange: '3268-3269'
    sourceAddressPrefix: 'VirtualNetwork'
    destinationAddressPrefix: subnet.ad
    access: 'Allow'
    priority: 129
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

resource networkSecurityGroups_INT_AD_name_allow_AD_LDAP_udp 'Microsoft.Network/networkSecurityGroups/securityRules@2020-11-01' = {
  parent: networkSecurityGroups_INT_AD_name_resource
  name: 'allow_AD_LDAP_udp'
  properties: {
    description: 'Allow AD Communication'
    protocol: 'Udp'
    sourcePortRange: '*'
    destinationPortRange: '389'
    sourceAddressPrefix: 'VirtualNetwork'
    destinationAddressPrefix: subnet.ad
    access: 'Allow'
    priority: 127
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

resource networkSecurityGroups_INT_AD_name_allow_AD_LDAPS 'Microsoft.Network/networkSecurityGroups/securityRules@2020-11-01' = {
  parent: networkSecurityGroups_INT_AD_name_resource
  name: 'allow_AD_LDAPS'
  properties: {
    description: 'Allow AD Communication'
    protocol: 'Tcp'
    sourcePortRange: '*'
    destinationPortRange: '636'
    sourceAddressPrefix: 'VirtualNetwork'
    destinationAddressPrefix: subnet.ad
    access: 'Allow'
    priority: 128
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

resource networkSecurityGroups_INT_AD_name_allow_AD_NetBIOS 'Microsoft.Network/networkSecurityGroups/securityRules@2020-11-01' = {
  parent: networkSecurityGroups_INT_AD_name_resource
  name: 'allow_AD_NetBIOS'
  properties: {
    description: 'Allow AD Communication'
    protocol: 'Tcp'
    sourcePortRange: '*'
    destinationPortRange: '137'
    sourceAddressPrefix: 'VirtualNetwork'
    destinationAddressPrefix: subnet.ad
    access: 'Allow'
    priority: 124
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

resource networkSecurityGroups_INT_AD_name_allow_AD_netlogin 'Microsoft.Network/networkSecurityGroups/securityRules@2020-11-01' = {
  parent: networkSecurityGroups_INT_AD_name_resource
  name: 'allow_AD_netlogin'
  properties: {
    description: 'Allow AD Communication - DFSN, NetBIOS Session, NetLogon'
    protocol: 'Tcp'
    sourcePortRange: '*'
    destinationPortRange: '139'
    sourceAddressPrefix: 'VirtualNetwork'
    destinationAddressPrefix: subnet.ad
    access: 'Allow'
    priority: 125
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

resource networkSecurityGroups_INT_AD_name_allow_AD_Repl 'Microsoft.Network/networkSecurityGroups/securityRules@2020-11-01' = {
  parent: networkSecurityGroups_INT_AD_name_resource
  name: 'allow_AD_Repl'
  properties: {
    description: 'Allow AD Communication'
    protocol: 'Tcp'
    sourcePortRange: '*'
    destinationPortRange: '135'
    sourceAddressPrefix: 'VirtualNetwork'
    destinationAddressPrefix: subnet.ad
    access: 'Allow'
    priority: 123
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

resource networkSecurityGroups_INT_AD_name_allow_AD_SMTP 'Microsoft.Network/networkSecurityGroups/securityRules@2020-11-01' = {
  parent: networkSecurityGroups_INT_AD_name_resource
  name: 'allow_AD_SMTP'
  properties: {
    description: 'Allow AD Communication'
    protocol: 'Tcp'
    sourcePortRange: '*'
    destinationPortRange: '25'
    sourceAddressPrefix: 'VirtualNetwork'
    destinationAddressPrefix: subnet.ad
    access: 'Allow'
    priority: 121
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

resource networkSecurityGroups_INT_AD_name_allow_AD_SOAP 'Microsoft.Network/networkSecurityGroups/securityRules@2020-11-01' = {
  parent: networkSecurityGroups_INT_AD_name_resource
  name: 'allow_AD_SOAP'
  properties: {
    description: 'Allow AD Communication'
    protocol: 'Tcp'
    sourcePortRange: '*'
    destinationPortRange: '9389'
    sourceAddressPrefix: 'VirtualNetwork'
    destinationAddressPrefix: subnet.ad
    access: 'Allow'
    priority: 136
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

resource networkSecurityGroups_INT_AD_name_allow_AD_time 'Microsoft.Network/networkSecurityGroups/securityRules@2020-11-01' = {
  parent: networkSecurityGroups_INT_AD_name_resource
  name: 'allow_AD_time'
  properties: {
    description: 'Allow AD Communication - Windows Time Protocol'
    protocol: 'Udp'
    sourcePortRange: '*'
    destinationPortRange: '123'
    sourceAddressPrefix: 'VirtualNetwork'
    destinationAddressPrefix: subnet.ad
    access: 'Allow'
    priority: 140
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

resource networkSecurityGroups_INT_AD_name_allow_AD_WINS 'Microsoft.Network/networkSecurityGroups/securityRules@2020-11-01' = {
  parent: networkSecurityGroups_INT_AD_name_resource
  name: 'allow_AD_WINS'
  properties: {
    description: 'Allow AD Communication'
    protocol: 'Tcp'
    sourcePortRange: '*'
    destinationPortRange: '42'
    sourceAddressPrefix: 'VirtualNetwork'
    destinationAddressPrefix: subnet.ad
    access: 'Allow'
    priority: 122
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

resource networkSecurityGroups_INT_AD_name_allow_RDP_to_AD_Servers 'Microsoft.Network/networkSecurityGroups/securityRules@2020-11-01' = {
  parent: networkSecurityGroups_INT_AD_name_resource
  name: 'allow_RDP_to_AD_Servers'
  properties: {
    description: 'Allow RDP to AD Servers from Virtual Network'
    protocol: 'Tcp'
    sourcePortRange: '*'
    destinationPortRange: '3389'
    sourceAddressPrefix: 'VirtualNetwork'
    destinationAddressPrefix: subnet.ad
    access: 'Allow'
    priority: 120
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

resource networkSecurityGroups_INT_AD_name_deny_AD_Other_TCP 'Microsoft.Network/networkSecurityGroups/securityRules@2020-11-01' = {
  parent: networkSecurityGroups_INT_AD_name_resource
  name: 'deny_AD_Other_TCP'
  properties: {
    description: 'deny remainder of Communications'
    protocol: 'Tcp'
    sourcePortRange: '*'
    destinationPortRange: '*'
    sourceAddressPrefix: '*'
    destinationAddressPrefix: subnet.ad
    access: 'Deny'
    priority: 200
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

resource networkSecurityGroups_INT_AD_name_deny_AD_Other_UDP 'Microsoft.Network/networkSecurityGroups/securityRules@2020-11-01' = {
  parent: networkSecurityGroups_INT_AD_name_resource
  name: 'deny_AD_Other_UDP'
  properties: {
    description: 'deny remainder of Communications'
    protocol: 'Udp'
    sourcePortRange: '*'
    destinationPortRange: '*'
    sourceAddressPrefix: '*'
    destinationAddressPrefix: subnet.ad
    access: 'Deny'
    priority: 201
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

resource networkSecurityGroups_INT_AD_name_deny_RDP_from_DMZ 'Microsoft.Network/networkSecurityGroups/securityRules@2020-11-01' = {
  parent: networkSecurityGroups_INT_AD_name_resource
  name: 'deny_RDP_from_DMZ'
  properties: {
    description: 'deny RDP to AD Servers from DMZ'
    protocol: 'Tcp'
    sourcePortRange: '*'
    destinationPortRange: '3389'
    sourceAddressPrefix: subnet.dmz
    destinationAddressPrefix: subnet.ad
    access: 'Deny'
    priority: 110
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

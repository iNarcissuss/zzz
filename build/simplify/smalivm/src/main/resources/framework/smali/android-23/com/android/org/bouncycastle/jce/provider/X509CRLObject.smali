.class public Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;
.super Ljava/security/cert/X509CRL;
.source "X509CRLObject.java"


# instance fields
.field private c:Lcom/android/org/bouncycastle/asn1/x509/CertificateList;

.field private hashCodeValue:I

.field private isHashCodeSet:Z

.field private isIndirect:Z

.field private sigAlgName:Ljava/lang/String;

.field private sigAlgParams:[B


# direct methods
.method public constructor <init>(Lcom/android/org/bouncycastle/asn1/x509/CertificateList;)V
    .locals 4
    .param p1, "c"    # Lcom/android/org/bouncycastle/asn1/x509/CertificateList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CRLException;
        }
    .end annotation

    #@0
    .prologue
    .line 81
    invoke-direct {p0}, Ljava/security/cert/X509CRL;-><init>()V

    #@3
    .line 62
    const/4 v1, 0x0

    #@4
    iput-boolean v1, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->isHashCodeSet:Z

    #@6
    .line 85
    iput-object p1, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->c:Lcom/android/org/bouncycastle/asn1/x509/CertificateList;

    #@8
    .line 89
    :try_start_0
    invoke-virtual {p1}, Lcom/android/org/bouncycastle/asn1/x509/CertificateList;->getSignatureAlgorithm()Lcom/android/org/bouncycastle/asn1/x509/AlgorithmIdentifier;

    #@b
    move-result-object v1

    #@c
    invoke-static {v1}, Lcom/android/org/bouncycastle/jce/provider/X509SignatureUtil;->getSignatureName(Lcom/android/org/bouncycastle/asn1/x509/AlgorithmIdentifier;)Ljava/lang/String;

    #@f
    move-result-object v1

    #@10
    iput-object v1, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->sigAlgName:Ljava/lang/String;

    #@12
    .line 91
    invoke-virtual {p1}, Lcom/android/org/bouncycastle/asn1/x509/CertificateList;->getSignatureAlgorithm()Lcom/android/org/bouncycastle/asn1/x509/AlgorithmIdentifier;

    #@15
    move-result-object v1

    #@16
    invoke-virtual {v1}, Lcom/android/org/bouncycastle/asn1/x509/AlgorithmIdentifier;->getParameters()Lcom/android/org/bouncycastle/asn1/ASN1Encodable;

    #@19
    move-result-object v1

    #@1a
    if-eqz v1, :cond_0

    #@1c
    .line 93
    invoke-virtual {p1}, Lcom/android/org/bouncycastle/asn1/x509/CertificateList;->getSignatureAlgorithm()Lcom/android/org/bouncycastle/asn1/x509/AlgorithmIdentifier;

    #@1f
    move-result-object v1

    #@20
    invoke-virtual {v1}, Lcom/android/org/bouncycastle/asn1/x509/AlgorithmIdentifier;->getParameters()Lcom/android/org/bouncycastle/asn1/ASN1Encodable;

    #@23
    move-result-object v1

    #@24
    invoke-interface {v1}, Lcom/android/org/bouncycastle/asn1/ASN1Encodable;->toASN1Primitive()Lcom/android/org/bouncycastle/asn1/ASN1Primitive;

    #@27
    move-result-object v1

    #@28
    const-string/jumbo v2, "DER"

    #@2b
    invoke-virtual {v1, v2}, Lcom/android/org/bouncycastle/asn1/ASN1Primitive;->getEncoded(Ljava/lang/String;)[B

    #@2e
    move-result-object v1

    #@2f
    iput-object v1, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->sigAlgParams:[B

    #@31
    .line 100
    :goto_0
    invoke-static {p0}, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->isIndirectCRL(Ljava/security/cert/X509CRL;)Z

    #@34
    move-result v1

    #@35
    iput-boolean v1, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->isIndirect:Z

    #@37
    .line 83
    return-void

    #@38
    .line 97
    :cond_0
    const/4 v1, 0x0

    #@39
    iput-object v1, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->sigAlgParams:[B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    #@3b
    goto :goto_0

    #@3c
    .line 103
    :catch_0
    move-exception v0

    #@3d
    .line 104
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/security/cert/CRLException;

    #@3f
    new-instance v2, Ljava/lang/StringBuilder;

    #@41
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    #@44
    const-string/jumbo v3, "CRL contents invalid: "

    #@47
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    #@4a
    move-result-object v2

    #@4b
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    #@4e
    move-result-object v2

    #@4f
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    #@52
    move-result-object v2

    #@53
    invoke-direct {v1, v2}, Ljava/security/cert/CRLException;-><init>(Ljava/lang/String;)V

    #@56
    throw v1
.end method

.method private getExtensionOIDs(Z)Ljava/util/Set;
    .locals 8
    .param p1, "critical"    # Z

    #@0
    .prologue
    const/4 v7, 0x0

    #@1
    .line 129
    invoke-virtual {p0}, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->getVersion()I

    #@4
    move-result v5

    #@5
    const/4 v6, 0x2

    #@6
    if-ne v5, v6, :cond_2

    #@8
    .line 131
    iget-object v5, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->c:Lcom/android/org/bouncycastle/asn1/x509/CertificateList;

    #@a
    invoke-virtual {v5}, Lcom/android/org/bouncycastle/asn1/x509/CertificateList;->getTBSCertList()Lcom/android/org/bouncycastle/asn1/x509/TBSCertList;

    #@d
    move-result-object v5

    #@e
    invoke-virtual {v5}, Lcom/android/org/bouncycastle/asn1/x509/TBSCertList;->getExtensions()Lcom/android/org/bouncycastle/asn1/x509/Extensions;

    #@11
    move-result-object v2

    #@12
    .line 133
    .local v2, "extensions":Lcom/android/org/bouncycastle/asn1/x509/Extensions;
    if-eqz v2, :cond_2

    #@14
    .line 135
    new-instance v4, Ljava/util/HashSet;

    #@16
    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    #@19
    .line 136
    .local v4, "set":Ljava/util/Set;
    invoke-virtual {v2}, Lcom/android/org/bouncycastle/asn1/x509/Extensions;->oids()Ljava/util/Enumeration;

    #@1c
    move-result-object v0

    #@1d
    .line 138
    .local v0, "e":Ljava/util/Enumeration;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    #@20
    move-result v5

    #@21
    if-eqz v5, :cond_1

    #@23
    .line 140
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    #@26
    move-result-object v3

    #@27
    check-cast v3, Lcom/android/org/bouncycastle/asn1/ASN1ObjectIdentifier;

    #@29
    .line 141
    .local v3, "oid":Lcom/android/org/bouncycastle/asn1/ASN1ObjectIdentifier;
    invoke-virtual {v2, v3}, Lcom/android/org/bouncycastle/asn1/x509/Extensions;->getExtension(Lcom/android/org/bouncycastle/asn1/ASN1ObjectIdentifier;)Lcom/android/org/bouncycastle/asn1/x509/Extension;

    #@2c
    move-result-object v1

    #@2d
    .line 143
    .local v1, "ext":Lcom/android/org/bouncycastle/asn1/x509/Extension;
    invoke-virtual {v1}, Lcom/android/org/bouncycastle/asn1/x509/Extension;->isCritical()Z

    #@30
    move-result v5

    #@31
    if-ne p1, v5, :cond_0

    #@33
    .line 145
    invoke-virtual {v3}, Lcom/android/org/bouncycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    #@36
    move-result-object v5

    #@37
    invoke-interface {v4, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    #@3a
    goto :goto_0

    #@3b
    .line 149
    .end local v1    # "ext":Lcom/android/org/bouncycastle/asn1/x509/Extension;
    .end local v3    # "oid":Lcom/android/org/bouncycastle/asn1/ASN1ObjectIdentifier;
    :cond_1
    return-object v4

    #@3c
    .line 153
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v2    # "extensions":Lcom/android/org/bouncycastle/asn1/x509/Extensions;
    .end local v4    # "set":Ljava/util/Set;
    :cond_2
    return-object v7
.end method

.method public static isIndirectCRL(Ljava/security/cert/X509CRL;)Z
    .locals 4
    .param p0, "crl"    # Ljava/security/cert/X509CRL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CRLException;
        }
    .end annotation

    #@0
    .prologue
    .line 70
    :try_start_0
    sget-object v2, Lcom/android/org/bouncycastle/asn1/x509/Extension;->issuingDistributionPoint:Lcom/android/org/bouncycastle/asn1/ASN1ObjectIdentifier;

    #@2
    invoke-virtual {v2}, Lcom/android/org/bouncycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    #@5
    move-result-object v2

    #@6
    invoke-virtual {p0, v2}, Ljava/security/cert/X509CRL;->getExtensionValue(Ljava/lang/String;)[B

    #@9
    move-result-object v1

    #@a
    .line 71
    .local v1, "idp":[B
    if-eqz v1, :cond_0

    #@c
    .line 72
    invoke-static {v1}, Lcom/android/org/bouncycastle/asn1/ASN1OctetString;->getInstance(Ljava/lang/Object;)Lcom/android/org/bouncycastle/asn1/ASN1OctetString;

    #@f
    move-result-object v2

    #@10
    invoke-virtual {v2}, Lcom/android/org/bouncycastle/asn1/ASN1OctetString;->getOctets()[B

    #@13
    move-result-object v2

    #@14
    invoke-static {v2}, Lcom/android/org/bouncycastle/asn1/x509/IssuingDistributionPoint;->getInstance(Ljava/lang/Object;)Lcom/android/org/bouncycastle/asn1/x509/IssuingDistributionPoint;

    #@17
    move-result-object v2

    #@18
    invoke-virtual {v2}, Lcom/android/org/bouncycastle/asn1/x509/IssuingDistributionPoint;->isIndirectCRL()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    #@1b
    move-result v2

    #@1c
    .line 71
    :goto_0
    return v2

    #@1d
    :cond_0
    const/4 v2, 0x0

    #@1e
    goto :goto_0

    #@1f
    .line 75
    .end local v1    # "idp":[B
    :catch_0
    move-exception v0

    #@20
    .line 76
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Lcom/android/org/bouncycastle/jce/provider/ExtCRLException;

    #@22
    .line 77
    const-string/jumbo v3, "Exception reading IssuingDistributionPoint"

    #@25
    .line 76
    invoke-direct {v2, v3, v0}, Lcom/android/org/bouncycastle/jce/provider/ExtCRLException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    #@28
    throw v2
.end method

.method private loadCRLEntries()Ljava/util/Set;
    .locals 8

    #@0
    .prologue
    .line 278
    new-instance v4, Ljava/util/HashSet;

    #@2
    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    #@5
    .line 279
    .local v4, "entrySet":Ljava/util/Set;
    iget-object v6, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->c:Lcom/android/org/bouncycastle/asn1/x509/CertificateList;

    #@7
    invoke-virtual {v6}, Lcom/android/org/bouncycastle/asn1/x509/CertificateList;->getRevokedCertificateEnumeration()Ljava/util/Enumeration;

    #@a
    move-result-object v0

    #@b
    .line 281
    .local v0, "certs":Ljava/util/Enumeration;
    const/4 v5, 0x0

    #@c
    .line 282
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    #@f
    move-result v6

    #@10
    if-eqz v6, :cond_1

    #@12
    .line 284
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    #@15
    move-result-object v3

    #@16
    check-cast v3, Lcom/android/org/bouncycastle/asn1/x509/TBSCertList$CRLEntry;

    #@18
    .line 285
    .local v3, "entry":Lcom/android/org/bouncycastle/asn1/x509/TBSCertList$CRLEntry;
    new-instance v1, Lcom/android/org/bouncycastle/jce/provider/X509CRLEntryObject;

    #@1a
    iget-boolean v6, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->isIndirect:Z

    #@1c
    invoke-direct {v1, v3, v6, v5}, Lcom/android/org/bouncycastle/jce/provider/X509CRLEntryObject;-><init>(Lcom/android/org/bouncycastle/asn1/x509/TBSCertList$CRLEntry;ZLcom/android/org/bouncycastle/asn1/x500/X500Name;)V

    #@1f
    .line 286
    .local v1, "crlEntry":Lcom/android/org/bouncycastle/jce/provider/X509CRLEntryObject;
    invoke-interface {v4, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    #@22
    .line 287
    iget-boolean v6, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->isIndirect:Z

    #@24
    if-eqz v6, :cond_0

    #@26
    invoke-virtual {v3}, Lcom/android/org/bouncycastle/asn1/x509/TBSCertList$CRLEntry;->hasExtensions()Z

    #@29
    move-result v6

    #@2a
    if-eqz v6, :cond_0

    #@2c
    .line 289
    invoke-virtual {v3}, Lcom/android/org/bouncycastle/asn1/x509/TBSCertList$CRLEntry;->getExtensions()Lcom/android/org/bouncycastle/asn1/x509/Extensions;

    #@2f
    move-result-object v6

    #@30
    sget-object v7, Lcom/android/org/bouncycastle/asn1/x509/Extension;->certificateIssuer:Lcom/android/org/bouncycastle/asn1/ASN1ObjectIdentifier;

    #@32
    invoke-virtual {v6, v7}, Lcom/android/org/bouncycastle/asn1/x509/Extensions;->getExtension(Lcom/android/org/bouncycastle/asn1/ASN1ObjectIdentifier;)Lcom/android/org/bouncycastle/asn1/x509/Extension;

    #@35
    move-result-object v2

    #@36
    .line 291
    .local v2, "currentCaName":Lcom/android/org/bouncycastle/asn1/x509/Extension;
    if-eqz v2, :cond_0

    #@38
    .line 293
    invoke-virtual {v2}, Lcom/android/org/bouncycastle/asn1/x509/Extension;->getParsedValue()Lcom/android/org/bouncycastle/asn1/ASN1Encodable;

    #@3b
    move-result-object v6

    #@3c
    invoke-static {v6}, Lcom/android/org/bouncycastle/asn1/x509/GeneralNames;->getInstance(Ljava/lang/Object;)Lcom/android/org/bouncycastle/asn1/x509/GeneralNames;

    #@3f
    move-result-object v6

    #@40
    invoke-virtual {v6}, Lcom/android/org/bouncycastle/asn1/x509/GeneralNames;->getNames()[Lcom/android/org/bouncycastle/asn1/x509/GeneralName;

    #@43
    move-result-object v6

    #@44
    const/4 v7, 0x0

    #@45
    aget-object v6, v6, v7

    #@47
    invoke-virtual {v6}, Lcom/android/org/bouncycastle/asn1/x509/GeneralName;->getName()Lcom/android/org/bouncycastle/asn1/ASN1Encodable;

    #@4a
    move-result-object v6

    #@4b
    invoke-static {v6}, Lcom/android/org/bouncycastle/asn1/x500/X500Name;->getInstance(Ljava/lang/Object;)Lcom/android/org/bouncycastle/asn1/x500/X500Name;

    #@4e
    move-result-object v5

    #@4f
    .local v5, "previousCertificateIssuer":Lcom/android/org/bouncycastle/asn1/x500/X500Name;
    goto :goto_0

    #@50
    .line 298
    .end local v1    # "crlEntry":Lcom/android/org/bouncycastle/jce/provider/X509CRLEntryObject;
    .end local v2    # "currentCaName":Lcom/android/org/bouncycastle/asn1/x509/Extension;
    .end local v3    # "entry":Lcom/android/org/bouncycastle/asn1/x509/TBSCertList$CRLEntry;
    .end local v5    # "previousCertificateIssuer":Lcom/android/org/bouncycastle/asn1/x500/X500Name;
    :cond_1
    return-object v4
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "other"    # Ljava/lang/Object;

    #@0
    .prologue
    const/4 v4, 0x0

    #@1
    .line 582
    if-ne p0, p1, :cond_0

    #@3
    .line 584
    const/4 v2, 0x1

    #@4
    return v2

    #@5
    .line 587
    :cond_0
    instance-of v2, p1, Ljava/security/cert/X509CRL;

    #@7
    if-nez v2, :cond_1

    #@9
    .line 589
    return v4

    #@a
    .line 592
    :cond_1
    instance-of v2, p1, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;

    #@c
    if-eqz v2, :cond_3

    #@e
    move-object v0, p1

    #@f
    .line 594
    check-cast v0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;

    #@11
    .line 596
    .local v0, "crlObject":Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;
    iget-boolean v2, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->isHashCodeSet:Z

    #@13
    if-eqz v2, :cond_2

    #@15
    .line 598
    iget-boolean v1, v0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->isHashCodeSet:Z

    #@17
    .line 599
    .local v1, "otherIsHashCodeSet":Z
    if-eqz v1, :cond_2

    #@19
    .line 601
    iget v2, v0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->hashCodeValue:I

    #@1b
    iget v3, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->hashCodeValue:I

    #@1d
    if-eq v2, v3, :cond_2

    #@1f
    .line 603
    return v4

    #@20
    .line 608
    .end local v1    # "otherIsHashCodeSet":Z
    :cond_2
    iget-object v2, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->c:Lcom/android/org/bouncycastle/asn1/x509/CertificateList;

    #@22
    iget-object v3, v0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->c:Lcom/android/org/bouncycastle/asn1/x509/CertificateList;

    #@24
    invoke-virtual {v2, v3}, Lcom/android/org/bouncycastle/asn1/x509/CertificateList;->equals(Ljava/lang/Object;)Z

    #@27
    move-result v2

    #@28
    return v2

    #@29
    .line 611
    .end local v0    # "crlObject":Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;
    :cond_3
    invoke-super {p0, p1}, Ljava/security/cert/X509CRL;->equals(Ljava/lang/Object;)Z

    #@2c
    move-result v2

    #@2d
    return v2
.end method

.method public getCriticalExtensionOIDs()Ljava/util/Set;
    .locals 1

    #@0
    .prologue
    .line 158
    const/4 v0, 0x1

    #@1
    invoke-direct {p0, v0}, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->getExtensionOIDs(Z)Ljava/util/Set;

    #@4
    move-result-object v0

    #@5
    return-object v0
.end method

.method public getEncoded()[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CRLException;
        }
    .end annotation

    #@0
    .prologue
    .line 195
    :try_start_0
    iget-object v1, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->c:Lcom/android/org/bouncycastle/asn1/x509/CertificateList;

    #@2
    const-string/jumbo v2, "DER"

    #@5
    invoke-virtual {v1, v2}, Lcom/android/org/bouncycastle/asn1/x509/CertificateList;->getEncoded(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    #@8
    move-result-object v1

    #@9
    return-object v1

    #@a
    .line 198
    :catch_0
    move-exception v0

    #@b
    .line 199
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/security/cert/CRLException;

    #@d
    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    #@10
    move-result-object v2

    #@11
    invoke-direct {v1, v2}, Ljava/security/cert/CRLException;-><init>(Ljava/lang/String;)V

    #@14
    throw v1
.end method

.method public getExtensionValue(Ljava/lang/String;)[B
    .locals 6
    .param p1, "oid"    # Ljava/lang/String;

    #@0
    .prologue
    const/4 v4, 0x0

    #@1
    .line 168
    iget-object v3, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->c:Lcom/android/org/bouncycastle/asn1/x509/CertificateList;

    #@3
    invoke-virtual {v3}, Lcom/android/org/bouncycastle/asn1/x509/CertificateList;->getTBSCertList()Lcom/android/org/bouncycastle/asn1/x509/TBSCertList;

    #@6
    move-result-object v3

    #@7
    invoke-virtual {v3}, Lcom/android/org/bouncycastle/asn1/x509/TBSCertList;->getExtensions()Lcom/android/org/bouncycastle/asn1/x509/Extensions;

    #@a
    move-result-object v2

    #@b
    .line 170
    .local v2, "exts":Lcom/android/org/bouncycastle/asn1/x509/Extensions;
    if-eqz v2, :cond_0

    #@d
    .line 172
    new-instance v3, Lcom/android/org/bouncycastle/asn1/ASN1ObjectIdentifier;

    #@f
    invoke-direct {v3, p1}, Lcom/android/org/bouncycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    #@12
    invoke-virtual {v2, v3}, Lcom/android/org/bouncycastle/asn1/x509/Extensions;->getExtension(Lcom/android/org/bouncycastle/asn1/ASN1ObjectIdentifier;)Lcom/android/org/bouncycastle/asn1/x509/Extension;

    #@15
    move-result-object v1

    #@16
    .line 174
    .local v1, "ext":Lcom/android/org/bouncycastle/asn1/x509/Extension;
    if-eqz v1, :cond_0

    #@18
    .line 178
    :try_start_0
    invoke-virtual {v1}, Lcom/android/org/bouncycastle/asn1/x509/Extension;->getExtnValue()Lcom/android/org/bouncycastle/asn1/ASN1OctetString;

    #@1b
    move-result-object v3

    #@1c
    invoke-virtual {v3}, Lcom/android/org/bouncycastle/asn1/ASN1OctetString;->getEncoded()[B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    #@1f
    move-result-object v3

    #@20
    return-object v3

    #@21
    .line 181
    :catch_0
    move-exception v0

    #@22
    .line 182
    .local v0, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/IllegalStateException;

    #@24
    new-instance v4, Ljava/lang/StringBuilder;

    #@26
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    #@29
    const-string/jumbo v5, "error parsing "

    #@2c
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    #@2f
    move-result-object v4

    #@30
    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    #@33
    move-result-object v5

    #@34
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    #@37
    move-result-object v4

    #@38
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    #@3b
    move-result-object v4

    #@3c
    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    #@3f
    throw v3

    #@40
    .line 187
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "ext":Lcom/android/org/bouncycastle/asn1/x509/Extension;
    :cond_0
    return-object v4
.end method

.method public getIssuerDN()Ljava/security/Principal;
    .locals 2

    #@0
    .prologue
    .line 246
    new-instance v0, Lcom/android/org/bouncycastle/jce/X509Principal;

    #@2
    iget-object v1, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->c:Lcom/android/org/bouncycastle/asn1/x509/CertificateList;

    #@4
    invoke-virtual {v1}, Lcom/android/org/bouncycastle/asn1/x509/CertificateList;->getIssuer()Lcom/android/org/bouncycastle/asn1/x500/X500Name;

    #@7
    move-result-object v1

    #@8
    invoke-virtual {v1}, Lcom/android/org/bouncycastle/asn1/x500/X500Name;->toASN1Primitive()Lcom/android/org/bouncycastle/asn1/ASN1Primitive;

    #@b
    move-result-object v1

    #@c
    invoke-static {v1}, Lcom/android/org/bouncycastle/asn1/x500/X500Name;->getInstance(Ljava/lang/Object;)Lcom/android/org/bouncycastle/asn1/x500/X500Name;

    #@f
    move-result-object v1

    #@10
    invoke-direct {v0, v1}, Lcom/android/org/bouncycastle/jce/X509Principal;-><init>(Lcom/android/org/bouncycastle/asn1/x500/X500Name;)V

    #@13
    return-object v0
.end method

.method public getIssuerX500Principal()Ljavax/security/auth/x500/X500Principal;
    .locals 3

    #@0
    .prologue
    .line 253
    :try_start_0
    new-instance v1, Ljavax/security/auth/x500/X500Principal;

    #@2
    iget-object v2, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->c:Lcom/android/org/bouncycastle/asn1/x509/CertificateList;

    #@4
    invoke-virtual {v2}, Lcom/android/org/bouncycastle/asn1/x509/CertificateList;->getIssuer()Lcom/android/org/bouncycastle/asn1/x500/X500Name;

    #@7
    move-result-object v2

    #@8
    invoke-virtual {v2}, Lcom/android/org/bouncycastle/asn1/x500/X500Name;->getEncoded()[B

    #@b
    move-result-object v2

    #@c
    invoke-direct {v1, v2}, Ljavax/security/auth/x500/X500Principal;-><init>([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    #@f
    return-object v1

    #@10
    .line 256
    :catch_0
    move-exception v0

    #@11
    .line 257
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalStateException;

    #@13
    const-string/jumbo v2, "can\'t encode issuer DN"

    #@16
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    #@19
    throw v1
.end method

.method public getNextUpdate()Ljava/util/Date;
    .locals 2

    #@0
    .prologue
    const/4 v1, 0x0

    #@1
    .line 268
    iget-object v0, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->c:Lcom/android/org/bouncycastle/asn1/x509/CertificateList;

    #@3
    invoke-virtual {v0}, Lcom/android/org/bouncycastle/asn1/x509/CertificateList;->getNextUpdate()Lcom/android/org/bouncycastle/asn1/x509/Time;

    #@6
    move-result-object v0

    #@7
    if-eqz v0, :cond_0

    #@9
    .line 270
    iget-object v0, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->c:Lcom/android/org/bouncycastle/asn1/x509/CertificateList;

    #@b
    invoke-virtual {v0}, Lcom/android/org/bouncycastle/asn1/x509/CertificateList;->getNextUpdate()Lcom/android/org/bouncycastle/asn1/x509/Time;

    #@e
    move-result-object v0

    #@f
    invoke-virtual {v0}, Lcom/android/org/bouncycastle/asn1/x509/Time;->getDate()Ljava/util/Date;

    #@12
    move-result-object v0

    #@13
    return-object v0

    #@14
    .line 273
    :cond_0
    return-object v1
.end method

.method public getNonCriticalExtensionOIDs()Ljava/util/Set;
    .locals 1

    #@0
    .prologue
    .line 163
    const/4 v0, 0x0

    #@1
    invoke-direct {p0, v0}, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->getExtensionOIDs(Z)Ljava/util/Set;

    #@4
    move-result-object v0

    #@5
    return-object v0
.end method

.method public getRevokedCertificate(Ljava/math/BigInteger;)Ljava/security/cert/X509CRLEntry;
    .locals 7
    .param p1, "serialNumber"    # Ljava/math/BigInteger;

    #@0
    .prologue
    const/4 v6, 0x0

    #@1
    .line 303
    iget-object v4, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->c:Lcom/android/org/bouncycastle/asn1/x509/CertificateList;

    #@3
    invoke-virtual {v4}, Lcom/android/org/bouncycastle/asn1/x509/CertificateList;->getRevokedCertificateEnumeration()Ljava/util/Enumeration;

    #@6
    move-result-object v0

    #@7
    .line 305
    .local v0, "certs":Ljava/util/Enumeration;
    const/4 v3, 0x0

    #@8
    .line 306
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    #@b
    move-result v4

    #@c
    if-eqz v4, :cond_2

    #@e
    .line 308
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    #@11
    move-result-object v2

    #@12
    check-cast v2, Lcom/android/org/bouncycastle/asn1/x509/TBSCertList$CRLEntry;

    #@14
    .line 310
    .local v2, "entry":Lcom/android/org/bouncycastle/asn1/x509/TBSCertList$CRLEntry;
    invoke-virtual {v2}, Lcom/android/org/bouncycastle/asn1/x509/TBSCertList$CRLEntry;->getUserCertificate()Lcom/android/org/bouncycastle/asn1/ASN1Integer;

    #@17
    move-result-object v4

    #@18
    invoke-virtual {v4}, Lcom/android/org/bouncycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    #@1b
    move-result-object v4

    #@1c
    invoke-virtual {p1, v4}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    #@1f
    move-result v4

    #@20
    if-eqz v4, :cond_1

    #@22
    .line 312
    new-instance v4, Lcom/android/org/bouncycastle/jce/provider/X509CRLEntryObject;

    #@24
    iget-boolean v5, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->isIndirect:Z

    #@26
    invoke-direct {v4, v2, v5, v3}, Lcom/android/org/bouncycastle/jce/provider/X509CRLEntryObject;-><init>(Lcom/android/org/bouncycastle/asn1/x509/TBSCertList$CRLEntry;ZLcom/android/org/bouncycastle/asn1/x500/X500Name;)V

    #@29
    return-object v4

    #@2a
    .line 315
    :cond_1
    iget-boolean v4, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->isIndirect:Z

    #@2c
    if-eqz v4, :cond_0

    #@2e
    invoke-virtual {v2}, Lcom/android/org/bouncycastle/asn1/x509/TBSCertList$CRLEntry;->hasExtensions()Z

    #@31
    move-result v4

    #@32
    if-eqz v4, :cond_0

    #@34
    .line 317
    invoke-virtual {v2}, Lcom/android/org/bouncycastle/asn1/x509/TBSCertList$CRLEntry;->getExtensions()Lcom/android/org/bouncycastle/asn1/x509/Extensions;

    #@37
    move-result-object v4

    #@38
    sget-object v5, Lcom/android/org/bouncycastle/asn1/x509/Extension;->certificateIssuer:Lcom/android/org/bouncycastle/asn1/ASN1ObjectIdentifier;

    #@3a
    invoke-virtual {v4, v5}, Lcom/android/org/bouncycastle/asn1/x509/Extensions;->getExtension(Lcom/android/org/bouncycastle/asn1/ASN1ObjectIdentifier;)Lcom/android/org/bouncycastle/asn1/x509/Extension;

    #@3d
    move-result-object v1

    #@3e
    .line 319
    .local v1, "currentCaName":Lcom/android/org/bouncycastle/asn1/x509/Extension;
    if-eqz v1, :cond_0

    #@40
    .line 321
    invoke-virtual {v1}, Lcom/android/org/bouncycastle/asn1/x509/Extension;->getParsedValue()Lcom/android/org/bouncycastle/asn1/ASN1Encodable;

    #@43
    move-result-object v4

    #@44
    invoke-static {v4}, Lcom/android/org/bouncycastle/asn1/x509/GeneralNames;->getInstance(Ljava/lang/Object;)Lcom/android/org/bouncycastle/asn1/x509/GeneralNames;

    #@47
    move-result-object v4

    #@48
    invoke-virtual {v4}, Lcom/android/org/bouncycastle/asn1/x509/GeneralNames;->getNames()[Lcom/android/org/bouncycastle/asn1/x509/GeneralName;

    #@4b
    move-result-object v4

    #@4c
    const/4 v5, 0x0

    #@4d
    aget-object v4, v4, v5

    #@4f
    invoke-virtual {v4}, Lcom/android/org/bouncycastle/asn1/x509/GeneralName;->getName()Lcom/android/org/bouncycastle/asn1/ASN1Encodable;

    #@52
    move-result-object v4

    #@53
    invoke-static {v4}, Lcom/android/org/bouncycastle/asn1/x500/X500Name;->getInstance(Ljava/lang/Object;)Lcom/android/org/bouncycastle/asn1/x500/X500Name;

    #@56
    move-result-object v3

    #@57
    .local v3, "previousCertificateIssuer":Lcom/android/org/bouncycastle/asn1/x500/X500Name;
    goto :goto_0

    #@58
    .line 326
    .end local v1    # "currentCaName":Lcom/android/org/bouncycastle/asn1/x509/Extension;
    .end local v2    # "entry":Lcom/android/org/bouncycastle/asn1/x509/TBSCertList$CRLEntry;
    .end local v3    # "previousCertificateIssuer":Lcom/android/org/bouncycastle/asn1/x500/X500Name;
    :cond_2
    return-object v6
.end method

.method public getRevokedCertificates()Ljava/util/Set;
    .locals 2

    #@0
    .prologue
    .line 331
    invoke-direct {p0}, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->loadCRLEntries()Ljava/util/Set;

    #@3
    move-result-object v0

    #@4
    .line 333
    .local v0, "entrySet":Ljava/util/Set;
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    #@7
    move-result v1

    #@8
    if-nez v1, :cond_0

    #@a
    .line 335
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    #@d
    move-result-object v1

    #@e
    return-object v1

    #@f
    .line 338
    :cond_0
    const/4 v1, 0x0

    #@10
    return-object v1
.end method

.method public getSigAlgName()Ljava/lang/String;
    .locals 1

    #@0
    .prologue
    .line 361
    iget-object v0, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->sigAlgName:Ljava/lang/String;

    #@2
    return-object v0
.end method

.method public getSigAlgOID()Ljava/lang/String;
    .locals 1

    #@0
    .prologue
    .line 366
    iget-object v0, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->c:Lcom/android/org/bouncycastle/asn1/x509/CertificateList;

    #@2
    invoke-virtual {v0}, Lcom/android/org/bouncycastle/asn1/x509/CertificateList;->getSignatureAlgorithm()Lcom/android/org/bouncycastle/asn1/x509/AlgorithmIdentifier;

    #@5
    move-result-object v0

    #@6
    invoke-virtual {v0}, Lcom/android/org/bouncycastle/asn1/x509/AlgorithmIdentifier;->getAlgorithm()Lcom/android/org/bouncycastle/asn1/ASN1ObjectIdentifier;

    #@9
    move-result-object v0

    #@a
    invoke-virtual {v0}, Lcom/android/org/bouncycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    #@d
    move-result-object v0

    #@e
    return-object v0
.end method

.method public getSigAlgParams()[B
    .locals 4

    #@0
    .prologue
    const/4 v2, 0x0

    #@1
    const/4 v3, 0x0

    #@2
    .line 371
    iget-object v1, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->sigAlgParams:[B

    #@4
    if-eqz v1, :cond_0

    #@6
    .line 373
    iget-object v1, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->sigAlgParams:[B

    #@8
    array-length v1, v1

    #@9
    new-array v0, v1, [B

    #@b
    .line 375
    .local v0, "tmp":[B
    iget-object v1, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->sigAlgParams:[B

    #@d
    array-length v2, v0

    #@e
    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy([BI[BII)V

    #@11
    .line 377
    return-object v0

    #@12
    .line 380
    .end local v0    # "tmp":[B
    :cond_0
    return-object v2
.end method

.method public getSignature()[B
    .locals 1

    #@0
    .prologue
    .line 356
    iget-object v0, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->c:Lcom/android/org/bouncycastle/asn1/x509/CertificateList;

    #@2
    invoke-virtual {v0}, Lcom/android/org/bouncycastle/asn1/x509/CertificateList;->getSignature()Lcom/android/org/bouncycastle/asn1/DERBitString;

    #@5
    move-result-object v0

    #@6
    invoke-virtual {v0}, Lcom/android/org/bouncycastle/asn1/DERBitString;->getBytes()[B

    #@9
    move-result-object v0

    #@a
    return-object v0
.end method

.method public getTBSCertList()[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CRLException;
        }
    .end annotation

    #@0
    .prologue
    .line 346
    :try_start_0
    iget-object v1, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->c:Lcom/android/org/bouncycastle/asn1/x509/CertificateList;

    #@2
    invoke-virtual {v1}, Lcom/android/org/bouncycastle/asn1/x509/CertificateList;->getTBSCertList()Lcom/android/org/bouncycastle/asn1/x509/TBSCertList;

    #@5
    move-result-object v1

    #@6
    const-string/jumbo v2, "DER"

    #@9
    invoke-virtual {v1, v2}, Lcom/android/org/bouncycastle/asn1/x509/TBSCertList;->getEncoded(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    #@c
    move-result-object v1

    #@d
    return-object v1

    #@e
    .line 349
    :catch_0
    move-exception v0

    #@f
    .line 350
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/security/cert/CRLException;

    #@11
    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    #@14
    move-result-object v2

    #@15
    invoke-direct {v1, v2}, Ljava/security/cert/CRLException;-><init>(Ljava/lang/String;)V

    #@18
    throw v1
.end method

.method public getThisUpdate()Ljava/util/Date;
    .locals 1

    #@0
    .prologue
    .line 263
    iget-object v0, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->c:Lcom/android/org/bouncycastle/asn1/x509/CertificateList;

    #@2
    invoke-virtual {v0}, Lcom/android/org/bouncycastle/asn1/x509/CertificateList;->getThisUpdate()Lcom/android/org/bouncycastle/asn1/x509/Time;

    #@5
    move-result-object v0

    #@6
    invoke-virtual {v0}, Lcom/android/org/bouncycastle/asn1/x509/Time;->getDate()Ljava/util/Date;

    #@9
    move-result-object v0

    #@a
    return-object v0
.end method

.method public getVersion()I
    .locals 1

    #@0
    .prologue
    .line 241
    iget-object v0, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->c:Lcom/android/org/bouncycastle/asn1/x509/CertificateList;

    #@2
    invoke-virtual {v0}, Lcom/android/org/bouncycastle/asn1/x509/CertificateList;->getVersionNumber()I

    #@5
    move-result v0

    #@6
    return v0
.end method

.method public hasUnsupportedCriticalExtension()Z
    .locals 3

    #@0
    .prologue
    const/4 v1, 0x0

    #@1
    .line 114
    invoke-virtual {p0}, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->getCriticalExtensionOIDs()Ljava/util/Set;

    #@4
    move-result-object v0

    #@5
    .line 116
    .local v0, "extns":Ljava/util/Set;
    if-nez v0, :cond_0

    #@7
    .line 118
    return v1

    #@8
    .line 121
    :cond_0
    sget-object v2, Lcom/android/org/bouncycastle/jce/provider/RFC3280CertPathUtilities;->ISSUING_DISTRIBUTION_POINT:Ljava/lang/String;

    #@a
    invoke-interface {v0, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    #@d
    .line 122
    sget-object v2, Lcom/android/org/bouncycastle/jce/provider/RFC3280CertPathUtilities;->DELTA_CRL_INDICATOR:Ljava/lang/String;

    #@f
    invoke-interface {v0, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    #@12
    .line 124
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    #@15
    move-result v2

    #@16
    if-eqz v2, :cond_1

    #@18
    :goto_0
    return v1

    #@19
    :cond_1
    const/4 v1, 0x1

    #@1a
    goto :goto_0
.end method

.method public hashCode()I
    .locals 1

    #@0
    .prologue
    .line 616
    iget-boolean v0, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->isHashCodeSet:Z

    #@2
    if-nez v0, :cond_0

    #@4
    .line 618
    const/4 v0, 0x1

    #@5
    iput-boolean v0, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->isHashCodeSet:Z

    #@7
    .line 619
    invoke-super {p0}, Ljava/security/cert/X509CRL;->hashCode()I

    #@a
    move-result v0

    #@b
    iput v0, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->hashCodeValue:I

    #@d
    .line 622
    :cond_0
    iget v0, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->hashCodeValue:I

    #@f
    return v0
.end method

.method public isRevoked(Ljava/security/cert/Certificate;)Z
    .locals 10
    .param p1, "cert"    # Ljava/security/cert/Certificate;

    #@0
    .prologue
    const/4 v9, 0x0

    #@1
    .line 520
    invoke-virtual {p1}, Ljava/security/cert/Certificate;->getType()Ljava/lang/String;

    #@4
    move-result-object v7

    #@5
    const-string/jumbo v8, "X.509"

    #@8
    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    #@b
    move-result v7

    #@c
    if-nez v7, :cond_0

    #@e
    .line 522
    new-instance v7, Ljava/lang/RuntimeException;

    #@10
    const-string/jumbo v8, "X.509 CRL used with non X.509 Cert"

    #@13
    invoke-direct {v7, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    #@16
    throw v7

    #@17
    .line 525
    :cond_0
    iget-object v7, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->c:Lcom/android/org/bouncycastle/asn1/x509/CertificateList;

    #@19
    invoke-virtual {v7}, Lcom/android/org/bouncycastle/asn1/x509/CertificateList;->getRevokedCertificateEnumeration()Ljava/util/Enumeration;

    #@1c
    move-result-object v1

    #@1d
    .line 527
    .local v1, "certs":Ljava/util/Enumeration;
    iget-object v7, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->c:Lcom/android/org/bouncycastle/asn1/x509/CertificateList;

    #@1f
    invoke-virtual {v7}, Lcom/android/org/bouncycastle/asn1/x509/CertificateList;->getIssuer()Lcom/android/org/bouncycastle/asn1/x500/X500Name;

    #@22
    move-result-object v0

    #@23
    .line 529
    .local v0, "caName":Lcom/android/org/bouncycastle/asn1/x500/X500Name;
    if-eqz v1, :cond_5

    #@25
    move-object v7, p1

    #@26
    .line 531
    check-cast v7, Ljava/security/cert/X509Certificate;

    #@28
    invoke-virtual {v7}, Ljava/security/cert/X509Certificate;->getSerialNumber()Ljava/math/BigInteger;

    #@2b
    move-result-object v6

    #@2c
    .line 533
    .local v6, "serial":Ljava/math/BigInteger;
    :cond_1
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    #@2f
    move-result v7

    #@30
    if-eqz v7, :cond_5

    #@32
    .line 535
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    #@35
    move-result-object v7

    #@36
    invoke-static {v7}, Lcom/android/org/bouncycastle/asn1/x509/TBSCertList$CRLEntry;->getInstance(Ljava/lang/Object;)Lcom/android/org/bouncycastle/asn1/x509/TBSCertList$CRLEntry;

    #@39
    move-result-object v4

    #@3a
    .line 537
    .local v4, "entry":Lcom/android/org/bouncycastle/asn1/x509/TBSCertList$CRLEntry;
    iget-boolean v7, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->isIndirect:Z

    #@3c
    if-eqz v7, :cond_2

    #@3e
    invoke-virtual {v4}, Lcom/android/org/bouncycastle/asn1/x509/TBSCertList$CRLEntry;->hasExtensions()Z

    #@41
    move-result v7

    #@42
    if-eqz v7, :cond_2

    #@44
    .line 539
    invoke-virtual {v4}, Lcom/android/org/bouncycastle/asn1/x509/TBSCertList$CRLEntry;->getExtensions()Lcom/android/org/bouncycastle/asn1/x509/Extensions;

    #@47
    move-result-object v7

    #@48
    sget-object v8, Lcom/android/org/bouncycastle/asn1/x509/Extension;->certificateIssuer:Lcom/android/org/bouncycastle/asn1/ASN1ObjectIdentifier;

    #@4a
    invoke-virtual {v7, v8}, Lcom/android/org/bouncycastle/asn1/x509/Extensions;->getExtension(Lcom/android/org/bouncycastle/asn1/ASN1ObjectIdentifier;)Lcom/android/org/bouncycastle/asn1/x509/Extension;

    #@4d
    move-result-object v2

    #@4e
    .line 541
    .local v2, "currentCaName":Lcom/android/org/bouncycastle/asn1/x509/Extension;
    if-eqz v2, :cond_2

    #@50
    .line 543
    invoke-virtual {v2}, Lcom/android/org/bouncycastle/asn1/x509/Extension;->getParsedValue()Lcom/android/org/bouncycastle/asn1/ASN1Encodable;

    #@53
    move-result-object v7

    #@54
    invoke-static {v7}, Lcom/android/org/bouncycastle/asn1/x509/GeneralNames;->getInstance(Ljava/lang/Object;)Lcom/android/org/bouncycastle/asn1/x509/GeneralNames;

    #@57
    move-result-object v7

    #@58
    invoke-virtual {v7}, Lcom/android/org/bouncycastle/asn1/x509/GeneralNames;->getNames()[Lcom/android/org/bouncycastle/asn1/x509/GeneralName;

    #@5b
    move-result-object v7

    #@5c
    aget-object v7, v7, v9

    #@5e
    invoke-virtual {v7}, Lcom/android/org/bouncycastle/asn1/x509/GeneralName;->getName()Lcom/android/org/bouncycastle/asn1/ASN1Encodable;

    #@61
    move-result-object v7

    #@62
    invoke-static {v7}, Lcom/android/org/bouncycastle/asn1/x500/X500Name;->getInstance(Ljava/lang/Object;)Lcom/android/org/bouncycastle/asn1/x500/X500Name;

    #@65
    move-result-object v0

    #@66
    .line 547
    .end local v2    # "currentCaName":Lcom/android/org/bouncycastle/asn1/x509/Extension;
    :cond_2
    invoke-virtual {v4}, Lcom/android/org/bouncycastle/asn1/x509/TBSCertList$CRLEntry;->getUserCertificate()Lcom/android/org/bouncycastle/asn1/ASN1Integer;

    #@69
    move-result-object v7

    #@6a
    invoke-virtual {v7}, Lcom/android/org/bouncycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    #@6d
    move-result-object v7

    #@6e
    invoke-virtual {v7, v6}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    #@71
    move-result v7

    #@72
    if-eqz v7, :cond_1

    #@74
    .line 551
    instance-of v7, p1, Ljava/security/cert/X509Certificate;

    #@76
    if-eqz v7, :cond_3

    #@78
    .line 553
    check-cast p1, Ljava/security/cert/X509Certificate;

    #@7a
    .end local p1    # "cert":Ljava/security/cert/Certificate;
    invoke-virtual {p1}, Ljava/security/cert/X509Certificate;->getIssuerX500Principal()Ljavax/security/auth/x500/X500Principal;

    #@7d
    move-result-object v7

    #@7e
    invoke-virtual {v7}, Ljavax/security/auth/x500/X500Principal;->getEncoded()[B

    #@81
    move-result-object v7

    #@82
    invoke-static {v7}, Lcom/android/org/bouncycastle/asn1/x500/X500Name;->getInstance(Ljava/lang/Object;)Lcom/android/org/bouncycastle/asn1/x500/X500Name;

    #@85
    move-result-object v5

    #@86
    .line 567
    .local v5, "issuer":Lcom/android/org/bouncycastle/asn1/x500/X500Name;
    :goto_0
    invoke-virtual {v0, v5}, Lcom/android/org/bouncycastle/asn1/x500/X500Name;->equals(Ljava/lang/Object;)Z

    #@89
    move-result v7

    #@8a
    if-nez v7, :cond_4

    #@8c
    .line 569
    return v9

    #@8d
    .line 559
    .end local v5    # "issuer":Lcom/android/org/bouncycastle/asn1/x500/X500Name;
    .restart local p1    # "cert":Ljava/security/cert/Certificate;
    :cond_3
    :try_start_0
    invoke-virtual {p1}, Ljava/security/cert/Certificate;->getEncoded()[B

    #@90
    move-result-object v7

    #@91
    invoke-static {v7}, Lcom/android/org/bouncycastle/asn1/x509/Certificate;->getInstance(Ljava/lang/Object;)Lcom/android/org/bouncycastle/asn1/x509/Certificate;

    #@94
    move-result-object v7

    #@95
    invoke-virtual {v7}, Lcom/android/org/bouncycastle/asn1/x509/Certificate;->getIssuer()Lcom/android/org/bouncycastle/asn1/x500/X500Name;
    :try_end_0
    .catch Ljava/security/cert/CertificateEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    #@98
    move-result-object v5

    #@99
    .restart local v5    # "issuer":Lcom/android/org/bouncycastle/asn1/x500/X500Name;
    goto :goto_0

    #@9a
    .line 562
    .end local v5    # "issuer":Lcom/android/org/bouncycastle/asn1/x500/X500Name;
    :catch_0
    move-exception v3

    #@9b
    .line 563
    .local v3, "e":Ljava/security/cert/CertificateEncodingException;
    new-instance v7, Ljava/lang/RuntimeException;

    #@9d
    const-string/jumbo v8, "Cannot process certificate"

    #@a0
    invoke-direct {v7, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    #@a3
    throw v7

    #@a4
    .line 572
    .end local v3    # "e":Ljava/security/cert/CertificateEncodingException;
    .end local p1    # "cert":Ljava/security/cert/Certificate;
    .restart local v5    # "issuer":Lcom/android/org/bouncycastle/asn1/x500/X500Name;
    :cond_4
    const/4 v7, 0x1

    #@a5
    return v7

    #@a6
    .line 577
    .end local v4    # "entry":Lcom/android/org/bouncycastle/asn1/x509/TBSCertList$CRLEntry;
    .end local v5    # "issuer":Lcom/android/org/bouncycastle/asn1/x500/X500Name;
    .end local v6    # "serial":Ljava/math/BigInteger;
    .restart local p1    # "cert":Ljava/security/cert/Certificate;
    :cond_5
    return v9
.end method

.method public toString()Ljava/lang/String;
    .locals 19

    #@0
    .prologue
    .line 390
    new-instance v2, Ljava/lang/StringBuffer;

    #@2
    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    #@5
    .line 391
    .local v2, "buf":Ljava/lang/StringBuffer;
    const-string/jumbo v15, "line.separator"

    #@8
    invoke-static {v15}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    #@b
    move-result-object v10

    #@c
    .line 393
    .local v10, "nl":Ljava/lang/String;
    const-string/jumbo v15, "              Version: "

    #@f
    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@12
    move-result-object v15

    #@13
    invoke-virtual/range {p0 .. p0}, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->getVersion()I

    #@16
    move-result v16

    #@17
    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    #@1a
    move-result-object v15

    #@1b
    invoke-virtual {v15, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@1e
    .line 395
    const-string/jumbo v15, "             IssuerDN: "

    #@21
    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@24
    move-result-object v15

    #@25
    invoke-virtual/range {p0 .. p0}, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->getIssuerDN()Ljava/security/Principal;

    #@28
    move-result-object v16

    #@29
    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    #@2c
    move-result-object v15

    #@2d
    invoke-virtual {v15, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@30
    .line 397
    const-string/jumbo v15, "          This update: "

    #@33
    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@36
    move-result-object v15

    #@37
    invoke-virtual/range {p0 .. p0}, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->getThisUpdate()Ljava/util/Date;

    #@3a
    move-result-object v16

    #@3b
    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    #@3e
    move-result-object v15

    #@3f
    invoke-virtual {v15, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@42
    .line 399
    const-string/jumbo v15, "          Next update: "

    #@45
    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@48
    move-result-object v15

    #@49
    invoke-virtual/range {p0 .. p0}, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->getNextUpdate()Ljava/util/Date;

    #@4c
    move-result-object v16

    #@4d
    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    #@50
    move-result-object v15

    #@51
    invoke-virtual {v15, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@54
    .line 401
    const-string/jumbo v15, "  Signature Algorithm: "

    #@57
    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@5a
    move-result-object v15

    #@5b
    invoke-virtual/range {p0 .. p0}, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->getSigAlgName()Ljava/lang/String;

    #@5e
    move-result-object v16

    #@5f
    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@62
    move-result-object v15

    #@63
    invoke-virtual {v15, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@66
    .line 404
    invoke-virtual/range {p0 .. p0}, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->getSignature()[B

    #@69
    move-result-object v14

    #@6a
    .line 406
    .local v14, "sig":[B
    const-string/jumbo v15, "            Signature: "

    #@6d
    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@70
    move-result-object v15

    #@71
    .line 407
    new-instance v16, Ljava/lang/String;

    #@73
    const/16 v17, 0x0

    #@75
    const/16 v18, 0x14

    #@77
    move/from16 v0, v17

    #@79
    move/from16 v1, v18

    #@7b
    invoke-static {v14, v0, v1}, Lcom/android/org/bouncycastle/util/encoders/Hex;->encode([BII)[B

    #@7e
    move-result-object v17

    #@7f
    invoke-direct/range {v16 .. v17}, Ljava/lang/String;-><init>([B)V

    #@82
    .line 406
    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@85
    move-result-object v15

    #@86
    invoke-virtual {v15, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@89
    .line 408
    const/16 v8, 0x14

    #@8b
    .local v8, "i":I
    :goto_0
    array-length v15, v14

    #@8c
    if-ge v8, v15, :cond_1

    #@8e
    .line 410
    array-length v15, v14

    #@8f
    add-int/lit8 v15, v15, -0x14

    #@91
    if-ge v8, v15, :cond_0

    #@93
    .line 412
    const-string/jumbo v15, "                       "

    #@96
    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@99
    move-result-object v15

    #@9a
    .line 413
    new-instance v16, Ljava/lang/String;

    #@9c
    const/16 v17, 0x14

    #@9e
    move/from16 v0, v17

    #@a0
    invoke-static {v14, v8, v0}, Lcom/android/org/bouncycastle/util/encoders/Hex;->encode([BII)[B

    #@a3
    move-result-object v17

    #@a4
    invoke-direct/range {v16 .. v17}, Ljava/lang/String;-><init>([B)V

    #@a7
    .line 412
    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@aa
    move-result-object v15

    #@ab
    invoke-virtual {v15, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@ae
    .line 408
    :goto_1
    add-int/lit8 v8, v8, 0x14

    #@b0
    goto :goto_0

    #@b1
    .line 417
    :cond_0
    const-string/jumbo v15, "                       "

    #@b4
    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@b7
    move-result-object v15

    #@b8
    .line 418
    new-instance v16, Ljava/lang/String;

    #@ba
    array-length v0, v14

    #@bb
    move/from16 v17, v0

    #@bd
    sub-int v17, v17, v8

    #@bf
    move/from16 v0, v17

    #@c1
    invoke-static {v14, v8, v0}, Lcom/android/org/bouncycastle/util/encoders/Hex;->encode([BII)[B

    #@c4
    move-result-object v17

    #@c5
    invoke-direct/range {v16 .. v17}, Ljava/lang/String;-><init>([B)V

    #@c8
    .line 417
    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@cb
    move-result-object v15

    #@cc
    invoke-virtual {v15, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@cf
    goto :goto_1

    #@d0
    .line 422
    :cond_1
    move-object/from16 v0, p0

    #@d2
    iget-object v15, v0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->c:Lcom/android/org/bouncycastle/asn1/x509/CertificateList;

    #@d4
    invoke-virtual {v15}, Lcom/android/org/bouncycastle/asn1/x509/CertificateList;->getTBSCertList()Lcom/android/org/bouncycastle/asn1/x509/TBSCertList;

    #@d7
    move-result-object v15

    #@d8
    invoke-virtual {v15}, Lcom/android/org/bouncycastle/asn1/x509/TBSCertList;->getExtensions()Lcom/android/org/bouncycastle/asn1/x509/Extensions;

    #@db
    move-result-object v7

    #@dc
    .line 424
    .local v7, "extensions":Lcom/android/org/bouncycastle/asn1/x509/Extensions;
    if-eqz v7, :cond_9

    #@de
    .line 426
    invoke-virtual {v7}, Lcom/android/org/bouncycastle/asn1/x509/Extensions;->oids()Ljava/util/Enumeration;

    #@e1
    move-result-object v4

    #@e2
    .line 428
    .local v4, "e":Ljava/util/Enumeration;
    invoke-interface {v4}, Ljava/util/Enumeration;->hasMoreElements()Z

    #@e5
    move-result v15

    #@e6
    if-eqz v15, :cond_2

    #@e8
    .line 430
    const-string/jumbo v15, "           Extensions: "

    #@eb
    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@ee
    move-result-object v15

    #@ef
    invoke-virtual {v15, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@f2
    .line 433
    :cond_2
    :goto_2
    invoke-interface {v4}, Ljava/util/Enumeration;->hasMoreElements()Z

    #@f5
    move-result v15

    #@f6
    if-eqz v15, :cond_9

    #@f8
    .line 435
    invoke-interface {v4}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    #@fb
    move-result-object v12

    #@fc
    check-cast v12, Lcom/android/org/bouncycastle/asn1/ASN1ObjectIdentifier;

    #@fe
    .line 436
    .local v12, "oid":Lcom/android/org/bouncycastle/asn1/ASN1ObjectIdentifier;
    invoke-virtual {v7, v12}, Lcom/android/org/bouncycastle/asn1/x509/Extensions;->getExtension(Lcom/android/org/bouncycastle/asn1/ASN1ObjectIdentifier;)Lcom/android/org/bouncycastle/asn1/x509/Extension;

    #@101
    move-result-object v6

    #@102
    .line 438
    .local v6, "ext":Lcom/android/org/bouncycastle/asn1/x509/Extension;
    invoke-virtual {v6}, Lcom/android/org/bouncycastle/asn1/x509/Extension;->getExtnValue()Lcom/android/org/bouncycastle/asn1/ASN1OctetString;

    #@105
    move-result-object v15

    #@106
    if-eqz v15, :cond_8

    #@108
    .line 440
    invoke-virtual {v6}, Lcom/android/org/bouncycastle/asn1/x509/Extension;->getExtnValue()Lcom/android/org/bouncycastle/asn1/ASN1OctetString;

    #@10b
    move-result-object v15

    #@10c
    invoke-virtual {v15}, Lcom/android/org/bouncycastle/asn1/ASN1OctetString;->getOctets()[B

    #@10f
    move-result-object v11

    #@110
    .line 441
    .local v11, "octs":[B
    new-instance v3, Lcom/android/org/bouncycastle/asn1/ASN1InputStream;

    #@112
    invoke-direct {v3, v11}, Lcom/android/org/bouncycastle/asn1/ASN1InputStream;-><init>([B)V

    #@115
    .line 442
    .local v3, "dIn":Lcom/android/org/bouncycastle/asn1/ASN1InputStream;
    const-string/jumbo v15, "                       critical("

    #@118
    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@11b
    move-result-object v15

    #@11c
    .line 443
    invoke-virtual {v6}, Lcom/android/org/bouncycastle/asn1/x509/Extension;->isCritical()Z

    #@11f
    move-result v16

    #@120
    .line 442
    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    #@123
    move-result-object v15

    #@124
    .line 443
    const-string/jumbo v16, ") "

    #@127
    .line 442
    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@12a
    .line 446
    :try_start_0
    sget-object v15, Lcom/android/org/bouncycastle/asn1/x509/Extension;->cRLNumber:Lcom/android/org/bouncycastle/asn1/ASN1ObjectIdentifier;

    #@12c
    invoke-virtual {v12, v15}, Lcom/android/org/bouncycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    #@12f
    move-result v15

    #@130
    if-eqz v15, :cond_3

    #@132
    .line 449
    new-instance v15, Lcom/android/org/bouncycastle/asn1/x509/CRLNumber;

    #@134
    .line 450
    invoke-virtual {v3}, Lcom/android/org/bouncycastle/asn1/ASN1InputStream;->readObject()Lcom/android/org/bouncycastle/asn1/ASN1Primitive;

    #@137
    move-result-object v16

    #@138
    .line 449
    invoke-static/range {v16 .. v16}, Lcom/android/org/bouncycastle/asn1/ASN1Integer;->getInstance(Ljava/lang/Object;)Lcom/android/org/bouncycastle/asn1/ASN1Integer;

    #@13b
    move-result-object v16

    #@13c
    invoke-virtual/range {v16 .. v16}, Lcom/android/org/bouncycastle/asn1/ASN1Integer;->getPositiveValue()Ljava/math/BigInteger;

    #@13f
    move-result-object v16

    #@140
    invoke-direct/range {v15 .. v16}, Lcom/android/org/bouncycastle/asn1/x509/CRLNumber;-><init>(Ljava/math/BigInteger;)V

    #@143
    .line 448
    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    #@146
    move-result-object v15

    #@147
    invoke-virtual {v15, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    #@14a
    goto :goto_2

    #@14b
    .line 487
    :catch_0
    move-exception v5

    #@14c
    .line 488
    .local v5, "ex":Ljava/lang/Exception;
    invoke-virtual {v12}, Lcom/android/org/bouncycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    #@14f
    move-result-object v15

    #@150
    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@153
    .line 489
    const-string/jumbo v15, " value = "

    #@156
    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@159
    move-result-object v15

    #@15a
    const-string/jumbo v16, "*****"

    #@15d
    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@160
    move-result-object v15

    #@161
    invoke-virtual {v15, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@164
    goto :goto_2

    #@165
    .line 453
    .end local v5    # "ex":Ljava/lang/Exception;
    :cond_3
    :try_start_1
    sget-object v15, Lcom/android/org/bouncycastle/asn1/x509/Extension;->deltaCRLIndicator:Lcom/android/org/bouncycastle/asn1/ASN1ObjectIdentifier;

    #@167
    invoke-virtual {v12, v15}, Lcom/android/org/bouncycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    #@16a
    move-result v15

    #@16b
    if-eqz v15, :cond_4

    #@16d
    .line 456
    new-instance v15, Ljava/lang/StringBuilder;

    #@16f
    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    #@172
    const-string/jumbo v16, "Base CRL: "

    #@175
    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    #@178
    move-result-object v15

    #@179
    .line 457
    new-instance v16, Lcom/android/org/bouncycastle/asn1/x509/CRLNumber;

    #@17b
    .line 458
    invoke-virtual {v3}, Lcom/android/org/bouncycastle/asn1/ASN1InputStream;->readObject()Lcom/android/org/bouncycastle/asn1/ASN1Primitive;

    #@17e
    move-result-object v17

    #@17f
    .line 457
    invoke-static/range {v17 .. v17}, Lcom/android/org/bouncycastle/asn1/ASN1Integer;->getInstance(Ljava/lang/Object;)Lcom/android/org/bouncycastle/asn1/ASN1Integer;

    #@182
    move-result-object v17

    #@183
    invoke-virtual/range {v17 .. v17}, Lcom/android/org/bouncycastle/asn1/ASN1Integer;->getPositiveValue()Ljava/math/BigInteger;

    #@186
    move-result-object v17

    #@187
    invoke-direct/range {v16 .. v17}, Lcom/android/org/bouncycastle/asn1/x509/CRLNumber;-><init>(Ljava/math/BigInteger;)V

    #@18a
    .line 456
    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    #@18d
    move-result-object v15

    #@18e
    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    #@191
    move-result-object v15

    #@192
    .line 455
    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@195
    move-result-object v15

    #@196
    invoke-virtual {v15, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@199
    goto/16 :goto_2

    #@19b
    .line 462
    :cond_4
    sget-object v15, Lcom/android/org/bouncycastle/asn1/x509/Extension;->issuingDistributionPoint:Lcom/android/org/bouncycastle/asn1/ASN1ObjectIdentifier;

    #@19d
    .line 461
    invoke-virtual {v12, v15}, Lcom/android/org/bouncycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    #@1a0
    move-result v15

    #@1a1
    if-eqz v15, :cond_5

    #@1a3
    .line 465
    invoke-virtual {v3}, Lcom/android/org/bouncycastle/asn1/ASN1InputStream;->readObject()Lcom/android/org/bouncycastle/asn1/ASN1Primitive;

    #@1a6
    move-result-object v15

    #@1a7
    invoke-static {v15}, Lcom/android/org/bouncycastle/asn1/x509/IssuingDistributionPoint;->getInstance(Ljava/lang/Object;)Lcom/android/org/bouncycastle/asn1/x509/IssuingDistributionPoint;

    #@1aa
    move-result-object v15

    #@1ab
    .line 464
    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    #@1ae
    move-result-object v15

    #@1af
    invoke-virtual {v15, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@1b2
    goto/16 :goto_2

    #@1b4
    .line 468
    :cond_5
    sget-object v15, Lcom/android/org/bouncycastle/asn1/x509/Extension;->cRLDistributionPoints:Lcom/android/org/bouncycastle/asn1/ASN1ObjectIdentifier;

    #@1b6
    .line 467
    invoke-virtual {v12, v15}, Lcom/android/org/bouncycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    #@1b9
    move-result v15

    #@1ba
    if-eqz v15, :cond_6

    #@1bc
    .line 471
    invoke-virtual {v3}, Lcom/android/org/bouncycastle/asn1/ASN1InputStream;->readObject()Lcom/android/org/bouncycastle/asn1/ASN1Primitive;

    #@1bf
    move-result-object v15

    #@1c0
    invoke-static {v15}, Lcom/android/org/bouncycastle/asn1/x509/CRLDistPoint;->getInstance(Ljava/lang/Object;)Lcom/android/org/bouncycastle/asn1/x509/CRLDistPoint;

    #@1c3
    move-result-object v15

    #@1c4
    .line 470
    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    #@1c7
    move-result-object v15

    #@1c8
    invoke-virtual {v15, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@1cb
    goto/16 :goto_2

    #@1cd
    .line 473
    :cond_6
    sget-object v15, Lcom/android/org/bouncycastle/asn1/x509/Extension;->freshestCRL:Lcom/android/org/bouncycastle/asn1/ASN1ObjectIdentifier;

    #@1cf
    invoke-virtual {v12, v15}, Lcom/android/org/bouncycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    #@1d2
    move-result v15

    #@1d3
    if-eqz v15, :cond_7

    #@1d5
    .line 476
    invoke-virtual {v3}, Lcom/android/org/bouncycastle/asn1/ASN1InputStream;->readObject()Lcom/android/org/bouncycastle/asn1/ASN1Primitive;

    #@1d8
    move-result-object v15

    #@1d9
    invoke-static {v15}, Lcom/android/org/bouncycastle/asn1/x509/CRLDistPoint;->getInstance(Ljava/lang/Object;)Lcom/android/org/bouncycastle/asn1/x509/CRLDistPoint;

    #@1dc
    move-result-object v15

    #@1dd
    .line 475
    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    #@1e0
    move-result-object v15

    #@1e1
    invoke-virtual {v15, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@1e4
    goto/16 :goto_2

    #@1e6
    .line 480
    :cond_7
    invoke-virtual {v12}, Lcom/android/org/bouncycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    #@1e9
    move-result-object v15

    #@1ea
    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@1ed
    .line 481
    const-string/jumbo v15, " value = "

    #@1f0
    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@1f3
    move-result-object v15

    #@1f4
    .line 482
    invoke-virtual {v3}, Lcom/android/org/bouncycastle/asn1/ASN1InputStream;->readObject()Lcom/android/org/bouncycastle/asn1/ASN1Primitive;

    #@1f7
    move-result-object v16

    #@1f8
    invoke-static/range {v16 .. v16}, Lcom/android/org/bouncycastle/asn1/util/ASN1Dump;->dumpAsString(Ljava/lang/Object;)Ljava/lang/String;

    #@1fb
    move-result-object v16

    #@1fc
    .line 481
    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@1ff
    move-result-object v15

    #@200
    invoke-virtual {v15, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    #@203
    goto/16 :goto_2

    #@205
    .line 494
    .end local v3    # "dIn":Lcom/android/org/bouncycastle/asn1/ASN1InputStream;
    .end local v11    # "octs":[B
    :cond_8
    invoke-virtual {v2, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@208
    goto/16 :goto_2

    #@20a
    .line 498
    .end local v4    # "e":Ljava/util/Enumeration;
    .end local v6    # "ext":Lcom/android/org/bouncycastle/asn1/x509/Extension;
    .end local v12    # "oid":Lcom/android/org/bouncycastle/asn1/ASN1ObjectIdentifier;
    :cond_9
    invoke-virtual/range {p0 .. p0}, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->getRevokedCertificates()Ljava/util/Set;

    #@20d
    move-result-object v13

    #@20e
    .line 499
    .local v13, "set":Ljava/util/Set;
    if-eqz v13, :cond_a

    #@210
    .line 501
    invoke-interface {v13}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    #@213
    move-result-object v9

    #@214
    .line 502
    .local v9, "it":Ljava/util/Iterator;
    :goto_3
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    #@217
    move-result v15

    #@218
    if-eqz v15, :cond_a

    #@21a
    .line 504
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    #@21d
    move-result-object v15

    #@21e
    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    #@221
    .line 505
    invoke-virtual {v2, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    #@224
    goto :goto_3

    #@225
    .line 508
    .end local v9    # "it":Ljava/util/Iterator;
    :cond_a
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    #@228
    move-result-object v15

    #@229
    return-object v15
.end method

.method public verify(Ljava/security/PublicKey;)V
    .locals 1
    .param p1, "key"    # Ljava/security/PublicKey;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CRLException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/NoSuchProviderException;,
            Ljava/security/SignatureException;
        }
    .end annotation

    #@0
    .prologue
    .line 207
    const-string/jumbo v0, "BC"

    #@3
    invoke-virtual {p0, p1, v0}, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->verify(Ljava/security/PublicKey;Ljava/lang/String;)V

    #@6
    .line 205
    return-void
.end method

.method public verify(Ljava/security/PublicKey;Ljava/lang/String;)V
    .locals 3
    .param p1, "key"    # Ljava/security/PublicKey;
    .param p2, "sigProvider"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CRLException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/NoSuchProviderException;,
            Ljava/security/SignatureException;
        }
    .end annotation

    #@0
    .prologue
    .line 214
    iget-object v1, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->c:Lcom/android/org/bouncycastle/asn1/x509/CertificateList;

    #@2
    invoke-virtual {v1}, Lcom/android/org/bouncycastle/asn1/x509/CertificateList;->getSignatureAlgorithm()Lcom/android/org/bouncycastle/asn1/x509/AlgorithmIdentifier;

    #@5
    move-result-object v1

    #@6
    iget-object v2, p0, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->c:Lcom/android/org/bouncycastle/asn1/x509/CertificateList;

    #@8
    invoke-virtual {v2}, Lcom/android/org/bouncycastle/asn1/x509/CertificateList;->getTBSCertList()Lcom/android/org/bouncycastle/asn1/x509/TBSCertList;

    #@b
    move-result-object v2

    #@c
    invoke-virtual {v2}, Lcom/android/org/bouncycastle/asn1/x509/TBSCertList;->getSignature()Lcom/android/org/bouncycastle/asn1/x509/AlgorithmIdentifier;

    #@f
    move-result-object v2

    #@10
    invoke-virtual {v1, v2}, Lcom/android/org/bouncycastle/asn1/x509/AlgorithmIdentifier;->equals(Ljava/lang/Object;)Z

    #@13
    move-result v1

    #@14
    if-nez v1, :cond_0

    #@16
    .line 216
    new-instance v1, Ljava/security/cert/CRLException;

    #@18
    const-string/jumbo v2, "Signature algorithm on CertificateList does not match TBSCertList."

    #@1b
    invoke-direct {v1, v2}, Ljava/security/cert/CRLException;-><init>(Ljava/lang/String;)V

    #@1e
    throw v1

    #@1f
    .line 221
    :cond_0
    if-eqz p2, :cond_1

    #@21
    .line 223
    invoke-virtual {p0}, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->getSigAlgName()Ljava/lang/String;

    #@24
    move-result-object v1

    #@25
    invoke-static {v1, p2}, Ljava/security/Signature;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljava/security/Signature;

    #@28
    move-result-object v0

    #@29
    .line 230
    .local v0, "sig":Ljava/security/Signature;
    :goto_0
    invoke-virtual {v0, p1}, Ljava/security/Signature;->initVerify(Ljava/security/PublicKey;)V

    #@2c
    .line 231
    invoke-virtual {p0}, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->getTBSCertList()[B

    #@2f
    move-result-object v1

    #@30
    invoke-virtual {v0, v1}, Ljava/security/Signature;->update([B)V

    #@33
    .line 233
    invoke-virtual {p0}, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->getSignature()[B

    #@36
    move-result-object v1

    #@37
    invoke-virtual {v0, v1}, Ljava/security/Signature;->verify([B)Z

    #@3a
    move-result v1

    #@3b
    if-nez v1, :cond_2

    #@3d
    .line 235
    new-instance v1, Ljava/security/SignatureException;

    #@3f
    const-string/jumbo v2, "CRL does not verify with supplied public key."

    #@42
    invoke-direct {v1, v2}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;)V

    #@45
    throw v1

    #@46
    .line 227
    .end local v0    # "sig":Ljava/security/Signature;
    :cond_1
    invoke-virtual {p0}, Lcom/android/org/bouncycastle/jce/provider/X509CRLObject;->getSigAlgName()Ljava/lang/String;

    #@49
    move-result-object v1

    #@4a
    invoke-static {v1}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    #@4d
    move-result-object v0

    #@4e
    .restart local v0    # "sig":Ljava/security/Signature;
    goto :goto_0

    #@4f
    .line 212
    :cond_2
    return-void
.end method

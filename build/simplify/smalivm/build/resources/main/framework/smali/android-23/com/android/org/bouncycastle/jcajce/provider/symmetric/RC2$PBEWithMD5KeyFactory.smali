.class public Lcom/android/org/bouncycastle/jcajce/provider/symmetric/RC2$PBEWithMD5KeyFactory;
.super Lcom/android/org/bouncycastle/jcajce/provider/symmetric/util/PBESecretKeyFactory;
.source "RC2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/org/bouncycastle/jcajce/provider/symmetric/RC2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PBEWithMD5KeyFactory"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 8

    #@0
    .prologue
    const/16 v6, 0x40

    #@2
    const/4 v4, 0x0

    #@3
    .line 209
    const-string/jumbo v1, "PBEwithMD5andRC2"

    #@6
    sget-object v2, Lcom/android/org/bouncycastle/asn1/pkcs/PKCSObjectIdentifiers;->pbeWithMD5AndRC2_CBC:Lcom/android/org/bouncycastle/asn1/ASN1ObjectIdentifier;

    #@8
    const/4 v3, 0x1

    #@9
    move-object v0, p0

    #@a
    move v5, v4

    #@b
    move v7, v6

    #@c
    invoke-direct/range {v0 .. v7}, Lcom/android/org/bouncycastle/jcajce/provider/symmetric/util/PBESecretKeyFactory;-><init>(Ljava/lang/String;Lcom/android/org/bouncycastle/asn1/ASN1ObjectIdentifier;ZIIII)V

    #@f
    .line 207
    return-void
.end method

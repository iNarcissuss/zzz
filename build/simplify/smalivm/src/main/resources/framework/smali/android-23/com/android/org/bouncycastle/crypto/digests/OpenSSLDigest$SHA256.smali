.class public Lcom/android/org/bouncycastle/crypto/digests/OpenSSLDigest$SHA256;
.super Lcom/android/org/bouncycastle/crypto/digests/OpenSSLDigest;
.source "OpenSSLDigest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/org/bouncycastle/crypto/digests/OpenSSLDigest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SHA256"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 2

    #@0
    .prologue
    .line 87
    const-string/jumbo v0, "SHA-256"

    #@3
    const/16 v1, 0x40

    #@5
    invoke-direct {p0, v0, v1}, Lcom/android/org/bouncycastle/crypto/digests/OpenSSLDigest;-><init>(Ljava/lang/String;I)V

    #@8
    return-void
.end method

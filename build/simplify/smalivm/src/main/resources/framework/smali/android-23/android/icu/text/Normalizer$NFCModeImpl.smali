.class final Landroid/icu/text/Normalizer$NFCModeImpl;
.super Ljava/lang/Object;
.source "Normalizer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/icu/text/Normalizer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NFCModeImpl"
.end annotation


# static fields
.field private static final INSTANCE:Landroid/icu/text/Normalizer$ModeImpl;


# direct methods
.method static synthetic -get0()Landroid/icu/text/Normalizer$ModeImpl;
    .locals 1

    #@0
    sget-object v0, Landroid/icu/text/Normalizer$NFCModeImpl;->INSTANCE:Landroid/icu/text/Normalizer$ModeImpl;

    #@2
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    #@0
    .prologue
    .line 158
    new-instance v0, Landroid/icu/text/Normalizer$ModeImpl;

    #@2
    invoke-static {}, Landroid/icu/text/Normalizer2;->getNFCInstance()Landroid/icu/text/Normalizer2;

    #@5
    move-result-object v1

    #@6
    const/4 v2, 0x0

    #@7
    invoke-direct {v0, v1, v2}, Landroid/icu/text/Normalizer$ModeImpl;-><init>(Landroid/icu/text/Normalizer2;Landroid/icu/text/Normalizer$ModeImpl;)V

    #@a
    sput-object v0, Landroid/icu/text/Normalizer$NFCModeImpl;->INSTANCE:Landroid/icu/text/Normalizer$ModeImpl;

    #@c
    .line 157
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    #@0
    .prologue
    .line 157
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    #@3
    return-void
.end method

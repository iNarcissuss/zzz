.class final Landroid/icu/text/Normalizer$NFDMode;
.super Landroid/icu/text/Normalizer$Mode;
.source "Normalizer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/icu/text/Normalizer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NFDMode"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    #@0
    .prologue
    .line 240
    invoke-direct {p0}, Landroid/icu/text/Normalizer$Mode;-><init>()V

    #@3
    return-void
.end method

.method synthetic constructor <init>(Landroid/icu/text/Normalizer$NFDMode;)V
    .locals 0

    #@0
    .prologue
    invoke-direct {p0}, Landroid/icu/text/Normalizer$NFDMode;-><init>()V

    #@3
    return-void
.end method


# virtual methods
.method protected getNormalizer2(I)Landroid/icu/text/Normalizer2;
    .locals 1
    .param p1, "options"    # I

    #@0
    .prologue
    .line 242
    and-int/lit8 v0, p1, 0x20

    #@2
    if-eqz v0, :cond_0

    #@4
    .line 243
    invoke-static {}, Landroid/icu/text/Normalizer$NFD32ModeImpl;->-get0()Landroid/icu/text/Normalizer$ModeImpl;

    #@7
    move-result-object v0

    #@8
    invoke-static {v0}, Landroid/icu/text/Normalizer$ModeImpl;->-get0(Landroid/icu/text/Normalizer$ModeImpl;)Landroid/icu/text/Normalizer2;

    #@b
    move-result-object v0

    #@c
    .line 242
    :goto_0
    return-object v0

    #@d
    .line 243
    :cond_0
    invoke-static {}, Landroid/icu/text/Normalizer$NFDModeImpl;->-get0()Landroid/icu/text/Normalizer$ModeImpl;

    #@10
    move-result-object v0

    #@11
    invoke-static {v0}, Landroid/icu/text/Normalizer$ModeImpl;->-get0(Landroid/icu/text/Normalizer$ModeImpl;)Landroid/icu/text/Normalizer2;

    #@14
    move-result-object v0

    #@15
    goto :goto_0
.end method

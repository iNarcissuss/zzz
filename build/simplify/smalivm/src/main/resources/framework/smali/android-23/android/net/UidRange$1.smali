.class final Landroid/net/UidRange$1;
.super Ljava/lang/Object;
.source "UidRange.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/net/UidRange;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Landroid/net/UidRange;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    #@0
    .prologue
    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    #@3
    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Landroid/net/UidRange;
    .locals 3
    .param p1, "in"    # Landroid/os/Parcel;

    #@0
    .prologue
    .line 92
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    #@3
    move-result v0

    #@4
    .line 93
    .local v0, "start":I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    #@7
    move-result v1

    #@8
    .line 95
    .local v1, "stop":I
    new-instance v2, Landroid/net/UidRange;

    #@a
    invoke-direct {v2, v0, v1}, Landroid/net/UidRange;-><init>(II)V

    #@d
    return-object v2
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    #@0
    .prologue
    .line 91
    invoke-virtual {p0, p1}, Landroid/net/UidRange$1;->createFromParcel(Landroid/os/Parcel;)Landroid/net/UidRange;

    #@3
    move-result-object v0

    #@4
    return-object v0
.end method

.method public newArray(I)[Landroid/net/UidRange;
    .locals 1
    .param p1, "size"    # I

    #@0
    .prologue
    .line 99
    new-array v0, p1, [Landroid/net/UidRange;

    #@2
    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1
    .param p1, "size"    # I

    #@0
    .prologue
    .line 98
    invoke-virtual {p0, p1}, Landroid/net/UidRange$1;->newArray(I)[Landroid/net/UidRange;

    #@3
    move-result-object v0

    #@4
    return-object v0
.end method

.class final Landroid/bluetooth/SdpSapsRecord$1;
.super Ljava/lang/Object;
.source "SdpSapsRecord.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/bluetooth/SdpSapsRecord;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    #@0
    .prologue
    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    #@3
    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Landroid/bluetooth/SdpSapsRecord;
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    #@0
    .prologue
    .line 85
    new-instance v0, Landroid/bluetooth/SdpSapsRecord;

    #@2
    invoke-direct {v0, p1}, Landroid/bluetooth/SdpSapsRecord;-><init>(Landroid/os/Parcel;)V

    #@5
    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    #@0
    .prologue
    .line 84
    invoke-virtual {p0, p1}, Landroid/bluetooth/SdpSapsRecord$1;->createFromParcel(Landroid/os/Parcel;)Landroid/bluetooth/SdpSapsRecord;

    #@3
    move-result-object v0

    #@4
    return-object v0
.end method

.method public newArray(I)[Landroid/bluetooth/SdpRecord;
    .locals 1
    .param p1, "size"    # I

    #@0
    .prologue
    .line 88
    new-array v0, p1, [Landroid/bluetooth/SdpRecord;

    #@2
    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1
    .param p1, "size"    # I

    #@0
    .prologue
    .line 87
    invoke-virtual {p0, p1}, Landroid/bluetooth/SdpSapsRecord$1;->newArray(I)[Landroid/bluetooth/SdpRecord;

    #@3
    move-result-object v0

    #@4
    return-object v0
.end method

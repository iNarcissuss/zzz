.class final Landroid/hardware/hdmi/HdmiDeviceInfo$1;
.super Ljava/lang/Object;
.source "HdmiDeviceInfo.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/hardware/hdmi/HdmiDeviceInfo;
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
        "Landroid/hardware/hdmi/HdmiDeviceInfo;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    #@0
    .prologue
    .line 120
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    #@3
    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Landroid/hardware/hdmi/HdmiDeviceInfo;
    .locals 11
    .param p1, "source"    # Landroid/os/Parcel;

    #@0
    .prologue
    .line 123
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    #@3
    move-result v10

    #@4
    .line 124
    .local v10, "hdmiDeviceType":I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    #@7
    move-result v2

    #@8
    .line 125
    .local v2, "physicalAddress":I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    #@b
    move-result v3

    #@c
    .line 127
    .local v3, "portId":I
    sparse-switch v10, :sswitch_data_0

    #@f
    .line 145
    const/4 v0, 0x0

    #@10
    return-object v0

    #@11
    .line 129
    :sswitch_0
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    #@14
    move-result v1

    #@15
    .line 130
    .local v1, "logicalAddress":I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    #@18
    move-result v4

    #@19
    .line 131
    .local v4, "deviceType":I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    #@1c
    move-result v5

    #@1d
    .line 132
    .local v5, "vendorId":I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    #@20
    move-result v7

    #@21
    .line 133
    .local v7, "powerStatus":I
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    #@24
    move-result-object v6

    #@25
    .line 134
    .local v6, "displayName":Ljava/lang/String;
    new-instance v0, Landroid/hardware/hdmi/HdmiDeviceInfo;

    #@27
    invoke-direct/range {v0 .. v7}, Landroid/hardware/hdmi/HdmiDeviceInfo;-><init>(IIIIILjava/lang/String;I)V

    #@2a
    return-object v0

    #@2b
    .line 137
    .end local v1    # "logicalAddress":I
    .end local v4    # "deviceType":I
    .end local v5    # "vendorId":I
    .end local v6    # "displayName":Ljava/lang/String;
    .end local v7    # "powerStatus":I
    :sswitch_1
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    #@2e
    move-result v9

    #@2f
    .line 138
    .local v9, "deviceId":I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    #@32
    move-result v8

    #@33
    .line 139
    .local v8, "adopterId":I
    new-instance v0, Landroid/hardware/hdmi/HdmiDeviceInfo;

    #@35
    invoke-direct {v0, v2, v3, v8, v9}, Landroid/hardware/hdmi/HdmiDeviceInfo;-><init>(IIII)V

    #@38
    return-object v0

    #@39
    .line 141
    .end local v8    # "adopterId":I
    .end local v9    # "deviceId":I
    :sswitch_2
    new-instance v0, Landroid/hardware/hdmi/HdmiDeviceInfo;

    #@3b
    invoke-direct {v0, v2, v3}, Landroid/hardware/hdmi/HdmiDeviceInfo;-><init>(II)V

    #@3e
    return-object v0

    #@3f
    .line 143
    :sswitch_3
    sget-object v0, Landroid/hardware/hdmi/HdmiDeviceInfo;->INACTIVE_DEVICE:Landroid/hardware/hdmi/HdmiDeviceInfo;

    #@41
    return-object v0

    #@42
    .line 127
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x1 -> :sswitch_1
        0x2 -> :sswitch_2
        0x64 -> :sswitch_3
    .end sparse-switch
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1
    .param p1, "source"    # Landroid/os/Parcel;

    #@0
    .prologue
    .line 122
    invoke-virtual {p0, p1}, Landroid/hardware/hdmi/HdmiDeviceInfo$1;->createFromParcel(Landroid/os/Parcel;)Landroid/hardware/hdmi/HdmiDeviceInfo;

    #@3
    move-result-object v0

    #@4
    return-object v0
.end method

.method public newArray(I)[Landroid/hardware/hdmi/HdmiDeviceInfo;
    .locals 1
    .param p1, "size"    # I

    #@0
    .prologue
    .line 151
    new-array v0, p1, [Landroid/hardware/hdmi/HdmiDeviceInfo;

    #@2
    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1
    .param p1, "size"    # I

    #@0
    .prologue
    .line 150
    invoke-virtual {p0, p1}, Landroid/hardware/hdmi/HdmiDeviceInfo$1;->newArray(I)[Landroid/hardware/hdmi/HdmiDeviceInfo;

    #@3
    move-result-object v0

    #@4
    return-object v0
.end method

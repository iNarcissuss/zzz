.class Landroid/location/IGeofenceProvider$Stub$Proxy;
.super Ljava/lang/Object;
.source "IGeofenceProvider.java"

# interfaces
.implements Landroid/location/IGeofenceProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/location/IGeofenceProvider$Stub;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Proxy"
.end annotation


# instance fields
.field private mRemote:Landroid/os/IBinder;


# direct methods
.method constructor <init>(Landroid/os/IBinder;)V
    .locals 0
    .param p1, "remote"    # Landroid/os/IBinder;

    #@0
    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    #@3
    .line 67
    iput-object p1, p0, Landroid/location/IGeofenceProvider$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    #@5
    .line 65
    return-void
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 1

    #@0
    .prologue
    .line 71
    iget-object v0, p0, Landroid/location/IGeofenceProvider$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    #@2
    return-object v0
.end method

.method public getInterfaceDescriptor()Ljava/lang/String;
    .locals 1

    #@0
    .prologue
    .line 75
    const-string/jumbo v0, "android.location.IGeofenceProvider"

    #@3
    return-object v0
.end method

.method public setGeofenceHardware(Landroid/hardware/location/IGeofenceHardware;)V
    .locals 5
    .param p1, "proxy"    # Landroid/hardware/location/IGeofenceHardware;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    #@0
    .prologue
    const/4 v2, 0x0

    #@1
    .line 79
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    #@4
    move-result-object v0

    #@5
    .line 80
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    #@8
    move-result-object v1

    #@9
    .line 82
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_0
    const-string/jumbo v3, "android.location.IGeofenceProvider"

    #@c
    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    #@f
    .line 83
    if-eqz p1, :cond_0

    #@11
    invoke-interface {p1}, Landroid/hardware/location/IGeofenceHardware;->asBinder()Landroid/os/IBinder;

    #@14
    move-result-object v2

    #@15
    :cond_0
    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeStrongBinder(Landroid/os/IBinder;)V

    #@18
    .line 84
    iget-object v2, p0, Landroid/location/IGeofenceProvider$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    #@1a
    const/4 v3, 0x1

    #@1b
    const/4 v4, 0x0

    #@1c
    invoke-interface {v2, v3, v0, v1, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    #@1f
    .line 85
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    #@22
    .line 88
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    #@25
    .line 89
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    #@28
    .line 77
    return-void

    #@29
    .line 87
    :catchall_0
    move-exception v2

    #@2a
    .line 88
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    #@2d
    .line 89
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    #@30
    .line 87
    throw v2
.end method

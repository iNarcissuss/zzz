.class Landroid/hardware/camera2/CameraManager$CameraManagerGlobal$1;
.super Ljava/lang/Object;
.source "CameraManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/hardware/camera2/CameraManager$CameraManagerGlobal;->postSingleUpdate(Landroid/hardware/camera2/CameraManager$AvailabilityCallback;Landroid/os/Handler;Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroid/hardware/camera2/CameraManager$CameraManagerGlobal;

.field final synthetic val$callback:Landroid/hardware/camera2/CameraManager$AvailabilityCallback;

.field final synthetic val$id:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/hardware/camera2/CameraManager$CameraManagerGlobal;Landroid/hardware/camera2/CameraManager$AvailabilityCallback;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$1"    # Landroid/hardware/camera2/CameraManager$CameraManagerGlobal;
    .param p2, "val$callback"    # Landroid/hardware/camera2/CameraManager$AvailabilityCallback;
    .param p3, "val$id"    # Ljava/lang/String;

    #@0
    .prologue
    .line 946
    iput-object p1, p0, Landroid/hardware/camera2/CameraManager$CameraManagerGlobal$1;->this$1:Landroid/hardware/camera2/CameraManager$CameraManagerGlobal;

    #@2
    iput-object p2, p0, Landroid/hardware/camera2/CameraManager$CameraManagerGlobal$1;->val$callback:Landroid/hardware/camera2/CameraManager$AvailabilityCallback;

    #@4
    iput-object p3, p0, Landroid/hardware/camera2/CameraManager$CameraManagerGlobal$1;->val$id:Ljava/lang/String;

    #@6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    #@9
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    #@0
    .prologue
    .line 949
    iget-object v0, p0, Landroid/hardware/camera2/CameraManager$CameraManagerGlobal$1;->val$callback:Landroid/hardware/camera2/CameraManager$AvailabilityCallback;

    #@2
    iget-object v1, p0, Landroid/hardware/camera2/CameraManager$CameraManagerGlobal$1;->val$id:Ljava/lang/String;

    #@4
    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraManager$AvailabilityCallback;->onCameraAvailable(Ljava/lang/String;)V

    #@7
    .line 948
    return-void
.end method

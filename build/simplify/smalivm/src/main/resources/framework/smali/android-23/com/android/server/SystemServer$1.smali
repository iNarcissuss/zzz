.class Lcom/android/server/SystemServer$1;
.super Ljava/util/TimerTask;
.source "SystemServer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/SystemServer;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/SystemServer;


# direct methods
.method constructor <init>(Lcom/android/server/SystemServer;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/server/SystemServer;

    #@0
    .prologue
    .line 220
    iput-object p1, p0, Lcom/android/server/SystemServer$1;->this$0:Lcom/android/server/SystemServer;

    #@2
    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    #@5
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    #@0
    .prologue
    .line 223
    const-string/jumbo v0, "system_server"

    #@3
    const/4 v1, 0x0

    #@4
    invoke-static {v0, v1}, Lcom/android/internal/os/SamplingProfilerIntegration;->writeSnapshot(Ljava/lang/String;Landroid/content/pm/PackageInfo;)V

    #@7
    .line 222
    return-void
.end method

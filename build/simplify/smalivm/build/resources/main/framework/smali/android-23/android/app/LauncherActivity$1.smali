.class Landroid/app/LauncherActivity$1;
.super Ljava/lang/Object;
.source "LauncherActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/app/LauncherActivity;->updateButtonText()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/app/LauncherActivity;


# direct methods
.method constructor <init>(Landroid/app/LauncherActivity;)V
    .locals 0
    .param p1, "this$0"    # Landroid/app/LauncherActivity;

    #@0
    .prologue
    .line 377
    iput-object p1, p0, Landroid/app/LauncherActivity$1;->this$0:Landroid/app/LauncherActivity;

    #@2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    #@5
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    #@0
    .prologue
    .line 379
    iget-object v0, p0, Landroid/app/LauncherActivity$1;->this$0:Landroid/app/LauncherActivity;

    #@2
    invoke-virtual {v0}, Landroid/app/LauncherActivity;->finish()V

    #@5
    .line 378
    return-void
.end method

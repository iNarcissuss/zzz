.class Landroid/transition/ChangeBounds$9;
.super Landroid/transition/Transition$TransitionListenerAdapter;
.source "ChangeBounds.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/transition/ChangeBounds;->createAnimator(Landroid/view/ViewGroup;Landroid/transition/TransitionValues;Landroid/transition/TransitionValues;)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field mCanceled:Z

.field final synthetic this$0:Landroid/transition/ChangeBounds;

.field final synthetic val$parent:Landroid/view/ViewGroup;


# direct methods
.method constructor <init>(Landroid/transition/ChangeBounds;Landroid/view/ViewGroup;)V
    .locals 1
    .param p1, "this$0"    # Landroid/transition/ChangeBounds;
    .param p2, "val$parent"    # Landroid/view/ViewGroup;

    #@0
    .prologue
    .line 404
    iput-object p1, p0, Landroid/transition/ChangeBounds$9;->this$0:Landroid/transition/ChangeBounds;

    #@2
    iput-object p2, p0, Landroid/transition/ChangeBounds$9;->val$parent:Landroid/view/ViewGroup;

    #@4
    invoke-direct {p0}, Landroid/transition/Transition$TransitionListenerAdapter;-><init>()V

    #@7
    .line 405
    const/4 v0, 0x0

    #@8
    iput-boolean v0, p0, Landroid/transition/ChangeBounds$9;->mCanceled:Z

    #@a
    .line 404
    return-void
.end method


# virtual methods
.method public onTransitionCancel(Landroid/transition/Transition;)V
    .locals 2
    .param p1, "transition"    # Landroid/transition/Transition;

    #@0
    .prologue
    .line 409
    iget-object v0, p0, Landroid/transition/ChangeBounds$9;->val$parent:Landroid/view/ViewGroup;

    #@2
    const/4 v1, 0x0

    #@3
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->suppressLayout(Z)V

    #@6
    .line 410
    const/4 v0, 0x1

    #@7
    iput-boolean v0, p0, Landroid/transition/ChangeBounds$9;->mCanceled:Z

    #@9
    .line 408
    return-void
.end method

.method public onTransitionEnd(Landroid/transition/Transition;)V
    .locals 2
    .param p1, "transition"    # Landroid/transition/Transition;

    #@0
    .prologue
    .line 415
    iget-boolean v0, p0, Landroid/transition/ChangeBounds$9;->mCanceled:Z

    #@2
    if-nez v0, :cond_0

    #@4
    .line 416
    iget-object v0, p0, Landroid/transition/ChangeBounds$9;->val$parent:Landroid/view/ViewGroup;

    #@6
    const/4 v1, 0x0

    #@7
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->suppressLayout(Z)V

    #@a
    .line 414
    :cond_0
    return-void
.end method

.method public onTransitionPause(Landroid/transition/Transition;)V
    .locals 2
    .param p1, "transition"    # Landroid/transition/Transition;

    #@0
    .prologue
    .line 422
    iget-object v0, p0, Landroid/transition/ChangeBounds$9;->val$parent:Landroid/view/ViewGroup;

    #@2
    const/4 v1, 0x0

    #@3
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->suppressLayout(Z)V

    #@6
    .line 421
    return-void
.end method

.method public onTransitionResume(Landroid/transition/Transition;)V
    .locals 2
    .param p1, "transition"    # Landroid/transition/Transition;

    #@0
    .prologue
    .line 427
    iget-object v0, p0, Landroid/transition/ChangeBounds$9;->val$parent:Landroid/view/ViewGroup;

    #@2
    const/4 v1, 0x1

    #@3
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->suppressLayout(Z)V

    #@6
    .line 426
    return-void
.end method

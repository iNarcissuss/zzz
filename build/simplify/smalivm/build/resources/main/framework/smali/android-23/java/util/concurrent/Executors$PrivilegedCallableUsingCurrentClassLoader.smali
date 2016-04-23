.class final Ljava/util/concurrent/Executors$PrivilegedCallableUsingCurrentClassLoader;
.super Ljava/lang/Object;
.source "Executors.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljava/util/concurrent/Executors;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "PrivilegedCallableUsingCurrentClassLoader"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final acc:Ljava/security/AccessControlContext;

.field private final ccl:Ljava/lang/ClassLoader;

.field private final task:Ljava/util/concurrent/Callable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Callable",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method static synthetic -get0(Ljava/util/concurrent/Executors$PrivilegedCallableUsingCurrentClassLoader;)Ljava/lang/ClassLoader;
    .locals 1

    #@0
    iget-object v0, p0, Ljava/util/concurrent/Executors$PrivilegedCallableUsingCurrentClassLoader;->ccl:Ljava/lang/ClassLoader;

    #@2
    return-object v0
.end method

.method static synthetic -get1(Ljava/util/concurrent/Executors$PrivilegedCallableUsingCurrentClassLoader;)Ljava/util/concurrent/Callable;
    .locals 1

    #@0
    iget-object v0, p0, Ljava/util/concurrent/Executors$PrivilegedCallableUsingCurrentClassLoader;->task:Ljava/util/concurrent/Callable;

    #@2
    return-object v0
.end method

.method constructor <init>(Ljava/util/concurrent/Callable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable",
            "<TT;>;)V"
        }
    .end annotation

    #@0
    .prologue
    .line 463
    .local p0, "this":Ljava/util/concurrent/Executors$PrivilegedCallableUsingCurrentClassLoader;, "Ljava/util/concurrent/Executors$PrivilegedCallableUsingCurrentClassLoader<TT;>;"
    .local p1, "task":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    #@3
    .line 477
    iput-object p1, p0, Ljava/util/concurrent/Executors$PrivilegedCallableUsingCurrentClassLoader;->task:Ljava/util/concurrent/Callable;

    #@5
    .line 478
    invoke-static {}, Ljava/security/AccessController;->getContext()Ljava/security/AccessControlContext;

    #@8
    move-result-object v0

    #@9
    iput-object v0, p0, Ljava/util/concurrent/Executors$PrivilegedCallableUsingCurrentClassLoader;->acc:Ljava/security/AccessControlContext;

    #@b
    .line 479
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    #@e
    move-result-object v0

    #@f
    invoke-virtual {v0}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    #@12
    move-result-object v0

    #@13
    iput-object v0, p0, Ljava/util/concurrent/Executors$PrivilegedCallableUsingCurrentClassLoader;->ccl:Ljava/lang/ClassLoader;

    #@15
    .line 463
    return-void
.end method


# virtual methods
.method public call()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    #@0
    .prologue
    .line 485
    .local p0, "this":Ljava/util/concurrent/Executors$PrivilegedCallableUsingCurrentClassLoader;, "Ljava/util/concurrent/Executors$PrivilegedCallableUsingCurrentClassLoader<TT;>;"
    :try_start_0
    new-instance v1, Ljava/util/concurrent/Executors$PrivilegedCallableUsingCurrentClassLoader$1;

    #@2
    invoke-direct {v1, p0}, Ljava/util/concurrent/Executors$PrivilegedCallableUsingCurrentClassLoader$1;-><init>(Ljava/util/concurrent/Executors$PrivilegedCallableUsingCurrentClassLoader;)V

    #@5
    .line 500
    iget-object v2, p0, Ljava/util/concurrent/Executors$PrivilegedCallableUsingCurrentClassLoader;->acc:Ljava/security/AccessControlContext;

    #@7
    .line 484
    invoke-static {v1, v2}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedExceptionAction;Ljava/security/AccessControlContext;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/security/PrivilegedActionException; {:try_start_0 .. :try_end_0} :catch_0

    #@a
    move-result-object v1

    #@b
    return-object v1

    #@c
    .line 501
    :catch_0
    move-exception v0

    #@d
    .line 502
    .local v0, "e":Ljava/security/PrivilegedActionException;
    invoke-virtual {v0}, Ljava/security/PrivilegedActionException;->getException()Ljava/lang/Exception;

    #@10
    move-result-object v1

    #@11
    throw v1
.end method

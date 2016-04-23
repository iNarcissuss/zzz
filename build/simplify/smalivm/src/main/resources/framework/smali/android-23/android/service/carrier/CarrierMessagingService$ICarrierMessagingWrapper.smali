.class Landroid/service/carrier/CarrierMessagingService$ICarrierMessagingWrapper;
.super Landroid/service/carrier/ICarrierMessagingService$Stub;
.source "CarrierMessagingService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/service/carrier/CarrierMessagingService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ICarrierMessagingWrapper"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/service/carrier/CarrierMessagingService;


# direct methods
.method private constructor <init>(Landroid/service/carrier/CarrierMessagingService;)V
    .locals 0
    .param p1, "this$0"    # Landroid/service/carrier/CarrierMessagingService;

    #@0
    .prologue
    .line 407
    iput-object p1, p0, Landroid/service/carrier/CarrierMessagingService$ICarrierMessagingWrapper;->this$0:Landroid/service/carrier/CarrierMessagingService;

    #@2
    invoke-direct {p0}, Landroid/service/carrier/ICarrierMessagingService$Stub;-><init>()V

    #@5
    return-void
.end method

.method synthetic constructor <init>(Landroid/service/carrier/CarrierMessagingService;Landroid/service/carrier/CarrierMessagingService$ICarrierMessagingWrapper;)V
    .locals 0
    .param p1, "this$0"    # Landroid/service/carrier/CarrierMessagingService;

    #@0
    .prologue
    invoke-direct {p0, p1}, Landroid/service/carrier/CarrierMessagingService$ICarrierMessagingWrapper;-><init>(Landroid/service/carrier/CarrierMessagingService;)V

    #@3
    return-void
.end method


# virtual methods
.method public downloadMms(Landroid/net/Uri;ILandroid/net/Uri;Landroid/service/carrier/ICarrierMessagingCallback;)V
    .locals 2
    .param p1, "pduUri"    # Landroid/net/Uri;
    .param p2, "subId"    # I
    .param p3, "location"    # Landroid/net/Uri;
    .param p4, "callback"    # Landroid/service/carrier/ICarrierMessagingCallback;

    #@0
    .prologue
    .line 471
    iget-object v0, p0, Landroid/service/carrier/CarrierMessagingService$ICarrierMessagingWrapper;->this$0:Landroid/service/carrier/CarrierMessagingService;

    #@2
    new-instance v1, Landroid/service/carrier/CarrierMessagingService$ICarrierMessagingWrapper$6;

    #@4
    invoke-direct {v1, p0, p4}, Landroid/service/carrier/CarrierMessagingService$ICarrierMessagingWrapper$6;-><init>(Landroid/service/carrier/CarrierMessagingService$ICarrierMessagingWrapper;Landroid/service/carrier/ICarrierMessagingCallback;)V

    #@7
    invoke-virtual {v0, p1, p2, p3, v1}, Landroid/service/carrier/CarrierMessagingService;->onDownloadMms(Landroid/net/Uri;ILandroid/net/Uri;Landroid/service/carrier/CarrierMessagingService$ResultCallback;)V

    #@a
    .line 470
    return-void
.end method

.method public filterSms(Landroid/service/carrier/MessagePdu;Ljava/lang/String;IILandroid/service/carrier/ICarrierMessagingCallback;)V
    .locals 6
    .param p1, "pdu"    # Landroid/service/carrier/MessagePdu;
    .param p2, "format"    # Ljava/lang/String;
    .param p3, "destPort"    # I
    .param p4, "subId"    # I
    .param p5, "callback"    # Landroid/service/carrier/ICarrierMessagingCallback;

    #@0
    .prologue
    .line 411
    iget-object v0, p0, Landroid/service/carrier/CarrierMessagingService$ICarrierMessagingWrapper;->this$0:Landroid/service/carrier/CarrierMessagingService;

    #@2
    new-instance v5, Landroid/service/carrier/CarrierMessagingService$ICarrierMessagingWrapper$1;

    #@4
    invoke-direct {v5, p0, p5}, Landroid/service/carrier/CarrierMessagingService$ICarrierMessagingWrapper$1;-><init>(Landroid/service/carrier/CarrierMessagingService$ICarrierMessagingWrapper;Landroid/service/carrier/ICarrierMessagingCallback;)V

    #@7
    move-object v1, p1

    #@8
    move-object v2, p2

    #@9
    move v3, p3

    #@a
    move v4, p4

    #@b
    invoke-virtual/range {v0 .. v5}, Landroid/service/carrier/CarrierMessagingService;->onFilterSms(Landroid/service/carrier/MessagePdu;Ljava/lang/String;IILandroid/service/carrier/CarrierMessagingService$ResultCallback;)V

    #@e
    .line 410
    return-void
.end method

.method public sendDataSms([BILjava/lang/String;IILandroid/service/carrier/ICarrierMessagingCallback;)V
    .locals 7
    .param p1, "data"    # [B
    .param p2, "subId"    # I
    .param p3, "destAddress"    # Ljava/lang/String;
    .param p4, "destPort"    # I
    .param p5, "sendSmsFlag"    # I
    .param p6, "callback"    # Landroid/service/carrier/ICarrierMessagingCallback;

    #@0
    .prologue
    .line 434
    iget-object v0, p0, Landroid/service/carrier/CarrierMessagingService$ICarrierMessagingWrapper;->this$0:Landroid/service/carrier/CarrierMessagingService;

    #@2
    .line 435
    new-instance v6, Landroid/service/carrier/CarrierMessagingService$ICarrierMessagingWrapper$3;

    #@4
    invoke-direct {v6, p0, p6}, Landroid/service/carrier/CarrierMessagingService$ICarrierMessagingWrapper$3;-><init>(Landroid/service/carrier/CarrierMessagingService$ICarrierMessagingWrapper;Landroid/service/carrier/ICarrierMessagingCallback;)V

    #@7
    move-object v1, p1

    #@8
    move v2, p2

    #@9
    move-object v3, p3

    #@a
    move v4, p4

    #@b
    move v5, p5

    #@c
    .line 434
    invoke-virtual/range {v0 .. v6}, Landroid/service/carrier/CarrierMessagingService;->onSendDataSms([BILjava/lang/String;IILandroid/service/carrier/CarrierMessagingService$ResultCallback;)V

    #@f
    .line 433
    return-void
.end method

.method public sendMms(Landroid/net/Uri;ILandroid/net/Uri;Landroid/service/carrier/ICarrierMessagingCallback;)V
    .locals 2
    .param p1, "pduUri"    # Landroid/net/Uri;
    .param p2, "subId"    # I
    .param p3, "location"    # Landroid/net/Uri;
    .param p4, "callback"    # Landroid/service/carrier/ICarrierMessagingCallback;

    #@0
    .prologue
    .line 460
    iget-object v0, p0, Landroid/service/carrier/CarrierMessagingService$ICarrierMessagingWrapper;->this$0:Landroid/service/carrier/CarrierMessagingService;

    #@2
    new-instance v1, Landroid/service/carrier/CarrierMessagingService$ICarrierMessagingWrapper$5;

    #@4
    invoke-direct {v1, p0, p4}, Landroid/service/carrier/CarrierMessagingService$ICarrierMessagingWrapper$5;-><init>(Landroid/service/carrier/CarrierMessagingService$ICarrierMessagingWrapper;Landroid/service/carrier/ICarrierMessagingCallback;)V

    #@7
    invoke-virtual {v0, p1, p2, p3, v1}, Landroid/service/carrier/CarrierMessagingService;->onSendMms(Landroid/net/Uri;ILandroid/net/Uri;Landroid/service/carrier/CarrierMessagingService$ResultCallback;)V

    #@a
    .line 459
    return-void
.end method

.method public sendMultipartTextSms(Ljava/util/List;ILjava/lang/String;ILandroid/service/carrier/ICarrierMessagingCallback;)V
    .locals 6
    .param p2, "subId"    # I
    .param p3, "destAddress"    # Ljava/lang/String;
    .param p4, "sendSmsFlag"    # I
    .param p5, "callback"    # Landroid/service/carrier/ICarrierMessagingCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;I",
            "Ljava/lang/String;",
            "I",
            "Landroid/service/carrier/ICarrierMessagingCallback;",
            ")V"
        }
    .end annotation

    #@0
    .prologue
    .line 446
    .local p1, "parts":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v0, p0, Landroid/service/carrier/CarrierMessagingService$ICarrierMessagingWrapper;->this$0:Landroid/service/carrier/CarrierMessagingService;

    #@2
    .line 447
    new-instance v5, Landroid/service/carrier/CarrierMessagingService$ICarrierMessagingWrapper$4;

    #@4
    invoke-direct {v5, p0, p5}, Landroid/service/carrier/CarrierMessagingService$ICarrierMessagingWrapper$4;-><init>(Landroid/service/carrier/CarrierMessagingService$ICarrierMessagingWrapper;Landroid/service/carrier/ICarrierMessagingCallback;)V

    #@7
    move-object v1, p1

    #@8
    move v2, p2

    #@9
    move-object v3, p3

    #@a
    move v4, p4

    #@b
    .line 446
    invoke-virtual/range {v0 .. v5}, Landroid/service/carrier/CarrierMessagingService;->onSendMultipartTextSms(Ljava/util/List;ILjava/lang/String;ILandroid/service/carrier/CarrierMessagingService$ResultCallback;)V

    #@e
    .line 445
    return-void
.end method

.method public sendTextSms(Ljava/lang/String;ILjava/lang/String;ILandroid/service/carrier/ICarrierMessagingCallback;)V
    .locals 6
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "subId"    # I
    .param p3, "destAddress"    # Ljava/lang/String;
    .param p4, "sendSmsFlag"    # I
    .param p5, "callback"    # Landroid/service/carrier/ICarrierMessagingCallback;

    #@0
    .prologue
    .line 422
    iget-object v0, p0, Landroid/service/carrier/CarrierMessagingService$ICarrierMessagingWrapper;->this$0:Landroid/service/carrier/CarrierMessagingService;

    #@2
    .line 423
    new-instance v5, Landroid/service/carrier/CarrierMessagingService$ICarrierMessagingWrapper$2;

    #@4
    invoke-direct {v5, p0, p5}, Landroid/service/carrier/CarrierMessagingService$ICarrierMessagingWrapper$2;-><init>(Landroid/service/carrier/CarrierMessagingService$ICarrierMessagingWrapper;Landroid/service/carrier/ICarrierMessagingCallback;)V

    #@7
    move-object v1, p1

    #@8
    move v2, p2

    #@9
    move-object v3, p3

    #@a
    move v4, p4

    #@b
    .line 422
    invoke-virtual/range {v0 .. v5}, Landroid/service/carrier/CarrierMessagingService;->onSendTextSms(Ljava/lang/String;ILjava/lang/String;ILandroid/service/carrier/CarrierMessagingService$ResultCallback;)V

    #@e
    .line 421
    return-void
.end method

.class Landroid/animation/PathKeyframes;
.super Ljava/lang/Object;
.source "PathKeyframes.java"

# interfaces
.implements Landroid/animation/Keyframes;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/animation/PathKeyframes$SimpleKeyframes;,
        Landroid/animation/PathKeyframes$IntKeyframesBase;,
        Landroid/animation/PathKeyframes$FloatKeyframesBase;
    }
.end annotation


# static fields
.field private static final EMPTY_KEYFRAMES:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/animation/Keyframe;",
            ">;"
        }
    .end annotation
.end field

.field private static final FRACTION_OFFSET:I = 0x0

.field private static final NUM_COMPONENTS:I = 0x3

.field private static final X_OFFSET:I = 0x1

.field private static final Y_OFFSET:I = 0x2


# instance fields
.field private mKeyframeData:[F

.field private mTempPointF:Landroid/graphics/PointF;


# direct methods
.method static synthetic -get0()Ljava/util/ArrayList;
    .locals 1

    #@0
    sget-object v0, Landroid/animation/PathKeyframes;->EMPTY_KEYFRAMES:Ljava/util/ArrayList;

    #@2
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 1

    #@0
    .prologue
    .line 43
    new-instance v0, Ljava/util/ArrayList;

    #@2
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    #@5
    sput-object v0, Landroid/animation/PathKeyframes;->EMPTY_KEYFRAMES:Ljava/util/ArrayList;

    #@7
    .line 38
    return-void
.end method

.method public constructor <init>(Landroid/graphics/Path;)V
    .locals 1
    .param p1, "path"    # Landroid/graphics/Path;

    #@0
    .prologue
    .line 49
    const/high16 v0, 0x3f000000    # 0.5f

    #@2
    invoke-direct {p0, p1, v0}, Landroid/animation/PathKeyframes;-><init>(Landroid/graphics/Path;F)V

    #@5
    .line 48
    return-void
.end method

.method public constructor <init>(Landroid/graphics/Path;F)V
    .locals 2
    .param p1, "path"    # Landroid/graphics/Path;
    .param p2, "error"    # F

    #@0
    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    #@3
    .line 45
    new-instance v0, Landroid/graphics/PointF;

    #@5
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    #@8
    iput-object v0, p0, Landroid/animation/PathKeyframes;->mTempPointF:Landroid/graphics/PointF;

    #@a
    .line 53
    if-eqz p1, :cond_0

    #@c
    invoke-virtual {p1}, Landroid/graphics/Path;->isEmpty()Z

    #@f
    move-result v0

    #@10
    if-eqz v0, :cond_1

    #@12
    .line 54
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    #@14
    const-string/jumbo v1, "The path must not be null or empty"

    #@17
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    #@1a
    throw v0

    #@1b
    .line 56
    :cond_1
    invoke-virtual {p1, p2}, Landroid/graphics/Path;->approximate(F)[F

    #@1e
    move-result-object v0

    #@1f
    iput-object v0, p0, Landroid/animation/PathKeyframes;->mKeyframeData:[F

    #@21
    .line 52
    return-void
.end method

.method private static interpolate(FFF)F
    .locals 2
    .param p0, "fraction"    # F
    .param p1, "startValue"    # F
    .param p2, "endValue"    # F

    #@0
    .prologue
    .line 150
    sub-float v0, p2, p1

    #@2
    .line 151
    .local v0, "diff":F
    mul-float v1, v0, p0

    #@4
    add-float/2addr v1, p1

    #@5
    return v1
.end method

.method private interpolateInRange(FII)Landroid/graphics/PointF;
    .locals 13
    .param p1, "fraction"    # F
    .param p2, "startIndex"    # I
    .param p3, "endIndex"    # I

    #@0
    .prologue
    .line 99
    mul-int/lit8 v5, p2, 0x3

    #@2
    .line 100
    .local v5, "startBase":I
    mul-int/lit8 v0, p3, 0x3

    #@4
    .line 102
    .local v0, "endBase":I
    iget-object v11, p0, Landroid/animation/PathKeyframes;->mKeyframeData:[F

    #@6
    add-int/lit8 v12, v5, 0x0

    #@8
    aget v6, v11, v12

    #@a
    .line 103
    .local v6, "startFraction":F
    iget-object v11, p0, Landroid/animation/PathKeyframes;->mKeyframeData:[F

    #@c
    add-int/lit8 v12, v0, 0x0

    #@e
    aget v1, v11, v12

    #@10
    .line 105
    .local v1, "endFraction":F
    sub-float v11, p1, v6

    #@12
    sub-float v12, v1, v6

    #@14
    div-float v4, v11, v12

    #@16
    .line 107
    .local v4, "intervalFraction":F
    iget-object v11, p0, Landroid/animation/PathKeyframes;->mKeyframeData:[F

    #@18
    add-int/lit8 v12, v5, 0x1

    #@1a
    aget v7, v11, v12

    #@1c
    .line 108
    .local v7, "startX":F
    iget-object v11, p0, Landroid/animation/PathKeyframes;->mKeyframeData:[F

    #@1e
    add-int/lit8 v12, v0, 0x1

    #@20
    aget v2, v11, v12

    #@22
    .line 109
    .local v2, "endX":F
    iget-object v11, p0, Landroid/animation/PathKeyframes;->mKeyframeData:[F

    #@24
    add-int/lit8 v12, v5, 0x2

    #@26
    aget v8, v11, v12

    #@28
    .line 110
    .local v8, "startY":F
    iget-object v11, p0, Landroid/animation/PathKeyframes;->mKeyframeData:[F

    #@2a
    add-int/lit8 v12, v0, 0x2

    #@2c
    aget v3, v11, v12

    #@2e
    .line 112
    .local v3, "endY":F
    invoke-static {v4, v7, v2}, Landroid/animation/PathKeyframes;->interpolate(FFF)F

    #@31
    move-result v9

    #@32
    .line 113
    .local v9, "x":F
    invoke-static {v4, v8, v3}, Landroid/animation/PathKeyframes;->interpolate(FFF)F

    #@35
    move-result v10

    #@36
    .line 115
    .local v10, "y":F
    iget-object v11, p0, Landroid/animation/PathKeyframes;->mTempPointF:Landroid/graphics/PointF;

    #@38
    invoke-virtual {v11, v9, v10}, Landroid/graphics/PointF;->set(FF)V

    #@3b
    .line 116
    iget-object v11, p0, Landroid/animation/PathKeyframes;->mTempPointF:Landroid/graphics/PointF;

    #@3d
    return-object v11
.end method

.method private pointForIndex(I)Landroid/graphics/PointF;
    .locals 6
    .param p1, "index"    # I

    #@0
    .prologue
    .line 142
    mul-int/lit8 v0, p1, 0x3

    #@2
    .line 143
    .local v0, "base":I
    add-int/lit8 v1, v0, 0x1

    #@4
    .line 144
    .local v1, "xOffset":I
    add-int/lit8 v2, v0, 0x2

    #@6
    .line 145
    .local v2, "yOffset":I
    iget-object v3, p0, Landroid/animation/PathKeyframes;->mTempPointF:Landroid/graphics/PointF;

    #@8
    iget-object v4, p0, Landroid/animation/PathKeyframes;->mKeyframeData:[F

    #@a
    aget v4, v4, v1

    #@c
    iget-object v5, p0, Landroid/animation/PathKeyframes;->mKeyframeData:[F

    #@e
    aget v5, v5, v2

    #@10
    invoke-virtual {v3, v4, v5}, Landroid/graphics/PointF;->set(FF)V

    #@13
    .line 146
    iget-object v3, p0, Landroid/animation/PathKeyframes;->mTempPointF:Landroid/graphics/PointF;

    #@15
    return-object v3
.end method


# virtual methods
.method public clone()Landroid/animation/Keyframes;
    .locals 4

    #@0
    .prologue
    .line 134
    const/4 v1, 0x0

    #@1
    .line 136
    .local v1, "clone":Landroid/animation/Keyframes;
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    #@4
    move-result-object v3

    #@5
    move-object v0, v3

    #@6
    check-cast v0, Landroid/animation/Keyframes;

    #@8
    move-object v1, v0
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    #@9
    .line 138
    .end local v1    # "clone":Landroid/animation/Keyframes;
    :goto_0
    return-object v1

    #@a
    .line 137
    .restart local v1    # "clone":Landroid/animation/Keyframes;
    :catch_0
    move-exception v2

    #@b
    .local v2, "e":Ljava/lang/CloneNotSupportedException;
    goto :goto_0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    #@0
    .prologue
    .line 133
    invoke-virtual {p0}, Landroid/animation/PathKeyframes;->clone()Landroid/animation/Keyframes;

    #@3
    move-result-object v0

    #@4
    return-object v0
.end method

.method public createXFloatKeyframes()Landroid/animation/Keyframes$FloatKeyframes;
    .locals 1

    #@0
    .prologue
    .line 159
    new-instance v0, Landroid/animation/PathKeyframes$1;

    #@2
    invoke-direct {v0, p0}, Landroid/animation/PathKeyframes$1;-><init>(Landroid/animation/PathKeyframes;)V

    #@5
    return-object v0
.end method

.method public createXIntKeyframes()Landroid/animation/Keyframes$IntKeyframes;
    .locals 1

    #@0
    .prologue
    .line 187
    new-instance v0, Landroid/animation/PathKeyframes$3;

    #@2
    invoke-direct {v0, p0}, Landroid/animation/PathKeyframes$3;-><init>(Landroid/animation/PathKeyframes;)V

    #@5
    return-object v0
.end method

.method public createYFloatKeyframes()Landroid/animation/Keyframes$FloatKeyframes;
    .locals 1

    #@0
    .prologue
    .line 173
    new-instance v0, Landroid/animation/PathKeyframes$2;

    #@2
    invoke-direct {v0, p0}, Landroid/animation/PathKeyframes$2;-><init>(Landroid/animation/PathKeyframes;)V

    #@5
    return-object v0
.end method

.method public createYIntKeyframes()Landroid/animation/Keyframes$IntKeyframes;
    .locals 1

    #@0
    .prologue
    .line 201
    new-instance v0, Landroid/animation/PathKeyframes$4;

    #@2
    invoke-direct {v0, p0}, Landroid/animation/PathKeyframes$4;-><init>(Landroid/animation/PathKeyframes;)V

    #@5
    return-object v0
.end method

.method public getKeyframes()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/animation/Keyframe;",
            ">;"
        }
    .end annotation

    #@0
    .prologue
    .line 61
    sget-object v0, Landroid/animation/PathKeyframes;->EMPTY_KEYFRAMES:Ljava/util/ArrayList;

    #@2
    return-object v0
.end method

.method public bridge synthetic getKeyframes()Ljava/util/List;
    .locals 1

    #@0
    .prologue
    .line 60
    invoke-virtual {p0}, Landroid/animation/PathKeyframes;->getKeyframes()Ljava/util/ArrayList;

    #@3
    move-result-object v0

    #@4
    return-object v0
.end method

.method public getType()Ljava/lang/Class;
    .locals 1

    #@0
    .prologue
    .line 129
    const-class v0, Landroid/graphics/PointF;

    #@2
    return-object v0
.end method

.method public getValue(F)Ljava/lang/Object;
    .locals 9
    .param p1, "fraction"    # F

    #@0
    .prologue
    const/4 v8, 0x0

    #@1
    const/high16 v7, 0x3f800000    # 1.0f

    #@3
    const/4 v6, 0x0

    #@4
    .line 66
    iget-object v5, p0, Landroid/animation/PathKeyframes;->mKeyframeData:[F

    #@6
    array-length v5, v5

    #@7
    div-int/lit8 v4, v5, 0x3

    #@9
    .line 67
    .local v4, "numPoints":I
    cmpg-float v5, p1, v6

    #@b
    if-gez v5, :cond_0

    #@d
    .line 68
    const/4 v5, 0x1

    #@e
    invoke-direct {p0, p1, v8, v5}, Landroid/animation/PathKeyframes;->interpolateInRange(FII)Landroid/graphics/PointF;

    #@11
    move-result-object v5

    #@12
    return-object v5

    #@13
    .line 69
    :cond_0
    cmpl-float v5, p1, v7

    #@15
    if-lez v5, :cond_1

    #@17
    .line 70
    add-int/lit8 v5, v4, -0x2

    #@19
    add-int/lit8 v6, v4, -0x1

    #@1b
    invoke-direct {p0, p1, v5, v6}, Landroid/animation/PathKeyframes;->interpolateInRange(FII)Landroid/graphics/PointF;

    #@1e
    move-result-object v5

    #@1f
    return-object v5

    #@20
    .line 71
    :cond_1
    cmpl-float v5, p1, v6

    #@22
    if-nez v5, :cond_2

    #@24
    .line 72
    invoke-direct {p0, v8}, Landroid/animation/PathKeyframes;->pointForIndex(I)Landroid/graphics/PointF;

    #@27
    move-result-object v5

    #@28
    return-object v5

    #@29
    .line 73
    :cond_2
    cmpl-float v5, p1, v7

    #@2b
    if-nez v5, :cond_3

    #@2d
    .line 74
    add-int/lit8 v5, v4, -0x1

    #@2f
    invoke-direct {p0, v5}, Landroid/animation/PathKeyframes;->pointForIndex(I)Landroid/graphics/PointF;

    #@32
    move-result-object v5

    #@33
    return-object v5

    #@34
    .line 77
    :cond_3
    const/4 v1, 0x0

    #@35
    .line 78
    .local v1, "low":I
    add-int/lit8 v0, v4, -0x1

    #@37
    .line 80
    .local v0, "high":I
    :goto_0
    if-gt v1, v0, :cond_6

    #@39
    .line 81
    add-int v5, v1, v0

    #@3b
    div-int/lit8 v2, v5, 0x2

    #@3d
    .line 82
    .local v2, "mid":I
    iget-object v5, p0, Landroid/animation/PathKeyframes;->mKeyframeData:[F

    #@3f
    mul-int/lit8 v6, v2, 0x3

    #@41
    add-int/lit8 v6, v6, 0x0

    #@43
    aget v3, v5, v6

    #@45
    .line 84
    .local v3, "midFraction":F
    cmpg-float v5, p1, v3

    #@47
    if-gez v5, :cond_4

    #@49
    .line 85
    add-int/lit8 v0, v2, -0x1

    #@4b
    goto :goto_0

    #@4c
    .line 86
    :cond_4
    cmpl-float v5, p1, v3

    #@4e
    if-lez v5, :cond_5

    #@50
    .line 87
    add-int/lit8 v1, v2, 0x1

    #@52
    goto :goto_0

    #@53
    .line 89
    :cond_5
    invoke-direct {p0, v2}, Landroid/animation/PathKeyframes;->pointForIndex(I)Landroid/graphics/PointF;

    #@56
    move-result-object v5

    #@57
    return-object v5

    #@58
    .line 94
    .end local v2    # "mid":I
    .end local v3    # "midFraction":F
    :cond_6
    invoke-direct {p0, p1, v0, v1}, Landroid/animation/PathKeyframes;->interpolateInRange(FII)Landroid/graphics/PointF;

    #@5b
    move-result-object v5

    #@5c
    return-object v5
.end method

.method public invalidateCache()V
    .locals 0

    #@0
    .prologue
    .line 120
    return-void
.end method

.method public setEvaluator(Landroid/animation/TypeEvaluator;)V
    .locals 0
    .param p1, "evaluator"    # Landroid/animation/TypeEvaluator;

    #@0
    .prologue
    .line 124
    return-void
.end method

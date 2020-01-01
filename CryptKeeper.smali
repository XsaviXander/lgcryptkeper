.class public Lcom/android/settings/CryptKeeper;
.super Landroid/app/Activity;
.source "CryptKeeper.java"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;
.implements Landroid/view/View$OnKeyListener;
.implements Landroid/view/View$OnTouchListener;
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/settings/CryptKeeper$UnlockKnockCodeListener;,
        Lcom/android/settings/CryptKeeper$ValidationTask;,
        Lcom/android/settings/CryptKeeper$DecryptTask;,
        Lcom/android/settings/CryptKeeper$NonConfigurationInstanceState;
    }
.end annotation


# static fields
.field static final ACTION_EMERGENCY_DIAL:Ljava/lang/String; = "com.android.phone.EmergencyDialer.DIAL"

.field private static final COOL_DOWN_ATTEMPTS:I = 0xa

.field private static final DECRYPT_STATE:Ljava/lang/String; = "trigger_restart_framework"

.field private static final EXTRA_FORCE_VIEW:Ljava/lang/String; = "com.android.settings.CryptKeeper.DEBUG_FORCE_VIEW"

.field private static final FAKE_ATTEMPT_DELAY:I = 0x3e8

.field private static final FORCE_VIEW_ERROR:Ljava/lang/String; = "error"

.field private static final FORCE_VIEW_PASSWORD:Ljava/lang/String; = "password"

.field private static final FORCE_VIEW_PROGRESS:Ljava/lang/String; = "progress"

.field private static final MAX_FAILED_ATTEMPTS:I = 0x1e

.field private static final MAX_FAILED_ATTEMPTS_VZW:I = 0xa

.field private static final MESSAGE_NOTIFY:I = 0x2

.field private static final MESSAGE_UPDATE_PROGRESS:I = 0x1

.field protected static final MIN_LENGTH_BEFORE_REPORT:I = 0x4

.field public static final NO_EMOJI:Ljava/lang/String; = "com.lge.android.editmode.noEmoji"

.field private static final RIGHT_PATTERN_CLEAR_TIMEOUT_MS:I = 0x1f4

.field private static final STATE_COOLDOWN:Ljava/lang/String; = "cooldown"

.field private static final TAG:Ljava/lang/String; = "CryptKeeper"

.field private static final WRONG_PATTERN_CLEAR_TIMEOUT_MS:I = 0xc8

.field private static final sNavigationBarDisable:I = 0x70006

.field private static final sWidgetsToDisable:I = 0x3370000


# instance fields
.field private final SHOW_WARNING_MESSAGE_REMAIN_ATTEMPTS:I

.field private final SHOW_WARNING_MESSAGE_REMAIN_ATTEMPTS_GLOBAL:I

.field private final SHOW_WARNING_MESSAGE_REMAIN_ATTEMPTS_VZW:I

.field private mAudioManager:Landroid/media/AudioManager;

.field protected mChooseNewLockPatternListener:Lcom/android/internal/widget/LockPatternView$OnPatternListener;

.field private final mClearPatternRunnable:Ljava/lang/Runnable;

.field private mCooldown:Z

.field private mCorrupt:Z

.field private mEncryptionGoneBad:Z

.field private final mFakeUnlockAttemptRunnable:Ljava/lang/Runnable;

.field private final mHandler:Landroid/os/Handler;

.field private mIsVZW:Z

.field private mKnockCodeView:Lcom/android/settings/security/CryptKeeperKnockCodeArea;

.field private mLimitDialog:Lcom/android/settings/commonui/dialog/SettingsCommonDialog;

.field private mLockPatternView:Lcom/android/internal/widget/LockPatternView;

.field private mNotificationCountdown:I

.field private mPasswordEntry:Lcom/android/settings/widget/ImeAwareEditText;

.field private mPasswordString:Ljava/lang/String;

.field private mPhoneStateListener:Landroid/telephony/PhoneStateListener;

.field private mReleaseWakeLockCountdown:I

.field private mServiceState:Landroid/telephony/ServiceState;

.field private mStatusBar:Landroid/app/StatusBarManagerEx;

.field private mStatusString:I

.field private mValidationComplete:Z

.field private mValidationRequested:Z

.field mWakeLock:Landroid/os/PowerManager$WakeLock;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 105
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    const/4 v0, 0x0

    .line 142
    iput-boolean v0, p0, Lcom/android/settings/CryptKeeper;->mCooldown:Z

    .line 148
    iput v0, p0, Lcom/android/settings/CryptKeeper;->mNotificationCountdown:I

    .line 150
    iput v0, p0, Lcom/android/settings/CryptKeeper;->mReleaseWakeLockCountdown:I

    const v0, 0x7f120b7f

    .line 151
    iput v0, p0, Lcom/android/settings/CryptKeeper;->mStatusString:I

    .line 161
    new-instance v0, Lcom/android/settings/CryptKeeper$1;

    invoke-direct {v0, p0}, Lcom/android/settings/CryptKeeper$1;-><init>(Lcom/android/settings/CryptKeeper;)V

    iput-object v0, p0, Lcom/android/settings/CryptKeeper;->mFakeUnlockAttemptRunnable:Ljava/lang/Runnable;

    .line 171
    new-instance v0, Lcom/android/settings/CryptKeeper$2;

    invoke-direct {v0, p0}, Lcom/android/settings/CryptKeeper$2;-><init>(Lcom/android/settings/CryptKeeper;)V

    iput-object v0, p0, Lcom/android/settings/CryptKeeper;->mClearPatternRunnable:Ljava/lang/Runnable;

    const/4 v0, 0x4

    .line 179
    iput v0, p0, Lcom/android/settings/CryptKeeper;->SHOW_WARNING_MESSAGE_REMAIN_ATTEMPTS_VZW:I

    const/16 v1, 0x9

    .line 180
    iput v1, p0, Lcom/android/settings/CryptKeeper;->SHOW_WARNING_MESSAGE_REMAIN_ATTEMPTS_GLOBAL:I

    const-string v2, "VZW"

    .line 181
    invoke-static {v2}, Lcom/lge/settingslib/config/Config;->isCurrentOperator(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    iput v0, p0, Lcom/android/settings/CryptKeeper;->SHOW_WARNING_MESSAGE_REMAIN_ATTEMPTS:I

    const-string v0, "VZW"

    .line 197
    invoke-static {v0}, Lcom/lge/settingslib/config/Config;->isCurrentOperator(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/settings/CryptKeeper;->mIsVZW:Z

    .line 403
    new-instance v0, Lcom/android/settings/CryptKeeper$3;

    invoke-direct {v0, p0}, Lcom/android/settings/CryptKeeper$3;-><init>(Lcom/android/settings/CryptKeeper;)V

    iput-object v0, p0, Lcom/android/settings/CryptKeeper;->mHandler:Landroid/os/Handler;

    .line 843
    new-instance v0, Lcom/android/settings/CryptKeeper$6;

    invoke-direct {v0, p0}, Lcom/android/settings/CryptKeeper$6;-><init>(Lcom/android/settings/CryptKeeper;)V

    iput-object v0, p0, Lcom/android/settings/CryptKeeper;->mChooseNewLockPatternListener:Lcom/android/internal/widget/LockPatternView$OnPatternListener;

    .line 1191
    new-instance v0, Lcom/android/settings/CryptKeeper$8;

    invoke-direct {v0, p0}, Lcom/android/settings/CryptKeeper$8;-><init>(Lcom/android/settings/CryptKeeper;)V

    iput-object v0, p0, Lcom/android/settings/CryptKeeper;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    return-void
.end method

.method static synthetic access$000(Lcom/android/settings/CryptKeeper;Ljava/lang/Integer;)V
    .locals 0

    .line 105
    invoke-direct {p0, p1}, Lcom/android/settings/CryptKeeper;->handleBadAttempt(Ljava/lang/Integer;)V

    return-void
.end method

.method static synthetic access$100(Lcom/android/settings/CryptKeeper;)Lcom/android/internal/widget/LockPatternView;
    .locals 0

    .line 105
    iget-object p0, p0, Lcom/android/settings/CryptKeeper;->mLockPatternView:Lcom/android/internal/widget/LockPatternView;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/android/settings/CryptKeeper;)V
    .locals 0

    .line 105
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->setupUi()V

    return-void
.end method

.method static synthetic access$1100(Lcom/android/settings/CryptKeeper;)V
    .locals 0

    .line 105
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->updateProgress()V

    return-void
.end method

.method static synthetic access$1200(Lcom/android/settings/CryptKeeper;)V
    .locals 0

    .line 105
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->notifyUser()V

    return-void
.end method

.method static synthetic access$1300(Lcom/android/settings/CryptKeeper;)I
    .locals 0

    .line 105
    iget p0, p0, Lcom/android/settings/CryptKeeper;->mStatusString:I

    return p0
.end method

.method static synthetic access$1302(Lcom/android/settings/CryptKeeper;I)I
    .locals 0

    .line 105
    iput p1, p0, Lcom/android/settings/CryptKeeper;->mStatusString:I

    return p1
.end method

.method static synthetic access$1400(Lcom/android/settings/CryptKeeper;Z)V
    .locals 0

    .line 105
    invoke-direct {p0, p1}, Lcom/android/settings/CryptKeeper;->setBackFunctionality(Z)V

    return-void
.end method

.method static synthetic access$1500(Lcom/android/settings/CryptKeeper;)V
    .locals 0

    .line 105
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->setDefatulEmergnecyCallbutton()V

    return-void
.end method

.method static synthetic access$1600(Lcom/android/settings/CryptKeeper;)V
    .locals 0

    .line 105
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->passwordEntryInit()V

    return-void
.end method

.method static synthetic access$1700(Lcom/android/settings/CryptKeeper;)Z
    .locals 0

    .line 105
    iget-boolean p0, p0, Lcom/android/settings/CryptKeeper;->mCooldown:Z

    return p0
.end method

.method static synthetic access$1800(Lcom/android/settings/CryptKeeper;)V
    .locals 0

    .line 105
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->cooldown()V

    return-void
.end method

.method static synthetic access$200(Lcom/android/settings/CryptKeeper;)V
    .locals 0

    .line 105
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->beginAttempt()V

    return-void
.end method

.method static synthetic access$2100(Lcom/android/settings/CryptKeeper;Landroid/view/View;)V
    .locals 0

    .line 105
    invoke-direct {p0, p1}, Lcom/android/settings/CryptKeeper;->fakeUnlockAttempt(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$2300(Lcom/android/settings/CryptKeeper;)V
    .locals 0

    .line 105
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->takeEmergencyCallAction()V

    return-void
.end method

.method static synthetic access$2402(Lcom/android/settings/CryptKeeper;Landroid/telephony/ServiceState;)Landroid/telephony/ServiceState;
    .locals 0

    .line 105
    iput-object p1, p0, Lcom/android/settings/CryptKeeper;->mServiceState:Landroid/telephony/ServiceState;

    return-object p1
.end method

.method static synthetic access$2500(Lcom/android/settings/CryptKeeper;)V
    .locals 0

    .line 105
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->updateEmergencyCallButtonState()V

    return-void
.end method

.method static synthetic access$2600(Lcom/android/settings/CryptKeeper;)Lcom/android/settings/security/CryptKeeperKnockCodeArea;
    .locals 0

    .line 105
    iget-object p0, p0, Lcom/android/settings/CryptKeeper;->mKnockCodeView:Lcom/android/settings/security/CryptKeeperKnockCodeArea;

    return-object p0
.end method

.method static synthetic access$300(Lcom/android/settings/CryptKeeper;)Z
    .locals 0

    .line 105
    iget-boolean p0, p0, Lcom/android/settings/CryptKeeper;->mIsVZW:Z

    return p0
.end method

.method static synthetic access$400(Lcom/android/settings/CryptKeeper;)Ljava/lang/Runnable;
    .locals 0

    .line 105
    iget-object p0, p0, Lcom/android/settings/CryptKeeper;->mClearPatternRunnable:Ljava/lang/Runnable;

    return-object p0
.end method

.method static synthetic access$500(Lcom/android/settings/CryptKeeper;)Ljava/lang/String;
    .locals 0

    .line 105
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->getMDMPolicyPath()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$600(Lcom/android/settings/CryptKeeper;Z)V
    .locals 0

    .line 105
    invoke-direct {p0, p1}, Lcom/android/settings/CryptKeeper;->showFactoryReset(Z)V

    return-void
.end method

.method static synthetic access$702(Lcom/android/settings/CryptKeeper;Z)Z
    .locals 0

    .line 105
    iput-boolean p1, p0, Lcom/android/settings/CryptKeeper;->mValidationComplete:Z

    return p1
.end method

.method static synthetic access$802(Lcom/android/settings/CryptKeeper;Z)Z
    .locals 0

    .line 105
    iput-boolean p1, p0, Lcom/android/settings/CryptKeeper;->mEncryptionGoneBad:Z

    return p1
.end method

.method static synthetic access$902(Lcom/android/settings/CryptKeeper;Z)Z
    .locals 0

    .line 105
    iput-boolean p1, p0, Lcom/android/settings/CryptKeeper;->mCorrupt:Z

    return p1
.end method

.method private beginAttempt()V
    .locals 2

    const v0, 0x7f0a03b0

    .line 300
    invoke-virtual {p0, v0}, Lcom/android/settings/CryptKeeper;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f0a006c

    .line 301
    invoke-virtual {p0, v1}, Lcom/android/settings/CryptKeeper;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    const v1, 0x7f120e55

    .line 303
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 304
    invoke-virtual {p0}, Landroid/widget/TextView;->getVisibility()I

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x2

    :goto_0
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setLines(I)V

    const/4 p0, 0x0

    .line 305
    invoke-virtual {v0, p0, p0, p0, p0}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method private checkshowCountInAttempt()V
    .locals 2

    const-string/jumbo v0, "vold.failed_decrypt_count"

    .line 1215
    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    const-string v1, ""

    .line 1216
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 1219
    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/android/settings/CryptKeeper;->setAttempsText(I)V

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x0

    .line 1217
    invoke-direct {p0, v0}, Lcom/android/settings/CryptKeeper;->setAttempsText(I)V

    :goto_1
    return-void
.end method

.method private cooldown()V
    .locals 2

    .line 810
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mPasswordEntry:Lcom/android/settings/widget/ImeAwareEditText;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 811
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mPasswordEntry:Lcom/android/settings/widget/ImeAwareEditText;

    invoke-virtual {v0, v1}, Lcom/android/settings/widget/ImeAwareEditText;->setEnabled(Z)V

    .line 813
    :cond_0
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mLockPatternView:Lcom/android/internal/widget/LockPatternView;

    if-eqz v0, :cond_1

    .line 814
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mLockPatternView:Lcom/android/internal/widget/LockPatternView;

    invoke-virtual {v0, v1}, Lcom/android/internal/widget/LockPatternView;->setEnabled(Z)V

    .line 817
    :cond_1
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mKnockCodeView:Lcom/android/settings/security/CryptKeeperKnockCodeArea;

    if-eqz v0, :cond_2

    .line 818
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mKnockCodeView:Lcom/android/settings/security/CryptKeeperKnockCodeArea;

    invoke-virtual {v0, v1}, Lcom/android/settings/security/CryptKeeperKnockCodeArea;->setKnockCodeButtonEanbled(Z)V

    :cond_2
    const v0, 0x7f0a03b0

    .line 821
    invoke-virtual {p0, v0}, Lcom/android/settings/CryptKeeper;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    .line 822
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    const v0, 0x7f12032a

    .line 823
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(I)V

    return-void
.end method

.method private delayAudioNotification()V
    .locals 1

    const/16 v0, 0x14

    .line 1141
    iput v0, p0, Lcom/android/settings/CryptKeeper;->mNotificationCountdown:I

    return-void
.end method

.method private static disableCryptKeeperComponent(Landroid/content/Context;)V
    .locals 4

    .line 1172
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 1173
    new-instance v1, Landroid/content/ComponentName;

    const-class v2, Lcom/android/settings/CryptKeeper;

    invoke-direct {v1, p0, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string p0, "CryptKeeper"

    .line 1174
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Disabling component "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p0, 0x2

    const/4 v2, 0x1

    .line 1175
    invoke-virtual {v0, v1, p0, v2}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    return-void
.end method

.method private encryptionProgressInit()V
    .locals 3

    const-string v0, "CryptKeeper"

    const-string v1, "Encryption progress screen initializing."

    .line 702
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 703
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    if-nez v0, :cond_0

    const-string v0, "CryptKeeper"

    const-string v1, "Acquiring wakelock."

    .line 704
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "power"

    .line 705
    invoke-virtual {p0, v0}, Lcom/android/settings/CryptKeeper;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    const/16 v1, 0x1a

    const-string v2, "CryptKeeper"

    .line 706
    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/CryptKeeper;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 707
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->acquire()V

    :cond_0
    const v0, 0x7f0a0309

    .line 710
    invoke-virtual {p0, v0}, Lcom/android/settings/CryptKeeper;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    const/4 v0, 0x0

    .line 712
    invoke-direct {p0, v0}, Lcom/android/settings/CryptKeeper;->setBackFunctionality(Z)V

    .line 715
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->updateProgress()V

    return-void
.end method

.method private fakeUnlockAttempt(Landroid/view/View;)V
    .locals 2

    .line 839
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->beginAttempt()V

    .line 840
    iget-object p0, p0, Lcom/android/settings/CryptKeeper;->mFakeUnlockAttemptRunnable:Ljava/lang/Runnable;

    const-wide/16 v0, 0x3e8

    invoke-virtual {p1, p0, v0, v1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private getMDMPolicyPath()Ljava/lang/String;
    .locals 3

    const-string p0, "/mnt/product/persist-lg/lgmdm"

    const-string v0, "ro.treble.enabled"

    const/4 v1, 0x0

    .line 1418
    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    const-string v2, "ro.product.first_api_level"

    .line 1419
    invoke-static {v2, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v1

    if-eqz v0, :cond_0

    const/16 v0, 0x1c

    if-ge v1, v0, :cond_1

    const-string p0, "/mnt/vendor/persist-lg/lgmdm"

    goto :goto_0

    :cond_0
    const-string p0, "/persist-lg/lgmdm"

    .line 1429
    :cond_1
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "/check_for_policy.txt"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private getRemainAttempt()I
    .locals 1

    const-string/jumbo v0, "vold.failed_decrypt_count"

    .line 1314
    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1315
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 1316
    iget-boolean p0, p0, Lcom/android/settings/CryptKeeper;->mIsVZW:Z

    if-eqz p0, :cond_0

    const/16 p0, 0xa

    goto :goto_0

    :cond_0
    const/16 p0, 0x1e

    :goto_0
    sub-int/2addr p0, v0

    return p0
.end method

.method private getTelecomManager()Landroid/telecom/TelecomManager;
    .locals 1

    const-string/jumbo v0, "telecom"

    .line 1134
    invoke-virtual {p0, v0}, Lcom/android/settings/CryptKeeper;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/telecom/TelecomManager;

    return-object p0
.end method

.method private getTelephonyManager()Landroid/telephony/TelephonyManager;
    .locals 1

    const-string v0, "phone"

    .line 1130
    invoke-virtual {p0, v0}, Lcom/android/settings/CryptKeeper;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/telephony/TelephonyManager;

    return-object p0
.end method

.method private getWarningMessageTitleId()I
    .locals 1

    .line 1408
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->getRemainAttempt()I

    move-result p0

    const/4 v0, 0x1

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    const p0, 0x7f120334

    goto :goto_1

    :cond_1
    const p0, 0x7f12032d

    :goto_1
    return p0
.end method

.method private handleBadAttempt(Ljava/lang/Integer;)V
    .locals 6

    .line 310
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mLockPatternView:Lcom/android/internal/widget/LockPatternView;

    if-eqz v0, :cond_0

    .line 311
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mLockPatternView:Lcom/android/internal/widget/LockPatternView;

    sget-object v1, Lcom/android/internal/widget/LockPatternView$DisplayMode;->Wrong:Lcom/android/internal/widget/LockPatternView$DisplayMode;

    invoke-virtual {v0, v1}, Lcom/android/internal/widget/LockPatternView;->setDisplayMode(Lcom/android/internal/widget/LockPatternView$DisplayMode;)V

    .line 312
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mLockPatternView:Lcom/android/internal/widget/LockPatternView;

    iget-object v1, p0, Lcom/android/settings/CryptKeeper;->mClearPatternRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/android/internal/widget/LockPatternView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 313
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mLockPatternView:Lcom/android/internal/widget/LockPatternView;

    iget-object v1, p0, Lcom/android/settings/CryptKeeper;->mClearPatternRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/internal/widget/LockPatternView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 316
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0xa

    rem-int/2addr v0, v1

    const/4 v2, 0x1

    if-nez v0, :cond_1

    .line 317
    iput-boolean v2, p0, Lcom/android/settings/CryptKeeper;->mCooldown:Z

    .line 320
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->cooldown()V

    goto/16 :goto_1

    :cond_1
    const v0, 0x7f0a03b0

    .line 322
    invoke-virtual {p0, v0}, Lcom/android/settings/CryptKeeper;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const/4 v3, 0x0

    .line 323
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setSingleLine(Z)V

    const/4 v4, 0x0

    .line 324
    invoke-virtual {v0, v4, v4, v4, v4}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 326
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const v5, 0x7f120e46

    if-ltz v4, :cond_3

    .line 327
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v4

    rsub-int/lit8 v4, v4, 0x1e

    if-ge v4, v1, :cond_2

    const v1, 0x7f12032c

    .line 329
    invoke-virtual {p0, v1}, Lcom/android/settings/CryptKeeper;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    .line 330
    new-array v5, v2, [Ljava/lang/CharSequence;

    .line 331
    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v5, v3

    .line 330
    invoke-static {v1, v5}, Landroid/text/TextUtils;->expandTemplate(Ljava/lang/CharSequence;[Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v1

    .line 332
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 334
    :cond_2
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 337
    :cond_3
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(I)V

    .line 340
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/android/settings/CryptKeeper;->needToShowLimitPopup(I)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 341
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->showLimitPopup()V

    .line 344
    :cond_4
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mLockPatternView:Lcom/android/internal/widget/LockPatternView;

    if-eqz v0, :cond_5

    .line 345
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mLockPatternView:Lcom/android/internal/widget/LockPatternView;

    sget-object v1, Lcom/android/internal/widget/LockPatternView$DisplayMode;->Wrong:Lcom/android/internal/widget/LockPatternView$DisplayMode;

    invoke-virtual {v0, v1}, Lcom/android/internal/widget/LockPatternView;->setDisplayMode(Lcom/android/internal/widget/LockPatternView$DisplayMode;)V

    .line 346
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mLockPatternView:Lcom/android/internal/widget/LockPatternView;

    invoke-virtual {v0, v2}, Lcom/android/internal/widget/LockPatternView;->setEnabled(Z)V

    .line 350
    :cond_5
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mPasswordEntry:Lcom/android/settings/widget/ImeAwareEditText;

    if-eqz v0, :cond_6

    .line 351
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mPasswordEntry:Lcom/android/settings/widget/ImeAwareEditText;

    invoke-virtual {v0, v2}, Lcom/android/settings/widget/ImeAwareEditText;->setEnabled(Z)V

    .line 352
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mPasswordEntry:Lcom/android/settings/widget/ImeAwareEditText;

    invoke-virtual {v0}, Lcom/android/settings/widget/ImeAwareEditText;->scheduleShowSoftInput()V

    .line 353
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mPasswordEntry:Lcom/android/settings/widget/ImeAwareEditText;

    invoke-virtual {v0}, Lcom/android/settings/widget/ImeAwareEditText;->requestFocus()Z

    .line 356
    :cond_6
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mKnockCodeView:Lcom/android/settings/security/CryptKeeperKnockCodeArea;

    if-eqz v0, :cond_7

    .line 357
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mKnockCodeView:Lcom/android/settings/security/CryptKeeperKnockCodeArea;

    invoke-virtual {v0, v2}, Lcom/android/settings/security/CryptKeeperKnockCodeArea;->setKnockCodeButtonEanbled(Z)V

    .line 361
    :cond_7
    :goto_1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ltz v0, :cond_8

    .line 362
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result p1

    invoke-direct {p0, p1}, Lcom/android/settings/CryptKeeper;->setAttempsText(I)V

    :cond_8
    return-void
.end method

.method private hasMultipleEnabledIMEsOrSubtypes(Landroid/view/inputmethod/InputMethodManager;Z)Z
    .locals 7

    .line 953
    invoke-virtual {p1}, Landroid/view/inputmethod/InputMethodManager;->getEnabledInputMethodList()Ljava/util/List;

    move-result-object p0

    .line 958
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v0, 0x0

    move v1, v0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_6

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/inputmethod/InputMethodInfo;

    if-le v1, v3, :cond_1

    return v3

    .line 964
    :cond_1
    invoke-virtual {p1, v2, v3}, Landroid/view/inputmethod/InputMethodManager;->getEnabledInputMethodSubtypeList(Landroid/view/inputmethod/InputMethodInfo;Z)Ljava/util/List;

    move-result-object v2

    .line 966
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_2

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 972
    :cond_2
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    move v5, v0

    :cond_3
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/view/inputmethod/InputMethodSubtype;

    .line 973
    invoke-virtual {v6}, Landroid/view/inputmethod/InputMethodSubtype;->isAuxiliary()Z

    move-result v6

    if-eqz v6, :cond_3

    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 977
    :cond_4
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    sub-int/2addr v2, v5

    if-gtz v2, :cond_5

    if-eqz p2, :cond_0

    if-le v5, v3, :cond_0

    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_6
    if-gt v1, v3, :cond_7

    const/4 p0, 0x0

    .line 991
    invoke-virtual {p1, p0, v0}, Landroid/view/inputmethod/InputMethodManager;->getEnabledInputMethodSubtypeList(Landroid/view/inputmethod/InputMethodInfo;Z)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    if-le p0, v3, :cond_8

    :cond_7
    move v0, v3

    :cond_8
    return v0
.end method

.method private hideNavigationBar()V
    .locals 1

    .line 1207
    invoke-virtual {p0}, Lcom/android/settings/CryptKeeper;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    const/16 v0, 0x1006

    .line 1211
    invoke-virtual {p0, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    return-void
.end method

.method private isDebugView()Z
    .locals 1

    .line 437
    invoke-virtual {p0}, Lcom/android/settings/CryptKeeper;->getIntent()Landroid/content/Intent;

    move-result-object p0

    const-string v0, "com.android.settings.CryptKeeper.DEBUG_FORCE_VIEW"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private isDebugView(Ljava/lang/String;)Z
    .locals 1

    .line 442
    invoke-virtual {p0}, Lcom/android/settings/CryptKeeper;->getIntent()Landroid/content/Intent;

    move-result-object p0

    const-string v0, "com.android.settings.CryptKeeper.DEBUG_FORCE_VIEW"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method private isEmergencyCallCapable()Z
    .locals 1

    .line 1100
    invoke-virtual {p0}, Lcom/android/settings/CryptKeeper;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    sget v0, Lcom/android/internal/R$bool;->config_voice_capable:I

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p0

    if-eqz p0, :cond_0

    const-string p0, "SB"

    invoke-static {p0}, Lcom/lge/settingslib/config/Config;->isCurrentOperator(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static synthetic lambda$null$3(Lcom/android/settings/CryptKeeper;Landroid/view/View;)V
    .locals 2

    .line 1393
    new-instance p1, Landroid/content/Intent;

    const-string v0, "com.android.internal.intent.action.REQUEST_SHUTDOWN"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v0, "android.intent.extra.KEY_CONFIRM"

    const/4 v1, 0x1

    .line 1394
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p1

    const/high16 v0, 0x10000000

    .line 1395
    invoke-virtual {p1, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    move-result-object p1

    .line 1396
    invoke-virtual {p0, p1}, Lcom/android/settings/CryptKeeper;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public static synthetic lambda$setImeSwitcherIcon$0(Lcom/android/settings/CryptKeeper;Landroid/view/inputmethod/InputMethodManager;)V
    .locals 1

    .line 1294
    iget-object p0, p0, Lcom/android/settings/CryptKeeper;->mPasswordEntry:Lcom/android/settings/widget/ImeAwareEditText;

    invoke-virtual {p0}, Lcom/android/settings/widget/ImeAwareEditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object p0

    const/4 v0, 0x1

    invoke-virtual {p1, p0, v0}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    return-void
.end method

.method public static synthetic lambda$updateCustomDialog$1(Lcom/android/settings/CryptKeeper;Landroid/view/View;)V
    .locals 2

    .line 1360
    check-cast p1, Landroid/widget/CheckBox;

    .line 1361
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mLimitDialog:Lcom/android/settings/commonui/dialog/SettingsCommonDialog;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mLimitDialog:Lcom/android/settings/commonui/dialog/SettingsCommonDialog;

    invoke-virtual {v0}, Lcom/android/settings/commonui/dialog/SettingsCommonDialog;->getPositiveButton()Landroid/widget/Button;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 1362
    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    .line 1364
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->getMDMPolicyPath()Ljava/lang/String;

    move-result-object v0

    .line 1366
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1367
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p1, "CryptKeeper"

    const-string v0, "MDM block factory reset"

    .line 1368
    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    .line 1372
    :cond_0
    iget-object p0, p0, Lcom/android/settings/CryptKeeper;->mLimitDialog:Lcom/android/settings/commonui/dialog/SettingsCommonDialog;

    invoke-virtual {p0}, Lcom/android/settings/commonui/dialog/SettingsCommonDialog;->getPositiveButton()Landroid/widget/Button;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/widget/Button;->setEnabled(Z)V

    :cond_1
    return-void
.end method

.method static synthetic lambda$updateCustomDialog$2(Landroid/content/DialogInterface;I)V
    .locals 0

    const/4 p1, 0x1

    .line 1378
    invoke-static {p1}, Lcom/android/settings/common/SecurityHelper;->setCryptKeeperAcknowledge(Z)V

    .line 1379
    invoke-interface {p0}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method

.method public static synthetic lambda$updateCustomDialog$4(Lcom/android/settings/CryptKeeper;Landroid/content/DialogInterface;)V
    .locals 1

    const/4 p1, 0x0

    .line 1383
    invoke-static {p1}, Lcom/android/settings/common/SecurityHelper;->setCryptKeeperAcknowledge(Z)V

    .line 1384
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mLimitDialog:Lcom/android/settings/commonui/dialog/SettingsCommonDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mLimitDialog:Lcom/android/settings/commonui/dialog/SettingsCommonDialog;

    invoke-virtual {v0}, Lcom/android/settings/commonui/dialog/SettingsCommonDialog;->getPositiveButton()Landroid/widget/Button;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1385
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mLimitDialog:Lcom/android/settings/commonui/dialog/SettingsCommonDialog;

    invoke-virtual {v0}, Lcom/android/settings/commonui/dialog/SettingsCommonDialog;->getPositiveButton()Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1388
    :cond_0
    iget-object p1, p0, Lcom/android/settings/CryptKeeper;->mLimitDialog:Lcom/android/settings/commonui/dialog/SettingsCommonDialog;

    if-eqz p1, :cond_1

    .line 1389
    iget-object p1, p0, Lcom/android/settings/CryptKeeper;->mLimitDialog:Lcom/android/settings/commonui/dialog/SettingsCommonDialog;

    invoke-virtual {p1}, Lcom/android/settings/commonui/dialog/SettingsCommonDialog;->getNegativeButton()Landroid/widget/Button;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 1391
    new-instance v0, Lcom/android/settings/-$$Lambda$CryptKeeper$bEkm9z6sLI_u-wwKHT4_ZOHVC9s;

    invoke-direct {v0, p0}, Lcom/android/settings/-$$Lambda$CryptKeeper$bEkm9z6sLI_u-wwKHT4_ZOHVC9s;-><init>(Lcom/android/settings/CryptKeeper;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_1
    return-void
.end method

.method private launchEmergencyDialer()V
    .locals 2

    .line 1122
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.android.phone.EmergencyDialer.DIAL"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v1, 0x10800000

    .line 1123
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    const/4 v1, 0x1

    .line 1125
    invoke-direct {p0, v1}, Lcom/android/settings/CryptKeeper;->setBackFunctionality(Z)V

    .line 1126
    invoke-virtual {p0, v0}, Lcom/android/settings/CryptKeeper;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method private needToShowLimitPopup(I)Z
    .locals 2

    .line 1323
    iget-boolean v0, p0, Lcom/android/settings/CryptKeeper;->mIsVZW:Z

    if-eqz v0, :cond_0

    const/16 v0, 0xa

    goto :goto_0

    :cond_0
    const/16 v0, 0x1e

    :goto_0
    add-int/lit8 v1, v0, -0x1

    if-eq p1, v1, :cond_2

    .line 1325
    iget-boolean p0, p0, Lcom/android/settings/CryptKeeper;->mIsVZW:Z

    if-eqz p0, :cond_1

    add-int/lit8 v0, v0, -0x5

    if-ne p1, v0, :cond_1

    goto :goto_1

    :cond_1
    const/4 p0, 0x0

    goto :goto_2

    :cond_2
    :goto_1
    const/4 p0, 0x1

    :goto_2
    return p0
.end method

.method private notifyUser()V
    .locals 4

    .line 449
    iget v0, p0, Lcom/android/settings/CryptKeeper;->mNotificationCountdown:I

    if-lez v0, :cond_0

    .line 450
    iget v0, p0, Lcom/android/settings/CryptKeeper;->mNotificationCountdown:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/android/settings/CryptKeeper;->mNotificationCountdown:I

    goto :goto_0

    .line 451
    :cond_0
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mAudioManager:Landroid/media/AudioManager;

    if-eqz v0, :cond_1

    .line 458
    :try_start_0
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mAudioManager:Landroid/media/AudioManager;

    const/4 v1, 0x5

    const/16 v2, 0x64

    invoke-virtual {v0, v1, v2}, Landroid/media/AudioManager;->playSoundEffect(II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "CryptKeeper"

    .line 460
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "notifyUser: Exception while playing sound: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 464
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 465
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mHandler:Landroid/os/Handler;

    const-wide/16 v2, 0x1388

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 467
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 468
    iget v0, p0, Lcom/android/settings/CryptKeeper;->mReleaseWakeLockCountdown:I

    if-lez v0, :cond_2

    .line 469
    iget v0, p0, Lcom/android/settings/CryptKeeper;->mReleaseWakeLockCountdown:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/android/settings/CryptKeeper;->mReleaseWakeLockCountdown:I

    goto :goto_1

    .line 471
    :cond_2
    iget-object p0, p0, Lcom/android/settings/CryptKeeper;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {p0}, Landroid/os/PowerManager$WakeLock;->release()V

    :cond_3
    :goto_1
    return-void
.end method

.method private passwordEntryInit()V
    .locals 4

    const v0, 0x7f0a02ea

    .line 873
    invoke-virtual {p0, v0}, Lcom/android/settings/CryptKeeper;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/settings/widget/ImeAwareEditText;

    iput-object v0, p0, Lcom/android/settings/CryptKeeper;->mPasswordEntry:Lcom/android/settings/widget/ImeAwareEditText;

    .line 874
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mPasswordEntry:Lcom/android/settings/widget/ImeAwareEditText;

    if-eqz v0, :cond_0

    .line 875
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mPasswordEntry:Lcom/android/settings/widget/ImeAwareEditText;

    invoke-virtual {v0, p0}, Lcom/android/settings/widget/ImeAwareEditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 876
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mPasswordEntry:Lcom/android/settings/widget/ImeAwareEditText;

    invoke-virtual {v0}, Lcom/android/settings/widget/ImeAwareEditText;->requestFocus()Z

    .line 878
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mPasswordEntry:Lcom/android/settings/widget/ImeAwareEditText;

    invoke-virtual {v0, p0}, Lcom/android/settings/widget/ImeAwareEditText;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 879
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mPasswordEntry:Lcom/android/settings/widget/ImeAwareEditText;

    invoke-virtual {v0, p0}, Lcom/android/settings/widget/ImeAwareEditText;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 880
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mPasswordEntry:Lcom/android/settings/widget/ImeAwareEditText;

    const-string v1, "com.lge.android.editmode.noEmoji"

    invoke-virtual {v0, v1}, Lcom/android/settings/widget/ImeAwareEditText;->setPrivateImeOptions(Ljava/lang/String;)V

    .line 881
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mPasswordEntry:Lcom/android/settings/widget/ImeAwareEditText;

    invoke-virtual {v0, p0}, Lcom/android/settings/widget/ImeAwareEditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 882
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mPasswordEntry:Lcom/android/settings/widget/ImeAwareEditText;

    invoke-direct {p0, v0}, Lcom/android/settings/CryptKeeper;->remainPasswordText(Lcom/android/settings/widget/ImeAwareEditText;)V

    :cond_0
    const v0, 0x7f0a0274

    .line 886
    invoke-virtual {p0, v0}, Lcom/android/settings/CryptKeeper;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/internal/widget/LockPatternView;

    iput-object v0, p0, Lcom/android/settings/CryptKeeper;->mLockPatternView:Lcom/android/internal/widget/LockPatternView;

    .line 887
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mLockPatternView:Lcom/android/internal/widget/LockPatternView;

    if-eqz v0, :cond_1

    .line 888
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mLockPatternView:Lcom/android/internal/widget/LockPatternView;

    iget-object v1, p0, Lcom/android/settings/CryptKeeper;->mChooseNewLockPatternListener:Lcom/android/internal/widget/LockPatternView$OnPatternListener;

    invoke-virtual {v0, v1}, Lcom/android/internal/widget/LockPatternView;->setOnPatternListener(Lcom/android/internal/widget/LockPatternView$OnPatternListener;)V

    :cond_1
    const v0, 0x7f0a010b

    .line 891
    invoke-virtual {p0, v0}, Lcom/android/settings/CryptKeeper;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/settings/security/CryptKeeperKnockCodeArea;

    iput-object v0, p0, Lcom/android/settings/CryptKeeper;->mKnockCodeView:Lcom/android/settings/security/CryptKeeperKnockCodeArea;

    .line 892
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mKnockCodeView:Lcom/android/settings/security/CryptKeeperKnockCodeArea;

    if-eqz v0, :cond_2

    .line 893
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mKnockCodeView:Lcom/android/settings/security/CryptKeeperKnockCodeArea;

    new-instance v1, Lcom/android/settings/CryptKeeper$UnlockKnockCodeListener;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/android/settings/CryptKeeper$UnlockKnockCodeListener;-><init>(Lcom/android/settings/CryptKeeper;Lcom/android/settings/CryptKeeper$1;)V

    invoke-virtual {v0, v1}, Lcom/android/settings/security/CryptKeeperKnockCodeArea;->setOnKnockCodeListener(Lcom/android/settings/security/CryptKeeperKnockCodeArea$OnKnockCodeListener;)V

    .line 897
    :cond_2
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->getTelephonyManager()Landroid/telephony/TelephonyManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->isVoiceCapable()Z

    move-result v0

    if-nez v0, :cond_3

    const v0, 0x7f0a0166

    .line 898
    invoke-virtual {p0, v0}, Lcom/android/settings/CryptKeeper;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_3

    const-string v1, "CryptKeeper"

    const-string v2, "Removing the emergency Call button"

    .line 900
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v1, 0x8

    .line 901
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 905
    :cond_3
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->setImeSwitcherIcon()V

    .line 910
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    if-nez v0, :cond_4

    const-string v0, "CryptKeeper"

    const-string v1, "Acquiring wakelock."

    .line 911
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "power"

    .line 912
    invoke-virtual {p0, v0}, Lcom/android/settings/CryptKeeper;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    if-eqz v0, :cond_4

    const/16 v1, 0x1a

    const-string v2, "CryptKeeper"

    .line 914
    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/CryptKeeper;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 915
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->acquire()V

    const/16 v0, 0x60

    .line 918
    iput v0, p0, Lcom/android/settings/CryptKeeper;->mReleaseWakeLockCountdown:I

    .line 923
    :cond_4
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mKnockCodeView:Lcom/android/settings/security/CryptKeeperKnockCodeArea;

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mLockPatternView:Lcom/android/internal/widget/LockPatternView;

    if-nez v0, :cond_5

    iget-boolean v0, p0, Lcom/android/settings/CryptKeeper;->mCooldown:Z

    if-nez v0, :cond_5

    .line 925
    invoke-virtual {p0}, Lcom/android/settings/CryptKeeper;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 927
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mPasswordEntry:Lcom/android/settings/widget/ImeAwareEditText;

    if-eqz v0, :cond_5

    .line 928
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mPasswordEntry:Lcom/android/settings/widget/ImeAwareEditText;

    invoke-virtual {v0}, Lcom/android/settings/widget/ImeAwareEditText;->scheduleShowSoftInput()V

    .line 932
    :cond_5
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->checkshowCountInAttempt()V

    .line 933
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->updateEmergencyCallButtonState()V

    .line 934
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->showLimitPopupIfNeeded()V

    .line 936
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 937
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mHandler:Landroid/os/Handler;

    const-wide/32 v2, 0x1d4c0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 940
    invoke-virtual {p0}, Lcom/android/settings/CryptKeeper;->getWindow()Landroid/view/Window;

    move-result-object p0

    const/high16 v0, 0x480000

    invoke-virtual {p0, v0}, Landroid/view/Window;->addFlags(I)V

    return-void
.end method

.method private remainPasswordText(Lcom/android/settings/widget/ImeAwareEditText;)V
    .locals 1

    .line 1201
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mPasswordString:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 1202
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mPasswordString:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/android/settings/widget/ImeAwareEditText;->setText(Ljava/lang/CharSequence;)V

    .line 1203
    iget-object p0, p0, Lcom/android/settings/CryptKeeper;->mPasswordString:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    invoke-virtual {p1, p0}, Lcom/android/settings/widget/ImeAwareEditText;->setSelection(I)V

    :cond_0
    return-void
.end method

.method private final setAirplaneModeIfNecessary()V
    .locals 3

    .line 1041
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->getTelephonyManager()Landroid/telephony/TelephonyManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getLteOnCdmaMode()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_1

    const-string v0, "CryptKeeper"

    const-string v2, "Going into airplane mode."

    .line 1043
    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1044
    invoke-virtual {p0}, Lcom/android/settings/CryptKeeper;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v2, "airplane_mode_on"

    invoke-static {v0, v2, v1}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1045
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.intent.action.AIRPLANE_MODE"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "state"

    .line 1046
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1047
    sget-object v1, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    invoke-virtual {p0, v0, v1}, Lcom/android/settings/CryptKeeper;->sendBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)V

    :cond_1
    return-void
.end method

.method private setAttempsText(I)V
    .locals 6

    const v0, 0x7f0a006c

    .line 1224
    invoke-virtual {p0, v0}, Lcom/android/settings/CryptKeeper;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 1225
    iget-boolean v1, p0, Lcom/android/settings/CryptKeeper;->mIsVZW:Z

    if-eqz v1, :cond_0

    const/16 v1, 0xa

    goto :goto_0

    :cond_0
    const/16 v1, 0x1e

    :goto_0
    sub-int p1, v1, p1

    .line 1228
    iget v2, p0, Lcom/android/settings/CryptKeeper;->SHOW_WARNING_MESSAGE_REMAIN_ATTEMPTS:I

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-le p1, v2, :cond_1

    .line 1229
    invoke-virtual {p0}, Lcom/android/settings/CryptKeeper;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v2, 0x7f120c89

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    .line 1230
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v5, v4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v5, v3

    .line 1229
    invoke-virtual {p0, v2, v5}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    :cond_1
    const/16 v1, 0x8

    .line 1232
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    const v0, 0x7f0a03b0

    .line 1233
    invoke-virtual {p0, v0}, Lcom/android/settings/CryptKeeper;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f08022f

    .line 1234
    invoke-virtual {p0, v1}, Lcom/android/settings/CryptKeeper;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 1236
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 1237
    invoke-virtual {p0}, Lcom/android/settings/CryptKeeper;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v2, 0x7f120332

    new-array v3, v3, [Ljava/lang/Object;

    .line 1238
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v3, v4

    .line 1237
    invoke-virtual {p0, v2, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 p0, 0x0

    .line 1239
    invoke-virtual {v0, v1, p0, p0, p0}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    :goto_1
    return-void
.end method

.method private final setBackFunctionality(Z)V
    .locals 0

    if-eqz p1, :cond_0

    .line 832
    iget-object p0, p0, Lcom/android/settings/CryptKeeper;->mStatusBar:Landroid/app/StatusBarManagerEx;

    const/high16 p1, 0x3370000

    invoke-virtual {p0, p1}, Landroid/app/StatusBarManagerEx;->disable(I)V

    goto :goto_0

    .line 834
    :cond_0
    iget-object p0, p0, Lcom/android/settings/CryptKeeper;->mStatusBar:Landroid/app/StatusBarManagerEx;

    const/high16 p1, 0x3770000

    invoke-virtual {p0, p1}, Landroid/app/StatusBarManagerEx;->disable(I)V

    :goto_0
    return-void
.end method

.method private setDefatulEmergnecyCallbutton()V
    .locals 1

    .line 1113
    invoke-static {}, Lcom/lge/settingslib/utils/FeatureUtils;->isTablet()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "SB"

    invoke-static {v0}, Lcom/lge/settingslib/config/Config;->isCurrentOperator(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const v0, 0x7f0a0166

    .line 1114
    invoke-virtual {p0, v0}, Lcom/android/settings/CryptKeeper;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/Button;

    if-eqz p0, :cond_1

    const/16 v0, 0x8

    .line 1116
    invoke-virtual {p0, v0}, Landroid/widget/Button;->setVisibility(I)V

    :cond_1
    return-void
.end method

.method private setImeSwitcherIcon()V
    .locals 5

    .line 1279
    invoke-static {}, Lcom/android/settings/common/SecurityHelper;->getLockScreenType()I

    move-result v0

    if-nez v0, :cond_1

    const v0, 0x7f0a03f8

    .line 1280
    invoke-virtual {p0, v0}, Lcom/android/settings/CryptKeeper;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const-string v1, "input_method"

    .line 1281
    invoke-virtual {p0, v1}, Lcom/android/settings/CryptKeeper;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/inputmethod/InputMethodManager;

    if-eqz v0, :cond_0

    const/4 v2, 0x0

    .line 1283
    invoke-direct {p0, v1, v2}, Lcom/android/settings/CryptKeeper;->hasMultipleEnabledIMEsOrSubtypes(Landroid/view/inputmethod/InputMethodManager;Z)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1284
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 1285
    new-instance v2, Lcom/android/settings/CryptKeeper$9;

    invoke-direct {v2, p0, v1}, Lcom/android/settings/CryptKeeper$9;-><init>(Lcom/android/settings/CryptKeeper;Landroid/view/inputmethod/InputMethodManager;)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1292
    :cond_0
    iget-boolean v0, p0, Lcom/android/settings/CryptKeeper;->mCooldown:Z

    if-eqz v0, :cond_1

    .line 1293
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mHandler:Landroid/os/Handler;

    new-instance v2, Lcom/android/settings/-$$Lambda$CryptKeeper$p-96HV0CHmS5vofKuDRfKcqbC1Y;

    invoke-direct {v2, p0, v1}, Lcom/android/settings/-$$Lambda$CryptKeeper$p-96HV0CHmS5vofKuDRfKcqbC1Y;-><init>(Lcom/android/settings/CryptKeeper;Landroid/view/inputmethod/InputMethodManager;)V

    const-wide/16 v3, 0x0

    invoke-virtual {v0, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_1
    return-void
.end method

.method private setUpSystemFlag()V
    .locals 1

    .line 1244
    invoke-virtual {p0}, Lcom/android/settings/CryptKeeper;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    const/16 v0, 0x1f07

    .line 1245
    invoke-virtual {p0, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    const v0, 0x40002

    .line 1251
    invoke-static {p0, v0}, Lcom/lge/view/ViewUtil;->setLGSystemUiVisibility(Landroid/view/View;I)V

    return-void
.end method

.method private setupUi()V
    .locals 3

    .line 557
    iget-boolean v0, p0, Lcom/android/settings/CryptKeeper;->mEncryptionGoneBad:Z

    const v1, 0x7f0d0055

    if-nez v0, :cond_6

    const-string v0, "error"

    invoke-direct {p0, v0}, Lcom/android/settings/CryptKeeper;->isDebugView(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_3

    :cond_0
    const-string/jumbo v0, "vold.encrypt_progress"

    .line 563
    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, ""

    .line 564
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "progress"

    invoke-direct {p0, v0}, Lcom/android/settings/CryptKeeper;->isDebugView(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_1

    .line 568
    :cond_1
    iget-boolean v0, p0, Lcom/android/settings/CryptKeeper;->mValidationComplete:Z

    if-nez v0, :cond_3

    const-string v0, "password"

    invoke-direct {p0, v0}, Lcom/android/settings/CryptKeeper;->isDebugView(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    .line 641
    :cond_2
    iget-boolean v0, p0, Lcom/android/settings/CryptKeeper;->mValidationRequested:Z

    if-nez v0, :cond_5

    .line 643
    new-instance v0, Lcom/android/settings/CryptKeeper$ValidationTask;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/settings/CryptKeeper$ValidationTask;-><init>(Lcom/android/settings/CryptKeeper;Lcom/android/settings/CryptKeeper$1;)V

    check-cast v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/android/settings/CryptKeeper$ValidationTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    const/4 v0, 0x1

    .line 644
    iput-boolean v0, p0, Lcom/android/settings/CryptKeeper;->mValidationRequested:Z

    goto :goto_2

    .line 569
    :cond_3
    :goto_0
    new-instance v0, Lcom/android/settings/CryptKeeper$4;

    invoke-direct {v0, p0}, Lcom/android/settings/CryptKeeper$4;-><init>(Lcom/android/settings/CryptKeeper;)V

    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Void;

    .line 640
    invoke-virtual {v0, p0}, Lcom/android/settings/CryptKeeper$4;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_2

    .line 565
    :cond_4
    :goto_1
    invoke-virtual {p0, v1}, Lcom/android/settings/CryptKeeper;->setContentView(I)V

    .line 566
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->setUpSystemFlag()V

    .line 567
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->encryptionProgressInit()V

    :cond_5
    :goto_2
    return-void

    .line 558
    :cond_6
    :goto_3
    invoke-virtual {p0, v1}, Lcom/android/settings/CryptKeeper;->setContentView(I)V

    .line 559
    iget-boolean v0, p0, Lcom/android/settings/CryptKeeper;->mCorrupt:Z

    invoke-direct {p0, v0}, Lcom/android/settings/CryptKeeper;->showFactoryReset(Z)V

    return-void
.end method

.method private showFactoryReset(Z)V
    .locals 3

    const v0, 0x7f0a0171

    .line 726
    invoke-virtual {p0, v0}, Lcom/android/settings/CryptKeeper;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f0a0195

    .line 729
    invoke-virtual {p0, v0}, Lcom/android/settings/CryptKeeper;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    const/4 v1, 0x0

    .line 730
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 731
    new-instance v2, Lcom/android/settings/CryptKeeper$5;

    invoke-direct {v2, p0, p1}, Lcom/android/settings/CryptKeeper$5;-><init>(Lcom/android/settings/CryptKeeper;Z)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0a03b0

    const v2, 0x7f0a041f

    if-eqz p1, :cond_0

    .line 746
    invoke-virtual {p0, v2}, Lcom/android/settings/CryptKeeper;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    const v2, 0x7f12031b

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 747
    invoke-virtual {p0, v0}, Lcom/android/settings/CryptKeeper;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    const v0, 0x7f12031a

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 749
    :cond_0
    invoke-virtual {p0, v2}, Lcom/android/settings/CryptKeeper;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    const v2, 0x7f120322

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 750
    invoke-virtual {p0, v0}, Lcom/android/settings/CryptKeeper;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    const v0, 0x7f120321

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    :goto_0
    const p1, 0x7f0a009b

    .line 753
    invoke-virtual {p0, p1}, Lcom/android/settings/CryptKeeper;->findViewById(I)Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_1

    .line 756
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    return-void
.end method

.method private showLimitPopup()V
    .locals 5

    .line 1334
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->getRemainAttempt()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_1

    const v0, 0x7f120335

    goto :goto_1

    :cond_1
    const v0, 0x7f120339

    :goto_1
    const v2, 0x7f12032f

    .line 1338
    invoke-static {}, Lcom/android/settings/common/SecurityHelper;->getLockScreenType()I

    move-result v3

    const/4 v4, 0x2

    if-ne v3, v4, :cond_3

    if-eqz v1, :cond_2

    const v0, 0x7f120336

    goto :goto_2

    :cond_2
    const v0, 0x7f12033a

    :goto_2
    const v2, 0x7f120330

    goto :goto_5

    :cond_3
    const/4 v4, 0x3

    if-ne v3, v4, :cond_5

    if-eqz v1, :cond_4

    const v0, 0x7f120337

    goto :goto_3

    :cond_4
    const v0, 0x7f12033b

    :goto_3
    const v2, 0x7f120331

    goto :goto_5

    :cond_5
    const/4 v4, 0x4

    if-ne v3, v4, :cond_7

    if-eqz v1, :cond_6

    const v0, 0x7f120b81

    goto :goto_4

    :cond_6
    const v0, 0x7f120b82

    :goto_4
    const v2, 0x7f12032e

    .line 1353
    :cond_7
    :goto_5
    invoke-direct {p0, v0, v2}, Lcom/android/settings/CryptKeeper;->updateCustomDialog(II)V

    return-void
.end method

.method private showLimitPopupIfNeeded()V
    .locals 3

    .line 1302
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->getRemainAttempt()I

    move-result v0

    .line 1304
    iget-object v1, p0, Lcom/android/settings/CryptKeeper;->mLimitDialog:Lcom/android/settings/commonui/dialog/SettingsCommonDialog;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/settings/CryptKeeper;->mLimitDialog:Lcom/android/settings/commonui/dialog/SettingsCommonDialog;

    invoke-virtual {v1}, Lcom/android/settings/commonui/dialog/SettingsCommonDialog;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    :cond_0
    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    .line 1307
    iget-boolean v2, p0, Lcom/android/settings/CryptKeeper;->mIsVZW:Z

    if-eqz v2, :cond_1

    const/4 v2, 0x5

    if-ne v0, v2, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :cond_2
    :goto_0
    if-eqz v1, :cond_3

    .line 1308
    invoke-static {}, Lcom/android/settings/common/SecurityHelper;->isCryptKeeperAcknowledgeCheck()Z

    move-result v0

    if-nez v0, :cond_3

    .line 1309
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->showLimitPopup()V

    :cond_3
    return-void
.end method

.method private takeEmergencyCallAction()V
    .locals 2

    .line 1104
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->getTelecomManager()Landroid/telecom/TelecomManager;

    move-result-object v0

    .line 1105
    invoke-virtual {v0}, Landroid/telecom/TelecomManager;->isInCall()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 p0, 0x0

    .line 1106
    invoke-virtual {v0, p0}, Landroid/telecom/TelecomManager;->showInCallScreen(Z)V

    goto :goto_0

    .line 1108
    :cond_0
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->launchEmergencyDialer()V

    :goto_0
    return-void
.end method

.method private updateCustomDialog(II)V
    .locals 11

    .line 1357
    new-instance v0, Lcom/android/settings/commonui/CommonUIComponent;

    invoke-direct {v0, p0}, Lcom/android/settings/commonui/CommonUIComponent;-><init>(Landroid/content/Context;)V

    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->getWarningMessageTitleId()I

    move-result v1

    new-instance v5, Lcom/android/settings/-$$Lambda$CryptKeeper$o_9kBguGidFG87IbmrEL1joxGiI;

    invoke-direct {v5, p0}, Lcom/android/settings/-$$Lambda$CryptKeeper$o_9kBguGidFG87IbmrEL1joxGiI;-><init>(Lcom/android/settings/CryptKeeper;)V

    sget-object v9, Lcom/android/settings/-$$Lambda$CryptKeeper$ruV6Szu9wsWrPYMoSObZdjU_Mbw;->INSTANCE:Lcom/android/settings/-$$Lambda$CryptKeeper$ruV6Szu9wsWrPYMoSObZdjU_Mbw;

    const/4 v4, 0x0

    const v6, 0x7f120847

    const/4 v7, 0x0

    const v8, 0x7f120ba8

    const/4 v10, 0x0

    move v2, p1

    move v3, p2

    invoke-virtual/range {v0 .. v10}, Lcom/android/settings/commonui/CommonUIComponent;->initDonotShowConfirmDialog(IIIZLandroid/view/View$OnClickListener;ILandroid/content/DialogInterface$OnClickListener;ILandroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnCancelListener;)Lcom/android/settings/commonui/dialog/SettingsCommonDialog;

    move-result-object p1

    iput-object p1, p0, Lcom/android/settings/CryptKeeper;->mLimitDialog:Lcom/android/settings/commonui/dialog/SettingsCommonDialog;

    .line 1381
    iget-object p1, p0, Lcom/android/settings/CryptKeeper;->mLimitDialog:Lcom/android/settings/commonui/dialog/SettingsCommonDialog;

    new-instance p2, Lcom/android/settings/-$$Lambda$CryptKeeper$s3apfodIwRoU40-bRakv1C992-g;

    invoke-direct {p2, p0}, Lcom/android/settings/-$$Lambda$CryptKeeper$s3apfodIwRoU40-bRakv1C992-g;-><init>(Lcom/android/settings/CryptKeeper;)V

    invoke-virtual {p1, p2}, Lcom/android/settings/commonui/dialog/SettingsCommonDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 1401
    iget-object p1, p0, Lcom/android/settings/CryptKeeper;->mLimitDialog:Lcom/android/settings/commonui/dialog/SettingsCommonDialog;

    const/4 p2, -0x1

    const v0, 0x1010355

    invoke-virtual {p1, p2, v0}, Lcom/android/settings/commonui/dialog/SettingsCommonDialog;->setDialogTitleIconAttribute(II)V

    .line 1402
    iget-object p1, p0, Lcom/android/settings/CryptKeeper;->mLimitDialog:Lcom/android/settings/commonui/dialog/SettingsCommonDialog;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/android/settings/commonui/dialog/SettingsCommonDialog;->setCanceledOnTouchOutside(Z)V

    .line 1403
    iget-object p1, p0, Lcom/android/settings/CryptKeeper;->mLimitDialog:Lcom/android/settings/commonui/dialog/SettingsCommonDialog;

    invoke-virtual {p1, p2}, Lcom/android/settings/commonui/dialog/SettingsCommonDialog;->setCancelable(Z)V

    .line 1404
    iget-object p0, p0, Lcom/android/settings/CryptKeeper;->mLimitDialog:Lcom/android/settings/commonui/dialog/SettingsCommonDialog;

    invoke-virtual {p0}, Lcom/android/settings/commonui/dialog/SettingsCommonDialog;->show()V

    return-void
.end method

.method private updateEmergencyCallButtonState()V
    .locals 3

    const v0, 0x7f0a0166

    .line 1058
    invoke-virtual {p0, v0}, Lcom/android/settings/CryptKeeper;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    if-nez v0, :cond_0

    return-void

    .line 1064
    :cond_0
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->isEmergencyCallCapable()Z

    move-result v1

    if-eqz v1, :cond_4

    const-string v1, "AU"

    .line 1065
    invoke-static {v1}, Lcom/lge/settingslib/config/Config;->isCurrentCountry(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_2

    .line 1066
    iget-object v1, p0, Lcom/android/settings/CryptKeeper;->mServiceState:Landroid/telephony/ServiceState;

    if-nez v1, :cond_1

    return-void

    .line 1070
    :cond_1
    iget-object v1, p0, Lcom/android/settings/CryptKeeper;->mServiceState:Landroid/telephony/ServiceState;

    invoke-virtual {v1}, Landroid/telephony/ServiceState;->getState()I

    move-result v1

    if-ne v1, v2, :cond_2

    const p0, 0x7f120c4c

    .line 1071
    invoke-virtual {v0, p0}, Landroid/widget/Button;->setText(I)V

    .line 1072
    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    return-void

    :cond_2
    const/4 v1, 0x0

    .line 1076
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 1077
    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1078
    new-instance v1, Lcom/android/settings/CryptKeeper$7;

    invoke-direct {v1, p0}, Lcom/android/settings/CryptKeeper$7;-><init>(Lcom/android/settings/CryptKeeper;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1091
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->getTelecomManager()Landroid/telecom/TelecomManager;

    move-result-object p0

    invoke-virtual {p0}, Landroid/telecom/TelecomManager;->isInCall()Z

    move-result p0

    if-eqz p0, :cond_3

    const p0, 0x7f12033c

    goto :goto_0

    :cond_3
    const p0, 0x7f120333

    .line 1096
    :goto_0
    invoke-virtual {v0, p0}, Landroid/widget/Button;->setText(I)V

    return-void

    :cond_4
    const/16 p0, 0x8

    .line 1086
    invoke-virtual {v0, p0}, Landroid/widget/Button;->setVisibility(I)V

    return-void
.end method

.method private updateProgress()V
    .locals 8

    const-string/jumbo v0, "vold.encrypt_progress"

    .line 761
    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "error_partially_encrypted"

    .line 763
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 764
    invoke-direct {p0, v2}, Lcom/android/settings/CryptKeeper;->showFactoryReset(Z)V

    return-void

    :cond_0
    const v1, 0x7f120326

    .line 769
    invoke-virtual {p0, v1}, Lcom/android/settings/CryptKeeper;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    .line 773
    :try_start_0
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->isDebugView()Z

    move-result v3

    if-eqz v3, :cond_1

    const/16 v0, 0x32

    goto :goto_0

    :cond_1
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v3, "CryptKeeper"

    .line 775
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error parsing progress: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v2

    .line 777
    :goto_0
    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    const-string v3, "CryptKeeper"

    .line 780
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Encryption progress: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_1
    const-string/jumbo v3, "vold.encrypt_time_remaining"

    .line 782
    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 783
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    if-ltz v3, :cond_2

    add-int/lit8 v3, v3, 0x9

    .line 786
    div-int/lit8 v3, v3, 0xa

    mul-int/lit8 v3, v3, 0xa

    int-to-long v3, v3

    .line 787
    invoke-static {v3, v4}, Landroid/text/format/DateUtils;->formatElapsedTime(J)Ljava/lang/String;

    move-result-object v3
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    const v0, 0x7f120327

    .line 788
    :try_start_2
    invoke-virtual {p0, v0}, Lcom/android/settings/CryptKeeper;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    move-object v1, v0

    move-object v0, v3

    goto :goto_2

    :catch_1
    move-exception v0

    move-object v7, v3

    move-object v3, v0

    move-object v0, v7

    goto :goto_1

    :catch_2
    move-exception v3

    :goto_1
    const-string v4, "CryptKeeper"

    .line 792
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Error parsing progress: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    :goto_2
    const v3, 0x7f0a03b0

    .line 795
    invoke-virtual {p0, v3}, Lcom/android/settings/CryptKeeper;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    const/4 v4, 0x1

    if-eqz v3, :cond_3

    .line 797
    new-array v5, v4, [Ljava/lang/CharSequence;

    aput-object v0, v5, v2

    invoke-static {v1, v5}, Landroid/text/TextUtils;->expandTemplate(Ljava/lang/CharSequence;[Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 801
    :cond_3
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v4}, Landroid/os/Handler;->removeMessages(I)V

    .line 802
    iget-object p0, p0, Lcom/android/settings/CryptKeeper;->mHandler:Landroid/os/Handler;

    const-wide/16 v0, 0x3e8

    invoke-virtual {p0, v4, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0

    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public onBackPressed()V
    .locals 0

    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 1187
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    const/4 p1, 0x5

    .line 1188
    invoke-virtual {p0, p1}, Lcom/android/settings/CryptKeeper;->setRequestedOrientation(I)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4

    .line 486
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/4 v0, 0x1

    .line 487
    invoke-virtual {p0, v0}, Lcom/android/settings/CryptKeeper;->setRequestedOrientation(I)V

    .line 489
    invoke-static {}, Lcom/lge/settingslib/utils/FeatureUtils;->isSupportNotch()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 490
    invoke-virtual {p0, v0}, Lcom/android/settings/CryptKeeper;->requestWindowFeature(I)Z

    .line 493
    :cond_0
    invoke-virtual {p0}, Lcom/android/settings/CryptKeeper;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/16 v2, 0x400

    invoke-virtual {v1, v2, v2}, Landroid/view/Window;->setFlags(II)V

    const-string/jumbo v1, "vold.decrypt"

    .line 496
    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 497
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->isDebugView()Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, ""

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string/jumbo v2, "trigger_restart_framework"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 498
    :cond_1
    invoke-static {p0}, Lcom/android/settings/CryptKeeper;->disableCryptKeeperComponent(Landroid/content/Context;)V

    .line 506
    invoke-virtual {p0}, Lcom/android/settings/CryptKeeper;->finish()V

    return-void

    .line 512
    :cond_2
    invoke-virtual {p0}, Lcom/android/settings/CryptKeeper;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-string/jumbo v2, "statusbar"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/StatusBarManagerEx;

    iput-object v1, p0, Lcom/android/settings/CryptKeeper;->mStatusBar:Landroid/app/StatusBarManagerEx;

    .line 513
    iget-object v1, p0, Lcom/android/settings/CryptKeeper;->mStatusBar:Landroid/app/StatusBarManagerEx;

    const/high16 v2, 0x3370000

    const v3, 0x70006

    invoke-virtual {v1, v2, v3}, Landroid/app/StatusBarManagerEx;->disable(II)V

    if-eqz p1, :cond_3

    const-string v1, "cooldown"

    .line 516
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/android/settings/CryptKeeper;->mCooldown:Z

    .line 519
    :cond_3
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->setAirplaneModeIfNecessary()V

    const-string p1, "audio"

    .line 520
    invoke-virtual {p0, p1}, Lcom/android/settings/CryptKeeper;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/media/AudioManager;

    iput-object p1, p0, Lcom/android/settings/CryptKeeper;->mAudioManager:Landroid/media/AudioManager;

    .line 521
    invoke-virtual {p0}, Lcom/android/settings/CryptKeeper;->getLastNonConfigurationInstance()Ljava/lang/Object;

    move-result-object p1

    .line 522
    instance-of v1, p1, Lcom/android/settings/CryptKeeper$NonConfigurationInstanceState;

    if-eqz v1, :cond_4

    .line 523
    check-cast p1, Lcom/android/settings/CryptKeeper$NonConfigurationInstanceState;

    .line 524
    iget-object p1, p1, Lcom/android/settings/CryptKeeper$NonConfigurationInstanceState;->wakelock:Landroid/os/PowerManager$WakeLock;

    iput-object p1, p0, Lcom/android/settings/CryptKeeper;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    const-string p1, "CryptKeeper"

    const-string v1, "Restoring wakelock from NonConfigurationInstanceState"

    .line 525
    invoke-static {p1, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 528
    :cond_4
    invoke-virtual {p0}, Lcom/android/settings/CryptKeeper;->getActionBar()Landroid/app/ActionBar;

    move-result-object p1

    if-eqz p1, :cond_5

    .line 530
    invoke-virtual {p0}, Lcom/android/settings/CryptKeeper;->getActionBar()Landroid/app/ActionBar;

    move-result-object p1

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 533
    :cond_5
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->getTelephonyManager()Landroid/telephony/TelephonyManager;

    move-result-object p1

    iget-object p0, p0, Lcom/android/settings/CryptKeeper;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    invoke-virtual {p1, p0, v0}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    return-void
.end method

.method public onDestroy()V
    .locals 4

    .line 673
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 674
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mStatusBar:Landroid/app/StatusBarManagerEx;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const-string v0, "CryptKeeper"

    const-string v2, "CryptKeeper destroyed, need release StatusBar locks"

    .line 675
    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 676
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mStatusBar:Landroid/app/StatusBarManagerEx;

    invoke-virtual {v0, v1}, Landroid/app/StatusBarManagerEx;->disable(I)V

    .line 679
    :cond_0
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    const-string v0, "CryptKeeper"

    const-string v3, "Releasing and destroying wakelock"

    .line 680
    invoke-static {v0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 681
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 682
    iput-object v2, p0, Lcom/android/settings/CryptKeeper;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 685
    :cond_1
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    if-eqz v0, :cond_2

    .line 686
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->getTelephonyManager()Landroid/telephony/TelephonyManager;

    move-result-object v0

    iget-object v3, p0, Lcom/android/settings/CryptKeeper;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    invoke-virtual {v0, v3, v1}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 689
    :cond_2
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mLimitDialog:Lcom/android/settings/commonui/dialog/SettingsCommonDialog;

    if-eqz v0, :cond_3

    .line 690
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mLimitDialog:Lcom/android/settings/commonui/dialog/SettingsCommonDialog;

    invoke-virtual {v0}, Lcom/android/settings/commonui/dialog/SettingsCommonDialog;->dismiss()V

    .line 692
    :cond_3
    iput-object v2, p0, Lcom/android/settings/CryptKeeper;->mLimitDialog:Lcom/android/settings/commonui/dialog/SettingsCommonDialog;

    return-void
.end method

.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 3

    const/4 p3, 0x0

    if-eqz p2, :cond_1

    const/4 v0, 0x6

    if-ne p2, v0, :cond_0

    goto :goto_0

    :cond_0
    return p3

    .line 998
    :cond_1
    :goto_0
    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p2

    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p2

    .line 1000
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_2

    return v1

    :cond_2
    const/4 v0, 0x0

    .line 1005
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1009
    iget-object p1, p0, Lcom/android/settings/CryptKeeper;->mPasswordEntry:Lcom/android/settings/widget/ImeAwareEditText;

    invoke-virtual {p1, p3}, Lcom/android/settings/widget/ImeAwareEditText;->setEnabled(Z)V

    .line 1010
    invoke-direct {p0, p3}, Lcom/android/settings/CryptKeeper;->setBackFunctionality(Z)V

    .line 1012
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p1

    const/4 v2, 0x4

    if-lt p1, v2, :cond_3

    .line 1013
    new-instance p1, Lcom/android/settings/CryptKeeper$DecryptTask;

    invoke-direct {p1, p0, v0}, Lcom/android/settings/CryptKeeper$DecryptTask;-><init>(Lcom/android/settings/CryptKeeper;Lcom/android/settings/CryptKeeper$1;)V

    new-array p0, v1, [Ljava/lang/String;

    aput-object p2, p0, p3

    invoke-virtual {p1, p0}, Lcom/android/settings/CryptKeeper$DecryptTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_1

    .line 1016
    :cond_3
    iget-object p1, p0, Lcom/android/settings/CryptKeeper;->mPasswordEntry:Lcom/android/settings/widget/ImeAwareEditText;

    invoke-direct {p0, p1}, Lcom/android/settings/CryptKeeper;->fakeUnlockAttempt(Landroid/view/View;)V

    :goto_1
    return v1
.end method

.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1146
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->delayAudioNotification()V

    const/4 p0, 0x0

    return p0
.end method

.method protected onResume()V
    .locals 0

    .line 1181
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 1182
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->hideNavigationBar()V

    return-void
.end method

.method public onRetainNonConfigurationInstance()Ljava/lang/Object;
    .locals 3

    .line 665
    new-instance v0, Lcom/android/settings/CryptKeeper$NonConfigurationInstanceState;

    iget-object v1, p0, Lcom/android/settings/CryptKeeper;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-direct {v0, v1}, Lcom/android/settings/CryptKeeper$NonConfigurationInstanceState;-><init>(Landroid/os/PowerManager$WakeLock;)V

    const-string v1, "CryptKeeper"

    const-string v2, "Handing wakelock off to NonConfigurationInstanceState"

    .line 666
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x0

    .line 667
    iput-object v1, p0, Lcom/android/settings/CryptKeeper;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    return-object v0
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1

    const-string v0, "cooldown"

    .line 538
    iget-boolean p0, p0, Lcom/android/settings/CryptKeeper;->mCooldown:Z

    invoke-virtual {p1, v0, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method public onStart()V
    .locals 0

    .line 548
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 549
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->setupUi()V

    return-void
.end method

.method public onStop()V
    .locals 2

    .line 650
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 651
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mPasswordEntry:Lcom/android/settings/widget/ImeAwareEditText;

    if-eqz v0, :cond_0

    .line 652
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mPasswordEntry:Lcom/android/settings/widget/ImeAwareEditText;

    invoke-virtual {v0}, Lcom/android/settings/widget/ImeAwareEditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/CryptKeeper;->mPasswordString:Ljava/lang/String;

    .line 654
    :cond_0
    iget-object v0, p0, Lcom/android/settings/CryptKeeper;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 655
    iget-object p0, p0, Lcom/android/settings/CryptKeeper;->mHandler:Landroid/os/Handler;

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeMessages(I)V

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 1163
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->delayAudioNotification()V

    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1152
    invoke-direct {p0}, Lcom/android/settings/CryptKeeper;->delayAudioNotification()V

    const/4 p0, 0x0

    return p0
.end method

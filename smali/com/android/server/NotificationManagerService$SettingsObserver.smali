.class Lcom/android/server/NotificationManagerService$SettingsObserver;
.super Landroid/database/ContentObserver;
.source "NotificationManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/NotificationManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SettingsObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/NotificationManagerService;


# direct methods
.method constructor <init>(Lcom/android/server/NotificationManagerService;Landroid/os/Handler;)V
    .registers 3
    .parameter
    .parameter "handler"

    .prologue
    .line 584
    iput-object p1, p0, Lcom/android/server/NotificationManagerService$SettingsObserver;->this$0:Lcom/android/server/NotificationManagerService;

    .line 585
    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 586
    return-void
.end method


# virtual methods
.method observe()V
    .registers 4

    .prologue
    .line 589
    iget-object v1, p0, Lcom/android/server/NotificationManagerService$SettingsObserver;->this$0:Lcom/android/server/NotificationManagerService;

    iget-object v1, v1, Lcom/android/server/NotificationManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 590
    .local v0, resolver:Landroid/content/ContentResolver;
    const-string v1, "notification_light_pulse"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 592
    invoke-virtual {p0}, Lcom/android/server/NotificationManagerService$SettingsObserver;->update()V

    .line 593
    return-void
.end method

.method public onChange(Z)V
    .registers 2
    .parameter "selfChange"

    .prologue
    .line 596
    invoke-virtual {p0}, Lcom/android/server/NotificationManagerService$SettingsObserver;->update()V

    .line 597
    return-void
.end method

.method public update()V
    .registers 4

    .prologue
    const/4 v0, 0x0

    .line 600
    iget-object v2, p0, Lcom/android/server/NotificationManagerService$SettingsObserver;->this$0:Lcom/android/server/NotificationManagerService;

    iget-object v2, v2, Lcom/android/server/NotificationManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 601
    .local v1, resolver:Landroid/content/ContentResolver;
    const-string v2, "notification_light_pulse"

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-eqz v2, :cond_12

    const/4 v0, 0x1

    .line 603
    .local v0, pulseEnabled:Z
    :cond_12
    iget-object v2, p0, Lcom/android/server/NotificationManagerService$SettingsObserver;->this$0:Lcom/android/server/NotificationManagerService;

    #getter for: Lcom/android/server/NotificationManagerService;->mNotificationPulseEnabled:Z
    invoke-static {v2}, Lcom/android/server/NotificationManagerService;->access$1500(Lcom/android/server/NotificationManagerService;)Z

    move-result v2

    if-eq v2, v0, :cond_24

    .line 604
    iget-object v2, p0, Lcom/android/server/NotificationManagerService$SettingsObserver;->this$0:Lcom/android/server/NotificationManagerService;

    #setter for: Lcom/android/server/NotificationManagerService;->mNotificationPulseEnabled:Z
    invoke-static {v2, v0}, Lcom/android/server/NotificationManagerService;->access$1502(Lcom/android/server/NotificationManagerService;Z)Z

    .line 605
    iget-object v2, p0, Lcom/android/server/NotificationManagerService$SettingsObserver;->this$0:Lcom/android/server/NotificationManagerService;

    #calls: Lcom/android/server/NotificationManagerService;->updateNotificationPulse()V
    invoke-static {v2}, Lcom/android/server/NotificationManagerService;->access$1300(Lcom/android/server/NotificationManagerService;)V

    .line 607
    :cond_24
    return-void
.end method

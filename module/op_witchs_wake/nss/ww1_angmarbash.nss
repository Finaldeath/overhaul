//::///////////////////////////////////////////////
//:: Witch Wake 1: Angmar's Door, OnBash
//:: WW1_AngmarBash.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Causes Angmar to respond to his door being
     bashed.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 4, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastDamager();
    object oAngmar = GetNearestObjectByTag("Angmar");
    object oBashWP = GetNearestObjectByTag("WP_AngmarDoorBash");
    int iAngmarBash = GetLocalInt(oPC, "AngmarBash");

    if (iAngmarBash == TRUE &&
        GetIsDead(oAngmar) == FALSE &&
        GetIsObjectValid(oAngmar) == TRUE)
    {
        //Track the duration of his hostility so he knows to temporarily stop
        //hammering on his anvil.
        SetLocalInt(oAngmar, "bHostile", TRUE);
        DelayCommand(12.1, SetLocalInt(oAngmar, "bHostile", FALSE));
        DelayCommand(12.2, AssignCommand(oAngmar, ClearAllActions(TRUE)));
        DelayCommand(12.3, SignalEvent(oAngmar, EventUserDefined(2001)));

        AssignCommand(oAngmar, ClearAllActions(TRUE));
        AssignCommand(oAngmar, SpeakString("Don't ye go bashing on me door, whelp!", TALKVOLUME_TALK));
        object oVoice = GetNearestObjectByTag("ww1_narrator189", oPC);
        SoundObjectPlay(oVoice);
        DelayCommand(25.0, SoundObjectStop(oVoice));
        AssignCommand(oAngmar, ActionMoveToObject(oBashWP, TRUE, 5.0));
        AssignCommand(oAngmar, SetIsTemporaryEnemy(oPC, oAngmar, TRUE, 12.0));

        SetLocalInt(oPC, "AngmarBash", TRUE);
    }
}

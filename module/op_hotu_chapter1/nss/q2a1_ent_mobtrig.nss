//::///////////////////////////////////////////////
//:: Name q2a1_ent_mobtrig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Trigger a little confrontation scene between
    a guard and some citizens when the Pc enters
    the trigger
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  July 9/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;

    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE)
    {
        SetLocalInt(OBJECT_SELF, "nTriggered", 1);
        object oCit1 = GetObjectByTag("q2acitizen1");
        object oCit2 = GetObjectByTag("q2acitizen2");
        object oCit3 = GetObjectByTag("q2acitizen3");
        object oCit4 = GetObjectByTag("q2acitizen4");
        object oCit5 = GetObjectByTag("q2acitizen5");
        object oGuard = GetObjectByTag("q2a1_mobguard");
        object oSound1 = GetObjectByTag("snd_q2a1mob1");
        object oSound2 = GetObjectByTag("snd_q2a1mob2");
        object oDisperse1 = GetObjectByTag("q2a1_disperse1");
        object oDisperse2 = GetObjectByTag("q2a1_disperse2");
        object oDisperse3 = GetObjectByTag("q2a1_disperse3");

        AssignCommand(oCit1, ActionPlayAnimation(ANIMATION_LOOPING_TALK_FORCEFUL, 1.0, 10.0));
        AssignCommand(oCit2, ActionPlayAnimation(ANIMATION_LOOPING_TALK_PLEADING, 1.0, 12.0));
        DelayCommand(1.0, AssignCommand(oCit3, ActionPlayAnimation(ANIMATION_LOOPING_TALK_FORCEFUL, 1.0, 10.0)));
        DelayCommand(1.5, AssignCommand(oCit4, ActionPlayAnimation(ANIMATION_LOOPING_TALK_FORCEFUL, 1.0, 10.0)));
        DelayCommand(2.0, AssignCommand(oCit5, ActionPlayAnimation(ANIMATION_LOOPING_TALK_PLEADING, 1.0, 10.0)));

        DelayCommand(3.0, AssignCommand(oCit1, SpeakStringByStrRef(83983)));

        DelayCommand(4.0, AssignCommand(oGuard, SpeakStringByStrRef(83984)));

        DelayCommand(6.0, AssignCommand(oCit3, SpeakStringByStrRef(83985 )));

        DelayCommand(8.0, AssignCommand(oGuard, SpeakStringByStrRef(83986 )));

        DelayCommand(10.0, AssignCommand(oCit4, SpeakStringByStrRef(83987 )));

        DelayCommand(12.0, AssignCommand(oCit1, ActionMoveToObject(oDisperse1)));
        DelayCommand(14.0, AssignCommand(oCit2, ActionMoveToObject(oDisperse2)));
        DelayCommand(15.0, AssignCommand(oCit3, ActionMoveToObject(oDisperse3)));
        DelayCommand(13.0, AssignCommand(oCit4, ActionMoveToObject(oDisperse3)));
        DelayCommand(16.0, AssignCommand(oCit5, ActionMoveToObject(oDisperse3)));

        DestroyObject(oSound1, 14.0);
        DestroyObject(oSound2, 14.0);
        DestroyObject(oCit1, 19.0);
        DestroyObject(oCit2, 19.0);
        DestroyObject(oCit3, 20.0);
        DestroyObject(oCit4, 21.0);
        DestroyObject(oCit5, 21.0);

    }
}

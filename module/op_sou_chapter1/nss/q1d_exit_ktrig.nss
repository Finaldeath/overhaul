//::///////////////////////////////////////////////
//:: Name q1d_exit_ktrig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
        First time this trigger is exited by
        a PC - display some heated dialog exchange
        between the mob and the kobolds...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 14/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetExitingObject();
    if (GetIsPC(oPC) == TRUE && GetLocalInt(OBJECT_SELF, "nExited") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nExited", 1);
        object oShaman = GetObjectByTag("q1dk_shaman");

        object oLodar = GetObjectByTag("q1dlodar");
        object oMob1 = GetObjectByTag("q1dmob1");

        AssignCommand(oLodar, SetFacingPoint(GetPosition(oShaman)));

        AssignCommand(oLodar, SpeakStringByStrRef(40357, TALKVOLUME_SHOUT));
        AssignCommand(oLodar, ActionPlayAnimation(ANIMATION_LOOPING_TALK_FORCEFUL, 1.0, 4.0));
        DelayCommand(1.0, AssignCommand(oMob1, SpeakStringByStrRef(40358, TALKVOLUME_SHOUT)));
        DelayCommand(2.0, AssignCommand(oShaman, SpeakStringByStrRef(40359, TALKVOLUME_SHOUT)));
        DelayCommand(2.0, AssignCommand(oPC, PlaySound("c_kobold_bat1")));
    }
}

//::///////////////////////////////////////////////
//:: Name: q2a1_ent_duertrg
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
Trigger guard reaction if PC crosses this trigger
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On:Nov 19/02
//:://////////////////////////////////////////////


void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE  && GetLocalInt(OBJECT_SELF, "nSpoken") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nSpoken", 1);
        object oGuard = GetNearestObjectByTag("q2a1_1_militia");
        AssignCommand(oGuard, SpeakStringByStrRef(3846, TALKVOLUME_SHOUT));
        AssignCommand(oGuard, ActionMoveToObject(oPC, TRUE));

    }
}

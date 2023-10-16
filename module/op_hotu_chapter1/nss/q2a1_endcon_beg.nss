//::///////////////////////////////////////////////
//:: beggar sit down
//:: q2a1_endcon_beg
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Beggar will sit down following conversation with
    guards - and leave after talking to a PC
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Nov 19/02
//:://////////////////////////////////////////////


void main()
{
    object oPC = GetPCSpeaker();
    if (GetIsPC(oPC) == TRUE)
    {
        if (GetLocalInt(OBJECT_SELF, "nGoldGiven") == 1)
        {
            AssignCommand(OBJECT_SELF, ActionRandomWalk());
            DestroyObject(OBJECT_SELF, 5.0);
        }
    }
    else
    {
        AssignCommand(OBJECT_SELF, PlayAnimation(ANIMATION_LOOPING_SIT_CROSS));
    }
}



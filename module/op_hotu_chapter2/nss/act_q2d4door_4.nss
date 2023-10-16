//::///////////////////////////////////////////////
//:: Name: act_q2d4door_4
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Make an Open Lock check vs DC 35 to open the door
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 6/03
//:://////////////////////////////////////////////


void main()
{
    //SetLocalInt(OBJECT_SELF, "nAttempts", GetLocalInt(OBJECT_SELF, "nAttempts") + 1);
    //Roll d20 modified by Intelligence modifier
    object oPC = GetPCSpeaker();
    if (d20() + GetSkillRank(SKILL_OPEN_LOCK, oPC) > 34)
    {
        SetLocalInt(OBJECT_SELF, "nOpen", 1);

    }

}


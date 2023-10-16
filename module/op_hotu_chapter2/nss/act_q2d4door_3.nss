//::///////////////////////////////////////////////
//:: Name: act_q2d4door_3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Add to the count of door openning attempts.
    Tracked for experience reward..

    Make an intelligence check vs DC 20 to open the door
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 6/03
//:://////////////////////////////////////////////


void main()
{
    SetLocalInt(OBJECT_SELF, "nAttempts", GetLocalInt(OBJECT_SELF, "nAttempts") + 1);
    //Roll d20 modified by Intelligence modifier
    object oPC = GetPCSpeaker();
    if (d20() + GetAbilityModifier(ABILITY_INTELLIGENCE, oPC) > 20)
    {
        SetLocalInt(OBJECT_SELF, "nOpen", 1);

    }

}


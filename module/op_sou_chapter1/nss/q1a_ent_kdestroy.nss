//::///////////////////////////////////////////////
//:: Name  q1a_ent_kdestroy
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Post Cutscene 1 - Kobold Destruction trigger
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 10/03
//:://////////////////////////////////////////////

void main()
{
     //if the first cutscene is over
    if (GetLocalInt(GetModule(), "X1_CUT1RUNNING") == 2)
    {
        object oKobold = GetEnteringObject();
        //kill any kobolds that step on the trigger 'running' for the door
        if (GetAppearanceType(oKobold) == APPEARANCE_TYPE_KOBOLD_A || GetAppearanceType(oKobold) == APPEARANCE_TYPE_KOBOLD_B || GetAppearanceType(oKobold) == APPEARANCE_TYPE_KOBOLD_CHIEF_A || GetAppearanceType(oKobold) == APPEARANCE_TYPE_KOBOLD_CHIEF_B || GetAppearanceType(oKobold) == APPEARANCE_TYPE_KOBOLD_SHAMAN_A || GetAppearanceType(oKobold) == APPEARANCE_TYPE_KOBOLD_SHAMAN_B)
        {
            DestroyObject(oKobold);
        }
    }
}

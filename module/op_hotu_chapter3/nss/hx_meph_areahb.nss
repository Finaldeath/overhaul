//::///////////////////////////////////////////////
//:: Name hx_meph_areahb
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will damage the PC if there is lava, or
     slow them if there is ice.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Sept 9, 2003
//:://////////////////////////////////////////////
#include "hx_inc_meph"
#include "x2_inc_cutscene"
void main()
{
    object oPC = GetFirstPC();
    int iType = GetLevelType(OBJECT_SELF);
    int iDamage = Random(30) + 10;
    int iCut = CutGetActiveCutsceneForObject(oPC);
    int iAchDifficulty;

 /*   if(iCut < 1)
    {
        if(GetArea(oPC) == OBJECT_SELF)
        {
            // Affect the PC with either damage or slowdown.
            while(GetIsObjectValid(oPC))
            {
                DoPCDamage(oPC, iDamage, iType);
                oPC = GetNextPC();
            }
        }
    }
*/
    while(GetIsObjectValid(oPC))
    {
        if(GetArea(oPC) == OBJECT_SELF)
        {
            // Affect the PC with either damage or slowdown.
            if(iCut < 1)
            {
                DoPCDamage(oPC, iDamage, iType);
                oPC = GetNextPC();
            }
            iAchDifficulty = GetLocalInt(GetModule(), "ach_meph_difficulty");

            //Check if the player changes the difficulty while in the area and voids the achievement
            if((iAchDifficulty == 3 || iAchDifficulty == 4) && (GetGameDifficulty() <= 2)){
                SetLocalInt(GetModule(), "ach_lower_difficulty", 1);
            } else if(iAchDifficulty <= 2 && GetGameDifficulty() > 2){
                SetLocalInt(GetModule(), "ach_lower_difficulty", 1);
            }
        }
        oPC = GetNextPC();
    }

}

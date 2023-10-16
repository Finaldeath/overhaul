//::///////////////////////////////////////////////
//:: Witchwork Conversation System: No Use Magic Device Condition
//:: WW_Abil_NoUseDev.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player is untrained in
    the Use Magic Device skill.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 8, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    string sResult = GetLocalString(OBJECT_SELF, "sWW_AbilityResult");
    int bHasSkill = GetHasSkill(SKILL_USE_MAGIC_DEVICE, oPC);

    if (sResult == "")
    {
        if (bHasSkill == FALSE)
        {
            return TRUE;
        }
        return FALSE;
    }
    return FALSE;
}

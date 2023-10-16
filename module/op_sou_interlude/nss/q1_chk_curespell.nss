//::///////////////////////////////////////////////
//:: Name q1_chk_curespell
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see if PC has cure light or minor wounds memorized
    (or useable).
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 12/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    talent tSpell = GetCreatureTalentBest(TALENT_CATEGORY_BENEFICIAL_HEALING_TOUCH, 20, GetPCSpeaker());
    return GetIsTalentValid(tSpell) && GetLevelByClass(CLASS_TYPE_CLERIC, GetPCSpeaker()) > 0;

    /*if (GetHasSpell(SPELL_CURE_LIGHT_WOUNDS, GetPCSpeaker()) > 0)
    {
        SetLocalInt(OBJECT_SELF, "SPELL", SPELL_CURE_LIGHT_WOUNDS);
        return TRUE;
    }
    if (GetHasSpell(SPELL_CURE_MINOR_WOUNDS, GetPCSpeaker()) > 0)
    {
        SetLocalInt(OBJECT_SELF, "SPELL", SPELL_CURE_MINOR_WOUNDS);
        return TRUE;
    }
    return FALSE;*/
}

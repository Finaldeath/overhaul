//::///////////////////////////////////////////////
//:: FileName q2d_at_portal1
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 6/27/2003 12:00:09 PM
//:://////////////////////////////////////////////
int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int nRoll = d20() + GetSkillRank(SKILL_SET_TRAP, oPC);
    if(nRoll >= 25)
    {
        FloatingTextStringOnCreature("*" + GetStringByStrRef(5352) + "*", oPC);
        SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(102));
        return TRUE;
    }
    else
    {
        FloatingTextStringOnCreature("*" + GetStringByStrRef(5353) + "*", oPC);
        return FALSE;
    }
}

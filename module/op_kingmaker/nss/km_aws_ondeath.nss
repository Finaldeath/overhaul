//::///////////////////////////////////////////////
//:: Name x2_def_ondeath
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default OnDeath script
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////

void main()
{
    effect eRez = EffectResurrection();
    effect eDeath = EffectDeath();
    int iFlag = GetLocalInt(OBJECT_SELF, "DEAD_XP_CHECK");

    if (iFlag == FALSE)
    {
        SetLocalInt(OBJECT_SELF, "DEAD_XP_CHECK", TRUE);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eRez, OBJECT_SELF);
        AssignCommand(GetModule(), ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDeath, OBJECT_SELF));
    }
}

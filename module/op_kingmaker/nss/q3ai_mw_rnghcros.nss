//::///////////////////////////////////////////////
//:: Sets the weapon type to heavy crossbow
//:: q3ai_mw_rnghcros
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The player picks 'heavy crossbow' as his magic weapon type
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 21, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF,"Q3AI_WEAPON_TYPE",81);
    //81=Heavy crossbow
}

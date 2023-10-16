//::///////////////////////////////////////////////
//:: Sets the weapon type to heavy flail
//:: q3ai_mw_blnthfll
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The player picks 'heavy flail' as his magic weapon type
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 20, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF,"Q3AI_WEAPON_TYPE",42);
    //42=Heavy Flail
}

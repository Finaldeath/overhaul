//::///////////////////////////////////////////////
//:: Sets the weapon type to scythe
//:: q3ai_mw_polscyth
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The player picks 'scythe' as his magic weapon type
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 21, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF,"Q3AI_WEAPON_TYPE",72);
    //72=Scythe
}

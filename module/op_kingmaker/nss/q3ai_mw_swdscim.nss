//::///////////////////////////////////////////////
//:: Sets the weapon type to Scimitar
//:: q3ai_mw_swdscim
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The player picks 'scimitar' as his magic weapon type
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 20, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF,"Q3AI_WEAPON_TYPE",31);
    //31=Scimitar
}
//::///////////////////////////////////////////////
//:: os_module_load
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On module load for Kingmaker
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////
//:: Modified By: Keith K2 Hayward
//:: Modified On: Sept 2004
//:://////////////////////////////////////////////

void main()
{
    //SetMaxHenchmen(3);
    SetLocalString(GetModule(),"NW_S_VERSION","1.57");
    SetLocalInt(GetModule(), "X2_L_XP2", 1);
}

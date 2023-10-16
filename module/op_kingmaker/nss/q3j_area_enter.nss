//::///////////////////////////////////////////////
//:: On Area Enter
//:: q3j_area_enter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On Area Enter for Kobold Caves
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    if(GetEnteringObject()==oPC
        && GetLocalInt(OBJECT_SELF,"OS_GRAIN")==0)
    {
        DoSinglePlayerAutoSave();
        SetLocalInt(OBJECT_SELF,"OS_GRAIN",10);
    }
}

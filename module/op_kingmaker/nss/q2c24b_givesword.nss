//::///////////////////////////////////////////////
//:: PC Gives Sword
//:: q2c24b_givesword
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    PC gives a short sword to the prisoner
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    object oSword = GetItemPossessedBy(oPC,"NW_WSWSS001");
//    object oPris = GetNearestObjectByTag("q2c24b_prisoner");
//    AssignCommand(oPC,ActionGiveItem(oSword,OBJECT_SELF))
    if(GetLocalInt(OBJECT_SELF,"Q2C24B_SWORDGIVEN")==0)
    {
        SetLocalInt(OBJECT_SELF,"Q2C24B_SWORDGIVEN",1);
        if(GetIsObjectValid(oSword))
        {
            DestroyObject(oSword);
        }
        CreateItemOnObject("nw_wswss001");
    }
}

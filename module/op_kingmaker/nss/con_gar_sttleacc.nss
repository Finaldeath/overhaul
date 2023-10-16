//::///////////////////////////////////////////////
//:: con_gar_sttleacc
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Take ten gold pieces and settle room account
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////
void main()
{
    object oPC = GetFirstPC();
    TakeGoldFromCreature(10,oPC,TRUE);
    SetLocalInt(OBJECT_SELF,"OS_SILVER_PAID",10);
}

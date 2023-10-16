//::///////////////////////////////////////////////
//:: Inventory Disturbed
//:: m2q6GEnergize04
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Items placed in the brazier are destroyed and
    their gold value is added to the golem's
    energy value.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 15, 2001
//:://////////////////////////////////////////////

void main()
{
    object oGolem = GetObjectByTag("M2Q06CWIZGOLEM04");
    object oItem = GetLastDisturbed();
    int nEnergy = GetGoldPieceValue(oItem);

    DestroyObject(oItem);
    SetLocalInt(oGolem,"NW_L_M2Q6GolemEnergy",GetLocalInt(oGolem,"NW_L_M2Q6GolemEnergy") + nEnergy);
}

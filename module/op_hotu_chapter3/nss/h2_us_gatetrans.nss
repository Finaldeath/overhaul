//::///////////////////////////////////////////////
//:: H2 Gatehouse Transition (OnUse)
//:: H2_Us_Gatehouse.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Area transition the party to the Gatehouse.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 13, 2003
//:://////////////////////////////////////////////

void main()
{
    object oClicker = GetLastUsedBy();
    object oTarget = GetObjectByTag("Gates_City");
    SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);
    AssignCommand(oClicker,JumpToObject(oTarget));
}
